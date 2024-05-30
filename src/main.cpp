//
// Created by os on 5/1/24.
//

#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/_buffer.hpp"
#include "../h/_print.hpp"

//extern void userMain();

class ThreadA: public PeriodicThread {
    int i=0;
public:
    explicit ThreadA(time_t t): PeriodicThread(t) {}
    void periodicActivation() override {
        putc('A');
        KprintInt(i++);
        putc('\n');
    }
};

class ThreadB: public PeriodicThread {
    int i=0;
public:
    explicit ThreadB(time_t t): PeriodicThread(t) {}
    void periodicActivation() override {
        putc('B');
        KprintInt(i++);
        putc('\n');
    }
};

class ThreadC: public PeriodicThread {
    int i=0;
public:
    explicit ThreadC(time_t t): PeriodicThread(t) {}
    void periodicActivation() override {
        putc('C');
        KprintInt(i++);
        putc('\n');
    }
};


void userMainS() {

    ThreadA* tA = new ThreadA(2);
    ThreadB* tB = new ThreadB(5);
    ThreadC* tC = new ThreadC(10);

    tA->start();
    tB->start();
    tC->start();

    time_sleep(100);

    KprintString("Terminating periodic threads...\n");

    tA->terminate();
    tB->terminate();
    tC->terminate();

    KprintString("Terminated periodic threads...\n");

    time_sleep(20);

    KprintString("Freeing Memory...\n");

    delete tA;
    delete tB;
    delete tC;

    KprintString("Memory freed\n");


}



void userMainWrapper(void* userSemaphore) {
    userMainS();
    ((_sem*)userSemaphore)->signal();
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
            putc('|');
        else
            putc('.');

        if ((i+1) % (N/R) == 0) putc('\n');

    }
    putc('\n');
}


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);

    _buffer::inBuffer = new _buffer();
    _buffer::outBuffer = new _buffer();

    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);
    _thread* userMainThread, *outputThread;
    bool outputThreadStatus = true;
    thread_create(&outputThread, &_thread::outputThreadBody, &outputThreadStatus);
    thread_dispatch();

    RiscV::userMode = true;
    _sem* userSemaphore;
    sem_open(&userSemaphore, 0);
    thread_create(&userMainThread, &userMainWrapper, userSemaphore);

    // starting user
    thread_dispatch();
    userSemaphore->wait();


    KprintString("userMain finished\n");

    // cleaning
    thread_dispatch(); // to empty outBuffer
    sem_close(userSemaphore);
    outputThreadStatus = false;
    thread_dispatch(); // to close outBufferThread

    delete outputThread;
    delete userSemaphore;

    // clearing sleeping threads
    while (_thread::sleepList)
        _thread::sleepList = _thread::sleepList->next;
    _thread::sleepTimeFirst = 0;

    KprintString("SleepList Freed");

    // clearing _sem::timed
    while(_sem::timed)
        _sem::timed = _sem::timed->next;
    _sem::timeAbs = 0;

    // emptying scheduler
    while(Scheduler::get());


    return 0;
}
