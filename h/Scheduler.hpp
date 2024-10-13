//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_SCHEDULER_HPP
#define PROJEKAT_SCHEDULER_HPP

#include "Queue.hpp"

class PCB;

class Scheduler {
private:
    static Queue<PCB>* readyQueue;
    static PriorityQueue<PCB>* waitingPQ;
    static uint64 timer;
    static bool initialised;

public:

    static void init();
    static PCB* get();
    static void put(PCB*);
    static PriorityQueue<PCB>::Key putToWait(PCB*);
    static void callOut(PriorityQueue<PCB>::Key, PCB*);
    static uint64 getTime() { return timer; }
    static void alarm();

    Scheduler() = delete;
    Scheduler(const Scheduler&) = delete;
    Scheduler& operator =(Scheduler&) = delete;
    ~Scheduler() {
        delete readyQueue;
        delete waitingPQ;
    };
};


#endif //PROJEKAT_SCHEDULER_HPP
