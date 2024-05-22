//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_cpp.h"
#include "../h/_thread.h"
#include "../h/_sem.hpp"

struct args {
    _sem* s;
    char id = 0;
};

void printMem(AVLTree* root) {
    AVLTree* cur = root;
    static const uint64 N = 256;
    static const uint64 R = 4;
    for (uint64 i=0; i<N; i++) {
        uint64 addr = i*MEM_BLOCK_SIZE + MemoryAllocator::startAddr;
        uint64 freeStart = (uint64)cur;
        uint64 freeSize = cur->sz + MemoryAllocator::HEADER_SIZE;

        if (cur && addr == freeStart + freeSize) {
            cur = cur->next;
            freeStart = (uint64)cur;
        }

        if (cur && addr < freeStart)
            __putc('|');
        else
            __putc('.');

        if ((i+1) % (N/R) == 0) __putc('\n');

    }
    __putc('\n');
}

void consumer(void* arg) {

    time_sleep(*(int*)arg);
    __putc(*(int*)arg + '0');
    __putc('\n');

}

void producer(void* arg) {
    args* a = (args*) arg;
    a->s->signal();

}




int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);
    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);

    _thread* t1, *t2;
    int* a1 = new int(6);
    int* a2 = new int(2);

    thread_create(&t1, &consumer, a1);
    thread_create(&t2, &consumer, a2);

    while(!t1->isTerminated() || !t2->isTerminated() ) {
        thread_dispatch();
    }


    delete t1;
    delete t2;
    delete a1;
    delete a2;

    printMem(MemoryAllocator::first);
    return 0;
}
