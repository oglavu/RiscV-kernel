//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_cpp.h"
#include "../h/_buffer.hpp"

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
            putc('|');
        else
            putc('.');

        if ((i+1) % (N/R) == 0) putc('\n');

    }
    putc('\n');
}


class ThreadA: public PeriodicThread {
public:
    ThreadA(time_t t): PeriodicThread(t) {}
protected:
    int i=0;
    void periodicActivation () override {
        if (i > 100) return;
        putc('A');
        putc(i+'0');
        putc('\n');
        i++;
    }
};

class ThreadB: public PeriodicThread {
public:
    ThreadB(time_t t): PeriodicThread(t) {}
protected:
    int i = 0;
    void periodicActivation () override {
        if (i > 100) return;
        putc('B');
        putc(i+'0');
        putc('\n');
        i++;
    }
};

class ThreadC: public PeriodicThread {
public:
    ThreadC(time_t t): PeriodicThread(t) {}
protected:
    int i = 0;
    void periodicActivation () override {
        if (i > 100) return;
        putc('C');
        putc(i+'0');
        putc('\n');
        i++;
    }
};

void busyWait(void* arg) {
    while(*(bool*)arg)
        thread_dispatch();
}



int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);


    _buffer::inBuffer = new _buffer();
    _buffer::outBuffer = new _buffer();

    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);

    printMem(MemoryAllocator::first);

    ThreadA* t1 = new ThreadA(2);
    ThreadB* t2 = new ThreadB(5);
    ThreadC* t3 = new ThreadC(10);
    bool* b = new bool(true);

    Thread* busyThread = new Thread(&busyWait, b);

    t1->start();
    t2->start();
    t3->start();
    busyThread->start();

    time_sleep(50);

    t1->terminate();
    t2->terminate();
    t3->terminate();

    time_sleep(20);

    *b = false;

    thread_dispatch();

    delete t1;
    delete t2;
    delete t3;
    delete busyThread;
    delete b;
    delete _buffer::inBuffer;
    delete _buffer::outBuffer;
    delete Scheduler::readyQueue;
    return 0;
}
