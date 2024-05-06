//
// Created by os on 5/4/24.
//

#ifndef PROJEKAT_SYSCALL_C_H
#define PROJEKAT_SYSCALL_C_H

#include "../lib/hw.h"
#include "../h/RiscV.h"

void* mem_alloc(size_t size);
int mem_free(void*);




#endif //PROJEKAT_SYSCALL_C_H
