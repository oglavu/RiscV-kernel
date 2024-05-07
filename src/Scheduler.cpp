//
// Created by os on 5/6/24.
//

#include "../h/Scheduler.h"


TCB *Scheduler::get() {
    return readyQueue->pop();
}

void Scheduler::put(TCB * data) {
    readyQueue->push(data);
}
