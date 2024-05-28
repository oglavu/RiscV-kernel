//
// Created by os on 5/6/24.
//

#include "../h/Scheduler.hpp"

bool Scheduler::initialised = false;
Queue<_thread>* Scheduler::readyQueue = nullptr;

_thread *Scheduler::get() {
    return (Scheduler::initialised) ?
        Queue<_thread>::pop(Scheduler::readyQueue) : nullptr;
}

void Scheduler::put(_thread * data) {
    if (!Scheduler::initialised)
        Scheduler::init();
    Queue<_thread>::push(Scheduler::readyQueue, data);
}

void Scheduler::init() {
    if (Scheduler::initialised) return;
    // has to include "syscall_cpp.h" so it can initialise Queue attributes
    // C API doesn't init them
    Scheduler::readyQueue = new Queue<_thread>();
    Scheduler::initialised = true;
}
