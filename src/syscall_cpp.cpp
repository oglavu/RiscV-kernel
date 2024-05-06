//
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.h"

void *operator new(size_t n) {
    return mem_alloc(n);
}

void *operator new[](size_t n) {
    return mem_alloc(n);
}

void operator delete(void *p) noexcept {
    mem_free(p);
}

void operator delete[](void *p) noexcept {
    mem_free(p);
}