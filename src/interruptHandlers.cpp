//
// Created by os on 5/4/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/pcb.hpp"
#include "../h/_buffer.hpp"
#include "../h/_print.hpp"
#include "../h/sem.hpp"
#include "../h/RiscV.hpp"

extern "C" void _halt();

namespace interruptHandlers {

    inline void handleExceptionInterrupt() {

        const uint64 volatile scause = RiscV::scauseR();
        switch(scause) {
            case RiscV::illegalInstr:
                KprintString("Exception: Illegal instruction\n"); break;
            case RiscV::illegalAddrW:
                KprintString("Exception: Illegal write address\n"); break;
            case RiscV::illegalAddrR:
                KprintString("Exception: Illegal read address\n"); break;
            default:
                KprintString("Exception: Unknown scause\n"); break;
        }

        const uint64 volatile stval = RiscV::stvalR();
        KprintString("stval: ");
        KprintInt(stval, 16);
        KprintString("\n");

        KprintString("scause: ");
        KprintInt(scause, 16);
        KprintString("\n");

        const uint64 volatile sstatus = RiscV::sstatusR();
        KprintString("sstatus: ");
        KprintInt(sstatus, 16);
        KprintString("\n");

        const uint64 volatile sepc = RiscV::sepcR();
        KprintString("sepc: ");
        KprintInt(sepc, 16);
        KprintString("\n");

        // flushing all accumulated data to console
        _buffer::outBufferFlush();
        RiscV::shutdown();
    }

    inline void handleConsoleInterrupt() {
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SEIP);
        uint64 sepc = RiscV::sepcR();
        uint64 sstatus = RiscV::sstatusR();
        //  console interrupt (supervisor external interrupt)
        if (plic_claim() == RiscV::HardwareEntries::IRQ_CONS){
            _buffer::inBufferFill();
        }
        plic_complete(CONSOLE_IRQ);
        RiscV::sstatusW(sstatus);
        RiscV::sepcW(sepc);
    }

    inline void handleTimerInterrupt() {
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SSIP);

        if (!PCB::runningThread) return;

        Scheduler::alarm();

        uint64 n = PCB::incCurPeriod();
        if (n >= PCB::runningThread->getTimeLeft()) {
            PCB::dispatch();
        }
    }

    inline void handleSystemCall(uint64 codeOp, uint64 a1, uint64 a2, uint64 a3, uint64 a4) {
        uint64 volatile retVal = -1;

        switch (codeOp) {
            case (uint64) RiscV::CodeOps::MEM_ALOC:
                retVal = (uint64) MemoryAllocator::mem_alloc((size_t) a1);
                break;
            case (uint64) RiscV::CodeOps::MEM_FREE:
                retVal = MemoryAllocator::mem_free((void *) a1);
                break;
            case (uint64) RiscV::CodeOps::THR_CREA:
                retVal = PCB::createThread((PCB **) a1,
                                           (void (*)(void *)) a2,
                                           (void *) a3,
                                           (uint64 *) a4);
                break;
            case (uint64) RiscV::CodeOps::THR_EXIT:
                retVal = PCB::exitThread();
                break;
            case (uint64) RiscV::CodeOps::THR_YIEL:
                PCB::dispatch();
                break;
            case (uint64) RiscV::CodeOps::SEM_OPEN:
                retVal = SEM::createSemaphore((SEM **) a1, (unsigned) a2);
                break;
            case (uint64) RiscV::CodeOps::SEM_CLOS:
                retVal = SEM::closeSemaphore((SEM *) a1);
                break;
            case (uint64) RiscV::CodeOps::SEM_WAIT:
                retVal = ((SEM *) a1)->wait();
                break;
            case (uint64) RiscV::CodeOps::SEM_SIGN:
                retVal = ((SEM *) a1)->signal();
                break;
            case (uint64) RiscV::CodeOps::SEM_TMDW:
                retVal = ((SEM *) a1)->timedWait((time_t) a2);
                break;
            case (uint64) RiscV::CodeOps::SEM_TRYW:
                retVal = ((SEM *) a1)->tryWait();
                break;
            case (uint64) RiscV::CodeOps::THR_SLEE:
                retVal = PCB::sleepThread((time_t) a1);
                break;
            case (uint64) RiscV::CodeOps::CON_GETC:
                retVal = (uint64) _buffer::inBuffer->getc();
                break;
            case (uint64) RiscV::CodeOps::CON_PUTC:
                _buffer::outBuffer->putc((char) a1);
                break;
            default:
                KprintString("SysCall: Unknown system call\n");
                return;
        }

        // change a0 reg value on stack
        __asm__ volatile ("mv t0, %0" : : "r"(retVal));
        __asm__ volatile ("sd t0, 80(fp)");
    }

    void handleSupervisorTrap(uint64 codeOp, uint64 a1, uint64 a2, uint64 a3, uint64 a4) {
        // get implicit args from aX regs
        uint64 volatile scause = RiscV::scauseR();
        uint64 volatile sepc = RiscV::sepcR();
        uint64 volatile sstatus = RiscV::sstatusR();

        switch(scause) {
            case RiscV::timer:
                handleTimerInterrupt(); break;
            case RiscV::hardware:
                handleConsoleInterrupt(); break;
            case RiscV::userCall:
            case RiscV::sysCall:
                sepc += 4;
                handleSystemCall(codeOp, a1, a2, a3, a4);
                break;
            default:
                handleExceptionInterrupt();
                return;
        }

        RiscV::sstatusW(sstatus);
        RiscV::sepcW(sepc);

    }


}


