//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_cpp.h"
#include "../h/_thread.h"

const int N = 20;

int fib(int n, char c) {
    if (n<2) return 1;
    int ans = fib(n-1, c) + fib(n-2, c);
    __putc(c); __putc('\n');
    return ans;
}

void Afunc(void* p) {
    fib(N, 'A');

}

void Bfunc(void* p) {
    fib(N, 'B');
}

void Cfunc(void* p) {
    fib(N, 'C');
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


class ThreadA: public Thread {
    void run() override {
        Afunc(nullptr);
    }
};
class ThreadB: public Thread {
    void run() override {
        Bfunc(nullptr);
    }
};
class ThreadC: public Thread {
public:
    void run() override {
        Cfunc(nullptr);
    }
};


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);
    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);


    Thread* t1 = new ThreadA();
    Thread* t2 = new ThreadB();
    Thread* t3 = new ThreadC();

    t1->start();
    t2->start();
    t3->start();

    while(1) {
        Thread::dispatch();
    }


    delete t1;
    delete t2;
    delete t3;

    printMem(MemoryAllocator::first);
    return 0;
}
