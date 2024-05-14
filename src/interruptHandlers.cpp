//
// Created by os on 5/4/24.
//

#include "../h/MemoryAllocator.h"
#include "../h/RiscV.h"

namespace interruptHandlers {

    void handleConsoleInterrupt() {
        console_handler();
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SEIP);
    }

    void handleTimerInterrupt() {
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SSIP);
    }

    void handleSupervisorTrap() {
        uint64 scause = RiscV::scauseR();
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
                break;
            default:
                // error
                break;
        }

        // interrupt from UserMode(0x08) or KernelMode(0x09)
        // retVal is passed implicitly by changing a0 on stack
        uint64 volatile sepc = RiscV::sepcR() + 4;
        uint64 volatile sstatus = RiscV::sstatusR();
        uint64 codeOp = RiscV::a0R();
        uint64 retVal;

        switch (codeOp) {
            case (uint64) RiscV::CodeOps::MEM_ALOC:
                size_t size;
                __asm__ volatile ("mv %0, a1" : "=r" (size));
                retVal = (uint64) MemoryAllocator::mem_alloc(size);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            case (uint64) RiscV::CodeOps::MEM_FREE:
                void *ptr;
                __asm__ volatile ("mv %0, a1" : "=r"(ptr));
                retVal = MemoryAllocator::mem_free(ptr);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(fp)");
                break;
            default:
                break;
        }

        RiscV::sstatusW(sstatus);
        RiscV::sepcW(sepc);

    }


}


