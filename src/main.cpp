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
    ((SEM*)userSemaphore)->signal();
}


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);

    _buffer::inBuffer = new _buffer();
    _buffer::outBuffer = new _buffer();

    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);
    PCB* userMainThread, *outputThread, *freeDeadThreadsThread, *freeDeadSemsThread;
    bool kernelThreadStatus = true;
    thread_create(&outputThread, &PCB::outputThreadBody, &kernelThreadStatus);
    thread_create(&freeDeadThreadsThread, &PCB::freeDeadThreadBody, &kernelThreadStatus);
    thread_create(&freeDeadSemsThread, &PCB::freeDeadSemBody, &kernelThreadStatus);
    thread_dispatch();

    RiscV::userMode = true;
    SEM* userSemaphore;
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
    while(SEM::timed) {
        delete SEM::timed->thr;
        SEM::timed = SEM::timed->next;
    }
    SEM::timeAbs = 0;

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
    while(PCB* thr = Scheduler::get()) delete thr;
    RiscV::shutdown();

    return 0;
}
