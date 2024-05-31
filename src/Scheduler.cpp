//
// Created by os on 5/6/24.
//

#include "../h/Scheduler.hpp"

bool Scheduler::initialised = false;
Queue<_thread>* Scheduler::readyQueue = nullptr;

_thread *Scheduler::get() {
    return (Scheduler::initialised) ?
        readyQueue->pop() : nullptr;
}

void Scheduler::put(_thread * data) {
    if (!Scheduler::initialised)
        Scheduler::init();
    readyQueue->push(data);
}

void Scheduler::init() {
    if (Scheduler::initialised) return;
    // has to include "syscall_cpp.h" so it can initialise Queue attributes
    // C API doesn't init them
    Scheduler::readyQueue = new Queue<_thread>();
    Scheduler::initialised = true;
}
