//
// Created by os on 5/4/24.
//

#include "../h/MemoryAllocator.h"
#include "../h/_thread.h"
#include "../h/RiscV.h"

namespace interruptHandlers {

    void handleConsoleInterrupt() {
        console_handler();
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SEIP);
    }

    void handleTimerInterrupt() {
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SSIP);
        if (!_thread::runningThread) return;

        uint64 n = ++_thread::curPeriod;
        if (n >= _thread::runningThread->getPeriods()) {
            uint64 volatile sepc = RiscV::sepcR();
            uint64 volatile sstatus = RiscV::sstatusR();

            _thread::curPeriod = 0;
            _thread::yield();

            RiscV::sepcW(sepc);
            RiscV::sstatusW(sstatus);
        }
    }

    void handleSupervisorTrap() {
        // get implicit args from aX regs
        uint64 volatile codeOp = RiscV::a0R();
        uint64 volatile a1 = RiscV::a1R();
        uint64 volatile a2 = RiscV::a2R();
        uint64 volatile a3 = RiscV::a3R();
        uint64 volatile a4 = RiscV::a4R();


        uint64 volatile scause = RiscV::scauseR();

        // causes
        enum causes: uint64 {
            timer = (uint64) 1 << 63 | 0x1,
            hardware = (uint64) 1 << 63 | 0x9,
            userCall = (uint64) 0x8,
            sysCall = (uint64) 0x9
        };

        switch(scause) {
            case causes::timer:
                handleTimerInterrupt();
                return;
            case causes::hardware:
                handleConsoleInterrupt();
                return;
            case causes::userCall:
            case causes::sysCall:
                // further processing below
            default:
                // error
                break;
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
                                               (uint8*)a4);// uint64 !!!!!!!!!!!!!!!!!!!!!!
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
            default:
                break;
        }

        RiscV::sstatusW(sstatus);
        RiscV::sepcW(sepc);

    }


}


