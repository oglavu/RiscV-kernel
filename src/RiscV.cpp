//
// Created by os on 5/4/24.
//

#include "../h/RiscV.hpp"


void RiscV::popSppSpie() {
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}










