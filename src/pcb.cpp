//
// Created by os on 5/8/24.
//

#include "../h/pcb.hpp"

uint64 PCB::curPeriod = 0;
bool PCB::initialised = false;
PCB* PCB::runningThread = nullptr;
Queue<PCB>* PCB::deadThreads = nullptr;
PCB* PCB::mainThread = nullptr;

PCB::PCB(PCB::ThreadBody bodyy, void *arg, uint64* allocStack):
                    body(bodyy), bodyArguement(arg) {
    if (!PCB::initialised)
        PCB::init();
    // stack grows downwards, so first location is top of allocated space
    state = ThreadState::Ready;
    stackPtr = allocStack;
    parentThread = PCB::runningThread;

    // Not subtracting one bcs stack should point to last TAKEN address
    context.sp = (uint64)stackPtr + sizeof(uint64) * DEFAULT_STACK_SIZE;
    context.ra = (uint64) &PCB::wrap;

    Scheduler::put(this);
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
    PCB::exitThread();
}

void PCB::init() {
    if (PCB::initialised) return;
    // allocating thread memory
    PCB::mainThread = (PCB*) MemoryAllocator::mem_alloc(sizeof(PCB));

    // setting up main kernel thread context
    PCB::mainThread->parentThread = nullptr;
    PCB::mainThread->body = nullptr;
    PCB::mainThread->bodyArguement = nullptr;
    PCB::mainThread->stackPtr = nullptr;
    PCB::mainThread->timeSlice = DEFAULT_TIME_SLICE;
    // context will anyway be changed after first dispatch
    PCB::runningThread = PCB::mainThread;
    PCB::runningThread->state = ThreadState::Running;

    PCB::deadThreads = new Queue<PCB>();
    PCB::initialised = true;
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
    PCB::runningThread->state = ThreadState::Terminated;
    PCB::deadThreads->push(PCB::runningThread);
    PCB::yield();
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

PCB::~PCB() {
    delete stackPtr;
    this->state = ThreadState::Terminated;
}

void PCB::outputThreadBody(void *status) {
    while(*(bool*)status) {
        _buffer::outBufferFlush();
        PCB::yield();
    }
}

