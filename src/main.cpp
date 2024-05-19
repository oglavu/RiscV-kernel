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
    Queue<char>* q;
};



void consumer(void* arg) {
    args* a = (args*) arg;
    Queue<char>* q = a->q;
    _sem* s = a->s;
    while(true) {
        s->wait();
        char* c = Queue<char>::pop(q);
        __putc('C');
        __putc(*c);
        __putc('\n');
    }
}

void producer(void* arg) {
    args* a = (args*) arg;
    Queue<char>* q = a->q;
    _sem* s = a->s;
    char init = 'a';
    while(true) {
        char* c = new char(init);
        Queue<char>::push(q, c);
        __putc('P');
        __putc(*c);
        __putc('\n');
        s->signal();

        init++;
    }


}



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


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);
    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);

    _thread* t1, *t2;
    args* arg = new args();
    arg->q = new Queue<char>();
    _sem::createSemaphore(&arg->s, 0);

    thread_create(&t1, &consumer, (void*)arg);
    thread_create(&t2, &producer, (void*)arg);

    while(1) {
        thread_dispatch();
    }


    delete t1;
    delete t2;

    printMem(MemoryAllocator::first);
    return 0;
}
