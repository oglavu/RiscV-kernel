//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable | 0x01);

    int* ptr = (int*)mem_alloc(10*sizeof(int));
    for(int i=0; i<10; i++) ptr[i] = 0;
    mem_free(ptr);

    return 0;
}
