//
// Created by os on 5/1/24.
//

#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/_buffer.hpp"
#include "../h/_print.hpp"

extern void userMain();

void userMainWrapper(void* userSemaphore) {
    userMain();
    ((_sem*)userSemaphore)->signal();
}

void printMem(DataBlock* root) {
    DataBlock* cur = root;
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

    // cleaning
    // freeing userSemaphore
    sem_close(userSemaphore);
    // to empty outBuffer
    while(!_buffer::outBuffer->isEmpty()) {
        thread_dispatch();
    }
    // to close outBufferThread
    outputThreadStatus = false;
    while(!outputThread->isTerminated())
        thread_dispatch();

    delete outputThread;
    delete userSemaphore;

    // clearing sleeping threads
    while (_thread::sleepList)
        _thread::sleepList = _thread::sleepList->next;
    _thread::sleepTimeFirst = 0;

    // clearing _sem::timed
    while(_sem::timed)
        _sem::timed = _sem::timed->next;
    _sem::timeAbs = 0;

    // emptying scheduler
    while(Scheduler::get());


    return 0;
}
