//
// Created by os on 5/1/24.
//

#include "../h/MemoryAllocator.hpp"
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

    MemoryAllocator::init();
    PCB::init();
    Scheduler::init();

    _buffer::inBuffer = new _buffer();
    _buffer::outBuffer = new _buffer();

    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);
    PCB* userMainThread, *outputThread;
    bool kernelThreadStatus = true;
    uint64* outputThreadStack = (uint64*) MemoryAllocator::mem_alloc(512 * sizeof(uint64));
    PCB::createThread(&outputThread, &PCB::outputThreadBody, &kernelThreadStatus, outputThreadStack);
    PCB::yield();

    RiscV::userMode = true;
    SEM* userSemaphore;
    SEM::createSemaphore(&userSemaphore, 0);

    uint64* userMainThreadStack = (uint64*) MemoryAllocator::mem_alloc(1024 * sizeof(uint64));
    PCB::createThread(&userMainThread, &userMainWrapper, userSemaphore, userMainThreadStack);

    // starting user
    PCB::yield();
    userSemaphore->wait();

    // cleaning
    // freeing userSemaphore
    SEM::closeSemaphore(userSemaphore);
    // to empty outBuffer
    while(!_buffer::outBuffer->isEmpty()) {
        PCB::yield();
    }
    delete _buffer::inBuffer;
    delete _buffer::outBuffer;

    // clearing _sem::timed
    while(SEM::timed) {
        delete SEM::timed->thr;
        SEM::timed = SEM::timed->next;
    }

    // to close outBufferThread
    kernelThreadStatus = false;
    while(!outputThread->isTerminated())
        thread_dispatch();

    delete outputThread;
    delete userSemaphore;

    // emptying scheduler
    Scheduler::clear();
    MemoryAllocator::mem_free(outputThreadStack);
    RiscV::shutdown();

    return 0;
}
