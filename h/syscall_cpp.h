//
// Created by os on 5/4/24.
//

#ifndef PROJEKAT_SYSCALL_CPP_H
#define PROJEKAT_SYSCALL_CPP_H

#include "syscall_c.h"

void *operator new(size_t);
void *operator new[](size_t);
void operator delete(void*) noexcept;
void operator delete[](void*) noexcept;



#endif //PROJEKAT_SYSCALL_CPP_H
