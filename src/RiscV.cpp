//
// Created by os on 5/4/24.
//

#include "../h/RiscV.hpp"

bool RiscV::userMode = false;

void RiscV::popSppSpie() {
    if (RiscV::userMode) {
        RiscV::mc_sstatus(RiscV::SSTATUS_SPP);
        RiscV::ms_sstatus(RiscV::SSTATUS_SPIE);

    }
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}










