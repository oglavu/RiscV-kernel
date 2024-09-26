//
// Created by os on 5/8/24.
//

#include "../h/pcb.hpp"

uint64 PCB::curPeriod = 0;
PCB* PCB::runningThread = nullptr;
Queue<PCB>* PCB::deadThreads = nullptr;
PCB* PCB::mainThread = nullptr;

PCB::PCB(PCB::ThreadBody bodyy, void *arg, uint64* allocStack):
                    body(bodyy), bodyArguement(arg) {
    if (!PCB::mainThread)
        PCB::init();
    // stack grows downwards, so first location is top of allocated space
    stackStartAddr = (uint64)allocStack;
    parentThread = PCB::runningThread;
    // Not subtracting one bcs stack should point to last TAKEN address
    context.sp = stackStartAddr + sizeof(uint64)*DEFAULT_STACK_SIZE;
    context.ra = (uint64) &PCB::wrap;
    state = ThreadState::Ready;
    if (body) Scheduler::put(this);
}

void PCB::dispatch() {
    PCB *oldR = PCB::runningThread;
    if (!oldR) return;
    if (oldR->state == ThreadState::Running) {
        oldR->state = ThreadState::Ready;
        Scheduler::put(oldR);
    }

    PCB* newR = Scheduler::get();

    if (newR) {
        PCB::runningThread = newR;
        PCB::runningThread->state = ThreadState::Running;
        PCB::contextSwitch(&oldR->context, &newR->context);
    }
}

void PCB::wrap() {
    RiscV::popSppSpie();
    runningThread->body(runningThread->bodyArguement);
    PCB::complete();
}

void PCB::init() {
    if (mainThread) return;
    PCB::mainThread = (PCB*)1; // blocking infinite loop
    PCB::mainThread = new PCB(nullptr, nullptr, nullptr);
    // context will anyway be changed after first dispatch
    PCB::runningThread = PCB::mainThread;
    PCB::runningThread->state = ThreadState::Running;

    PCB::deadThreads = new Queue<PCB>();
}

void PCB::complete() {
    PCB::runningThread->state = ThreadState::Terminated;
    PCB::deadThreads->push(PCB::runningThread);
    PCB::yield();
}

// stack is allocated in ABI
int PCB::createThread(PCB **handle, PCB::ThreadBody bodyy, void *arg, uint64* allocStackParam) {
    PCB* t = new PCB(bodyy, arg, allocStackParam);
    if (!t || !allocStackParam) return -1;
    *handle = t;
    return 0;
}

int PCB::exitThread() {
    if (PCB::runningThread->state != ThreadState::Running) return -1;
    PCB::runningThread->complete();
    return 0;
}

void PCB::yield() {
    RiscV::a0W(RiscV::CodeOps::THR_YIEL);
    __asm__ volatile ("ecall");
}

int PCB::sleepThread(time_t time) {
    if (time == 0) return -1;

    PCB::runningThread->suspend();
    Scheduler::sleep(PCB::runningThread, time);
    PCB::yield();

    return 0;

}

void *PCB::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
}

void PCB::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}

void PCB::outputThreadBody(void *status) {
    while(*(bool*)status) {
        _buffer::outBufferFlush();
        PCB::yield();
    }
}

void PCB::freeDeadThreadBody(void *status) {
    while(*(bool*)status) {
        while(PCB::deadThreads && PCB::deadThreads->peekFirst()) {
            delete PCB::deadThreads->pop();
        }
        PCB::yield();
    }
    delete PCB::deadThreads;
}

void PCB::freeDeadSemBody(void *status) {
    while(*(bool*)status) {
        while(SEM::deadSems && SEM::deadSems->peekFirst()) {
            delete SEM::deadSems->pop();
        }
        PCB::yield();
    }
    delete SEM::deadSems;
}
