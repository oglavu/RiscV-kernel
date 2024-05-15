//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_cpp.h"
#include "../h/_thread.h"

const int N = 10;


void Afunc(void* p) {
    for(int i=0; i < N; i++) {
        __putc('A');
        __putc((char)('0' + i));
        __putc('\n');
        _thread::yield();
    }

}

void Bfunc(void* p) {
    for(int i=0; i < N; i++) {
        __putc('B');
        __putc((char)('0' + i));
        __putc('\n');
        _thread::yield();
    }
}

void Cfunc(void* p) {
    for(int i=0; i < N; i++) {
        __putc('C');
        __putc((char)('0' + i));
        __putc('\n');
        _thread::yield();
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

    uint8* st1 = new uint8 [DEFAULT_STACK_SIZE];
    uint8* st2 = new uint8 [DEFAULT_STACK_SIZE];
    uint8* st3 = new uint8 [DEFAULT_STACK_SIZE];

    _thread* th1, *th2, *th3;
    _thread::createThread(&th1, &Afunc, nullptr, st1);
    _thread::createThread(&th2, &Bfunc, nullptr, st2);
    _thread::createThread(&th3, &Cfunc, nullptr, st3);

    th1->start();
    th2->start();
    th3->start();

    while (!th1->isTerminated() ||
            !th2->isTerminated() ||
            !th3->isTerminated()) {
        _thread::yield();
    }

    delete[] st1;
    delete[] st2;
    delete[] st3;

    delete th1;
    delete th2;
    delete th3;

    return 0;
}
