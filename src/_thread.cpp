//
// Created by os on 5/8/24.
//

#include "../h/_thread.h"

_thread* _thread::runningThread = nullptr;
_thread* _thread::mainThread = nullptr;

_thread::_thread(_thread::ThreadBody bodyy, void *arg, uint8* allocStack): // UINT64 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    body(bodyy), bodyArguement(arg) {
    if (!_thread::mainThread)
        _thread::init();
    // stack grows downwards, so first location is top of allocated space
    stackStartAddr = (uint64)allocStack;
    parentThread = _thread::runningThread;
    // Not subtracting one bcs stack should point to last TAKEN address
    context.sp = stackStartAddr + sizeof(uint8)*DEFAULT_STACK_SIZE; // UINT64 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    context.ra = (uint64) &_thread::wrap;
    state = ThreadState::Ready;
}

void _thread::dispatch() {
    _thread *oldR = _thread::runningThread;
    if (oldR->state == ThreadState::Running) {
        oldR->state = ThreadState::Ready;
        Scheduler::put(oldR);
    }

    _thread *newR = Scheduler::get();
    if (newR && oldR != newR) {
        _thread::runningThread = newR;
        _thread::runningThread->state = ThreadState::Running;
        _thread::contextSwitch(&oldR->context, &newR->context);
    }
}

void _thread::start() {
    Scheduler::put(this);
    _thread::dispatch();
}

void _thread::wrap() {
    runningThread->body(runningThread->bodyArguement);
    _thread::complete();
}

void _thread::init() {
    if (mainThread) return;
    _thread::mainThread = (_thread*)1; // blocking infinite loop
    _thread::mainThread = new _thread(nullptr, nullptr, nullptr);
    // context will anyway be changed after first dispatch
    _thread::runningThread =_thread::mainThread;
    _thread::runningThread->state = ThreadState::Running;
}

void _thread::complete() {
    _thread::runningThread->state = ThreadState::Terminated;
    _thread::dispatch();
}

// stack is allocated in ABI
int _thread::createThread(_thread::thread_p *handle, _thread::ThreadBody bodyy, void *arg, uint8* allocStackParam) { // uint64 !!!!!!!!
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
