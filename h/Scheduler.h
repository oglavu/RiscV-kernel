//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_SCHEDULER_H
#define PROJEKAT_SCHEDULER_H

#include "Queue.h"

class PCB;

class Scheduler {
public:
    static PCB* get();
    static void put(PCB*);

    Scheduler() = delete;
    Scheduler(const Scheduler&) = delete;
    Scheduler& operator =(Scheduler&) = delete;
    ~Scheduler() {
        delete readyQueue;
    }
private:
    static void init();
    static bool initialised;
    static Queue<PCB>* readyQueue;

};


#endif //PROJEKAT_SCHEDULER_H
