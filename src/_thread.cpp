//
// Created by os on 5/8/24.
//

#include "../h/_thread.hpp"

uint64 _thread::curPeriod = 0;
_thread* _thread::runningThread = nullptr;
Queue<_thread>* _thread::deadThreads = nullptr;
_thread* _thread::mainThread = nullptr;

_thread::_thread(_thread::ThreadBody bodyy, void *arg, uint64* allocStack):
                    body(bodyy), bodyArguement(arg) {
    if (!_thread::mainThread)
        _thread::init();
    // stack grows downwards, so first location is top of allocated space
    stackStartAddr = (uint64)allocStack;
    parentThread = _thread::runningThread;
    // Not subtracting one bcs stack should point to last TAKEN address
    context.sp = stackStartAddr + sizeof(uint64)*DEFAULT_STACK_SIZE;
    context.ra = (uint64) &_thread::wrap;
    state = ThreadState::Ready;
    if (body) Scheduler::put(this);
}

void _thread::dispatch() {
    _thread *oldR = _thread::runningThread;
    if (!oldR) return;
    if (oldR->state == ThreadState::Running) {
        oldR->state = ThreadState::Ready;
        Scheduler::put(oldR);
    }

    _thread* newR = Scheduler::get();

    if (newR) {
        _thread::runningThread = newR;
        _thread::runningThread->state = ThreadState::Running;
        _thread::contextSwitch(&oldR->context, &newR->context);
    }
}

void _thread::wrap() {
    RiscV::popSppSpie();
    runningThread->body(runningThread->bodyArguement);
    _thread::complete();
}

void _thread::init() {
    if (mainThread) return;
    _thread::mainThread = (_thread*)1; // blocking infinite loop
    _thread::mainThread = new _thread(nullptr, nullptr, nullptr);
    // context will anyway be changed after first dispatch
    _thread::runningThread = _thread::mainThread;
    _thread::runningThread->state = ThreadState::Running;

    _thread::deadThreads = new Queue<_thread>();
}

void _thread::complete() {
    _thread::runningThread->state = ThreadState::Terminated;
    _thread::deadThreads->push(_thread::runningThread);
    _thread::yield();
}

// stack is allocated in ABI
int _thread::createThread(_thread **handle, _thread::ThreadBody bodyy, void *arg, uint64* allocStackParam) {
    _thread* t = new _thread(bodyy, arg, allocStackParam);
    if (!t || !allocStackParam) return -1;
    *handle = t;
    return 0;
}

int _thread::exitThread() {
    if (_thread::runningThread->state != ThreadState::Running) return -1;
    _thread::runningThread->complete();
    return 0;
}

void _thread::yield() {
    RiscV::a0W(RiscV::CodeOps::THR_YIEL);
    __asm__ volatile ("ecall");
}

int _thread::sleepThread(time_t time) {
    if (time == 0) return -1;

    _thread::runningThread->suspend();
    Scheduler::sleep(_thread::runningThread, time);
    _thread::yield();

    return 0;

}

void *_thread::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

void _thread::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}

void _thread::outputThreadBody(void *status) {
    while(*(bool*)status) {
        _buffer::outBufferFlush();
        _thread::yield();
    }
}

void _thread::freeDeadThreadBody(void *status) {
    while(*(bool*)status) {
        while(_thread::deadThreads && _thread::deadThreads->peekFirst()) {
            delete _thread::deadThreads->pop();
        }
        _thread::yield();
    }
    delete _thread::deadThreads;
}

void _thread::freeDeadSemBody(void *status) {
    while(*(bool*)status) {
        while(_sem::deadSems && _sem::deadSems->peekFirst()) {
            delete _sem::deadSems->pop();
        }
        _thread::yield();
    }
    delete _sem::deadSems;
}
