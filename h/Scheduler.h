//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_SCHEDULER_H
#define PROJEKAT_SCHEDULER_H

#include "Queue.h"

class TCB;

class Scheduler {
public:
    TCB* get();
    void put(TCB*);

private:
    Queue<TCB>* readyQueue = new Queue<TCB>();

};


#endif //PROJEKAT_SCHEDULER_H
