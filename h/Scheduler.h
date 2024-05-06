//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_SCHEDULER_H
#define PROJEKAT_SCHEDULER_H

#include "Queue.h"

class TCB;

class Scheduler {
public:
    static TCB* get();
    static void put(TCB*);

private:
    static Queue<TCB>* readyQueue;

};


#endif //PROJEKAT_SCHEDULER_H
