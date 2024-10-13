//
// Created by os on 5/6/24.
//

#include "../h/Scheduler.hpp"
#include "../h/pcb.hpp"

bool Scheduler::initialised = false;
Queue<PCB>* Scheduler::readyQueue = nullptr;
uint64 Scheduler::timer = 0;
PriorityQueue<PCB>* Scheduler::waitingPQ = nullptr;

PCB *Scheduler::get() {
    return (Scheduler::initialised) ?
        readyQueue->pop() : nullptr;
}

void Scheduler::put(PCB * data) {
    if (!Scheduler::initialised)
        Scheduler::init();
    readyQueue->push(data);
}

PriorityQueue<PCB>::Key Scheduler::putToWait(PCB *data) {
    if (!Scheduler::initialised)
        Scheduler::init();
    return waitingPQ->push(data);
}

void Scheduler::callOut(PriorityQueue<PCB>::Key key, PCB* thread) {
    if (!waitingPQ || waitingPQ->isEmpty()) return;
    PriorityQueue<PCB>::remove(key, thread);
}

void Scheduler::alarm() {
    if (!waitingPQ) return;
    if (waitingPQ->isEmpty()) return;

    Scheduler::timer++;

    while (!waitingPQ->isEmpty() &&
            Scheduler::timer > waitingPQ->peekFirst()->getTimeLeft()) {
        PCB* thread = waitingPQ->pop();

        if (thread->isTimed()) {
            auto key = (PriorityQueue<PCB>::Key) thread->getSemaphoreKey();
            PriorityQueue<PCB>::remove(key, thread);
        }

        Scheduler::put(thread);
    }
}

void Scheduler::init() {
    if (Scheduler::initialised) return;

    PriorityQueue<PCB>::ComparatorFunc pf = [] (const PCB* t1, const PCB* t2) -> bool {
        return t1->getTimeLeft() >= t2->getTimeLeft();
    };

    // init queue for ready threads
    Scheduler::readyQueue = new Queue<PCB>();
    // init queue for sleeping threads
    Scheduler::waitingPQ = new PriorityQueue<PCB>(pf);
    Scheduler::initialised = true;
}
