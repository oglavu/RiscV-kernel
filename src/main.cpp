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
    KprintString("UserMain finished\n");
    ((_sem*)userSemaphore)->signal();
}


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);

    _buffer::inBuffer = new _buffer();
    _buffer::outBuffer = new _buffer();

    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);
    _thread* userMainThread, *outputThread, *freeDeadThreadsThread, *freeDeadSemsThread;
    bool kernelThreadStatus = true;
    thread_create(&outputThread, &_thread::outputThreadBody, &kernelThreadStatus);
    thread_create(&freeDeadThreadsThread, &_thread::freeDeadThreadBody, &kernelThreadStatus);
    thread_create(&freeDeadSemsThread, &_thread::freeDeadSemBody, &kernelThreadStatus);
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

    // clearing sleeping threads
    Scheduler::emptySleepingThreads();

    // clearing _sem::timed
    while(_sem::timed) {
        delete _sem::timed->thr;
        _sem::timed = _sem::timed->next;
    }
    _sem::timeAbs = 0;

    // to close outBufferThread
    kernelThreadStatus = false;
    while(!outputThread->isTerminated() &&
          !freeDeadSemsThread->isTerminated() &&
          !freeDeadThreadsThread->isTerminated())
        thread_dispatch();

    delete outputThread;
    delete freeDeadThreadsThread;
    delete freeDeadSemsThread;
    delete userSemaphore;

    // emptying scheduler
    while(_thread* thr = Scheduler::get()) delete thr;


    return 0;
}
