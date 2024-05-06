//
// Created by os on 5/4/24.
//

#include "../h/syscall_c.h"


void* mem_alloc(size_t size) {
    RiscV::a1W(size);
    RiscV::a0W(RiscV::CodeOps::MEM_ALOC);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (void*) retVal;
}


int mem_free(void* ptr){
    RiscV::a1W((uint64)ptr);
    RiscV::a0W(RiscV::CodeOps::MEM_FREE);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}