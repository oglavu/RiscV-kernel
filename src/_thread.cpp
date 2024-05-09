//
// Created by os on 5/8/24.
//

#include "../h/_thread.h"

_thread* _thread::runningThread = nullptr;
_thread* _thread::mainThread = nullptr;

_thread::_thread(_thread::Runnable body, void *arg):
                    threadBody(body), bodyArguement(arg) {
    if (!_thread::mainThread)
        _thread::init();
    // stack grows downwards, so first location is top of allocated space
    stackStartAddr = (body) ? (uint64)MemoryAllocator::mem_alloc(DEFAULT_STACK_SIZE) : 0;
    parentThread = _thread::runningThread;
    // Not subtracting one bcs stack should point to last TAKEN address
    context.sp = stackStartAddr + DEFAULT_STACK_SIZE;
    context.ra = (uint64) &_thread::wrap;
    state = ThreadState::Ready;
}

void _thread::dispatch() {
    _thread *oldR = _thread::runningThread;
    if (oldR->state == ThreadState::Running) {
        oldR->state = ThreadState::Ready;
        Scheduler::put(oldR);

    } else if (oldR->parentThread && oldR->parentThread->isParentWaiting &&
            oldR->state == ThreadState::Terminated) {
        oldR->parentThread->state = ThreadState::Ready;
        Scheduler::put(oldR->parentThread);
    }

    _thread *newR = Scheduler::get();
    _thread::runningThread = newR;
    _thread::runningThread->state = ThreadState::Running;
    if (newR && oldR != newR) {
        _thread::contextSwitch(&oldR->context, &newR->context);
    }
}

void _thread::start() {
    Scheduler::put(this);
    _thread::dispatch();
}

void _thread::wrap() {
    runningThread->threadBody(runningThread->bodyArguement);
    _thread::complete();
}

void _thread::init() {
    if (mainThread) return;
    _thread::mainThread = (_thread*)1; // blocking infinite loop
    _thread::mainThread = new _thread(nullptr, nullptr);
    // context will anyway be changed after first dispatch
    _thread::runningThread =_thread::mainThread;
    _thread::runningThread->state = ThreadState::Running;
}

int _thread::join() {
    if (this->parentThread != runningThread) return -1;
    if (this->state == ThreadState::Terminated) return 0;
    _thread::runningThread->isParentWaiting = true;
    _thread::runningThread->state = ThreadState::Suspended;
    _thread::yield();
    _thread::runningThread->state = ThreadState::Running;
    return 0;
}

void _thread::complete() {
    _thread::runningThread->state = ThreadState::Terminated;
    _thread::dispatch();
}

