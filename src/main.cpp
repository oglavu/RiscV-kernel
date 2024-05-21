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
    args* a = (args*) arg;

    if (sem_timedwait(a->s, 1) < 0) {
        __putc('T');
    } else
        __putc('E');
    __putc(a->id + '0');
    __putc('\n');

}

void producer(void* arg) {
    args* a = (args*) arg;
    a->s->signal();

}




int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);
    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);

    _thread* t1, *t2, *t3, *t4, *t5;
    args* arg = new args[5]; char id = 0;
    sem_open(&arg[0].s, 0);
    for (int i=0; i<5; i++) {
        arg[i].s = arg[0].s;
        arg[i].id = id++;
    }


    thread_create(&t2, &consumer, (void*)&arg[1]);
    thread_create(&t3, &consumer, (void*)&arg[2]);
    thread_create(&t5, &producer, (void*)&arg[0]);
    thread_create(&t4, &consumer, (void*)&arg[3]);
    thread_create(&t1, &producer, (void*)&arg[0]);



    while(!t1->isTerminated() || !t2->isTerminated() ||
        !t3->isTerminated() || !t4->isTerminated()|| !t5->isTerminated()) {
        thread_dispatch();
    }

    sem_close(arg->s);

    delete t1;
    delete t2;
    delete t3;
    delete t4;
    delete t5;
    delete arg->s;
    delete[] arg;

    printMem(MemoryAllocator::first);
    return 0;
}
