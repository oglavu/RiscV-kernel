//
// Created by os on 5/8/24.
//

#include "../h/pcb.hpp"

ThreadState
        ThreadState::Running,
        ThreadState::Ready,
        ThreadState::Timed,
        ThreadState::Sleeping,
        ThreadState::Blocked,
        ThreadState::Terminated;

uint64 PCB::curPeriod = 0;
bool PCB::initialised = false;
PCB* PCB::runningThread = nullptr;
Queue<PCB>* PCB::deadThreads = nullptr;
PCB* PCB::mainThread = nullptr;

PCB::PCB(ThreadBody body, void *arg, uint64* allocStack):
        pArg1(arg), pArg2((void*) body) {
    if (!PCB::initialised)
        PCB::init();

    // stack grows downwards
    // so first location is top of allocated space
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
    if (oldR->isRunning()) {
        oldR->setState(ThreadState::Ready);
        Scheduler::put(oldR);
    }

    PCB* newR = Scheduler::get();
    if (!newR || newR == oldR) return;

    PCB::runningThread = newR;
    PCB::runningThread->setState(ThreadState::Running);
    PCB::contextSwitch(&oldR->context, &newR->context);

}

void PCB::wrap() {
    RiscV::popSppSpie();
    auto pf = (ThreadBody) runningThread->pArg2;
    // has to be done manually first time
    runningThread->pArg2 = &ThreadState::Running;
    pf(runningThread->pArg1);
    PCB::exitThread();
}

void PCB::init() {
    if (PCB::initialised) return;
    // allocating thread memory
    PCB::mainThread = (PCB*) MemoryAllocator::mem_alloc(sizeof(PCB));

    // setting up main kernel thread context
    PCB::mainThread->parentThread = nullptr;
    PCB::mainThread->pArg1 = nullptr;
    PCB::mainThread->pArg2 = nullptr;
    PCB::mainThread->pArg3 = nullptr;
    PCB::mainThread->stackPtr = nullptr;
    PCB::mainThread->timeLeft = DEFAULT_TIME_SLICE;
    // context will anyway be changed after first dispatch
    PCB::runningThread = PCB::mainThread;
    PCB::runningThread->pArg2 = &ThreadState::Running;

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
    if (!PCB::runningThread->isRunning()) return -1;
    PCB::runningThread->setState(ThreadState::Terminated);
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

    PCB::runningThread->setState(ThreadState::Sleeping);
    PCB::runningThread->setTimeLeft(Scheduler::getTime() + time);
    Scheduler::putToWait(PCB::runningThread);
    PCB::dispatch();

    PCB::runningThread->setTimeLeft();

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
    // has to be done manually
    this->pArg2 = &ThreadState::Terminated;
}

void PCB::outputThreadBody(void *status) {
    while(*(bool*)status) {
        _buffer::outBufferFlush();
        PCB::dispatch();
    }
}


