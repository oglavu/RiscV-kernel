//
// Created by os on 5/4/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/_thread.hpp"
#include "../h/_buffer.hpp"
#include "../h/_print.hpp"
#include "../h/_sem.hpp"
#include "../h/RiscV.hpp"

extern "C" void _halt();

namespace interruptHandlers {

    inline void handleExceptionInterrupt() {
        const uint64 volatile stval = RiscV::stvalR();
        KprintString("stval: ");
        KprintInt(stval, 16);
        KprintString("\n");

        const uint64 volatile scause = RiscV::scauseR();
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
        _halt();
    }

    void handleConsoleInterrupt() {
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

        if (!_thread::runningThread) return;
        if (_sem::timed && _sem::timeAbs != 0) _sem::timeAbs--;

        if (_thread::sleepTimeFirst != 0) _thread::sleepTimeFirst--;
        else if (_thread::sleepList){
            _thread::sleepList->thread->unsuspend();
            Scheduler::put(_thread::sleepList->thread);
            int* toDel = (int*) _thread::sleepList;
            _thread::sleepList = _thread::sleepList->next;
            delete toDel;
            _thread::sleepTimeFirst = (_thread::sleepList) ? _thread::sleepList->timeRel : 0;
            if (_thread::sleepList) _thread::sleepList->timeRel = 0;
        }



        uint64 n = ++_thread::curPeriod;
        if (n >= _thread::runningThread->getPeriods()) {
            _thread::curPeriod = 0;
            _thread::dispatch();
        }
    }

    void handleSupervisorTrap() {
        // get implicit args from aX regs
        uint64 volatile codeOp = RiscV::a0R();
        uint64 volatile a1 = RiscV::a1R();
        uint64 volatile a2 = RiscV::a2R();
        uint64 volatile a3 = RiscV::a3R();
        uint64 volatile a4 = RiscV::a4R();


        // processable scauses
        enum causes: uint64 {
            timer = (uint64) 1 << 63 | 0x1,
            hardware = (uint64) 1 << 63 | 0x9,
            illegalInstr = (uint64) 0x2,
            illegalAddrW = (uint64) 0x7,
            illegalAddrR = (uint64) 0x5,
            userCall = (uint64) 0x8,
            sysCall = (uint64) 0x9
        };

        uint64 volatile scause = RiscV::scauseR();

        switch(scause) {
            case causes::illegalInstr:
                KprintString("Exception: Illegal instruction\n");
                handleExceptionInterrupt();
                return;
            case causes::illegalAddrR:
                KprintString("Exception: Illegal read address\n");
                handleExceptionInterrupt();
                return;
            case causes::illegalAddrW:
                KprintString("Exception: Illegal write address\n");
                handleExceptionInterrupt();
                return;

            case causes::timer:
                uint64 volatile sepc, sstatus;
                sepc = RiscV::sepcR();
                sstatus = RiscV::sstatusR();

                handleTimerInterrupt();

                RiscV::sstatusW(sstatus);
                RiscV::sepcW(sepc);
                return;
            case causes::hardware:
                sepc = RiscV::sepcR();
                sstatus = RiscV::sstatusR();

                handleConsoleInterrupt();

                RiscV::sepcW(sepc);
                RiscV::sstatusW(sstatus);
                return;
            case causes::userCall:
            case causes::sysCall:
                // further processing below
                break;
            default:
                // unknown interrupt
                KprintString("Exception: Unknown interrupt source\n");
                handleExceptionInterrupt();
                return;
        }

        // interrupt from UserMode(0x08) or KernelMode(0x09)
        // retVal is passed implicitly by changing a0 on stack

        uint64 volatile sepc = RiscV::sepcR() + 4;
        uint64 volatile sstatus = RiscV::sstatusR();
        uint64 volatile retVal;

        switch (codeOp) {
            case (uint64) RiscV::CodeOps::MEM_ALOC:
                retVal = (uint64) MemoryAllocator::mem_alloc((size_t) a1);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::MEM_FREE:
                retVal = MemoryAllocator::mem_free((void*) a1);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::THR_CREA:
                retVal = _thread::createThread((_thread**) a1,
                                               (void(*)(void*))a2,
                                               (void*)a3,
                                               (uint64*)a4);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::THR_EXIT:
                retVal = _thread::exitThread();
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::THR_YIEL:
                _thread::curPeriod = 0;
                _thread::dispatch();
                break;
            case (uint64) RiscV::CodeOps::SEM_OPEN:
                retVal = _sem::createSemaphore((_sem**)a1, (unsigned)a2);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::SEM_CLOS:
                retVal = _sem::closeSemaphore((_sem*)a1);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::SEM_WAIT:
                retVal = ((_sem*)a1)->wait();
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::SEM_SIGN:
                retVal = ((_sem*)a1)->signal();
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::SEM_TMDW:
                retVal = _sem::timedWait((_sem*)a1, (time_t)a2);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::SEM_TRYW:
                retVal = _sem::tryWait((_sem*)a1);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::THR_SLEE:
                retVal = _thread::sleepThread((time_t)a1);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::CON_GETC:
                retVal = (uint64)_buffer::inBuffer->getc();
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::CON_PUTC:
                _buffer::outBuffer->putc((char)a1);
                break;
            default:
                break;
        }

        RiscV::sstatusW(sstatus);
        RiscV::sepcW(sepc);

    }


}


