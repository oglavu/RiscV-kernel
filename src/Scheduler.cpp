//
// Created by os on 5/6/24.
//

#include "../h/Scheduler.h"

bool Scheduler::initialised = false;
Queue<TCB>* Scheduler::readyQueue = nullptr;

TCB *Scheduler::get() {
    return (Scheduler::initialised) ?
        Queue<TCB>::pop(Scheduler::readyQueue) : nullptr;
}

void Scheduler::put(TCB * data) {
    if (!Scheduler::initialised)
        Scheduler::init();
    Queue<TCB>::push(Scheduler::readyQueue, data);
}

void Scheduler::init() {
    if (Scheduler::initialised) return;
    Scheduler::readyQueue =
            (Queue<TCB>*)mem_alloc(sizeof(Queue<TCB>));
    Scheduler::initialised = true;
}
