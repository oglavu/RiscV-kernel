//
// Created by os on 5/6/24.
//

#include "../h/Scheduler.h"

bool Scheduler::initialised = false;
Queue<PCB>* Scheduler::readyQueue = nullptr;

PCB *Scheduler::get() {
    return (Scheduler::initialised) ?
        Queue<PCB>::pop(Scheduler::readyQueue) : nullptr;
}

void Scheduler::put(PCB * data) {
    if (!Scheduler::initialised)
        Scheduler::init();
    Queue<PCB>::push(Scheduler::readyQueue, data);
}

void Scheduler::init() {
    if (Scheduler::initialised) return;
    Scheduler::readyQueue =
            (Queue<PCB>*)mem_alloc(sizeof(Queue<PCB>));
    Scheduler::initialised = true;
}
