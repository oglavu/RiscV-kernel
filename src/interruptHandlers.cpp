//
// Created by os on 5/4/24.
//

#include "../h/MemoryAllocator.h"
#include "../h/RiscV.h"

namespace interruptHandlers {

    void handleSupervisorTrap() {
        uint64 scause = RiscV::scauseR();
        // not ecall interruption
        if (scause != (uint64) (1 << 3) && scause != (uint64) (1 << 3 | 0x01)) {
            // unexpreted trap cause

            /*printString("ERROR! SCAUSE:");
            printInt(scause);
            printString("\n");
             */
            return;
        }

        // interrupt from UserMode(0x08) or KernelMode(0x09)
        uint64 sepc = RiscV::sepcR() + 4;
        uint64 sstatus = RiscV::sstatusR();
        uint64 codeOp = RiscV::a0R();
        uint64 retVal;

        switch (codeOp) {
            case (uint64) RiscV::CodeOps::MEM_ALOC:
                size_t size;
                __asm__ volatile ("mv %0, a1" : "=r" (size));
                retVal = (uint64) MemoryAllocator::mem_alloc(size);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(x8)" : : "r"(retVal));
                break;
            case (uint64) RiscV::CodeOps::MEM_FREE:
                void *ptr;
                __asm__ volatile ("mv %0, a1" : "=r"(ptr));
                retVal = MemoryAllocator::mem_free(ptr);
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
                __asm__ volatile ("sd t0, 80(x8)" : : "r"(retVal));
                break;
            default:
                break;
        }

        RiscV::sstatusW(sstatus);
        RiscV::sepcW(sepc);

    }

    void handleConsoleInterrupt() {
        console_handler();
    }

    void handleTimerInterrupt() {
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SSIP);
        /*uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        TCB::dispatch();
        w_sstatus(sstatus);
        w_sepc(sepc);*/
    }

}


