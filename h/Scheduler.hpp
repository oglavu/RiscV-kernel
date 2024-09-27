//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_SCHEDULER_HPP
#define PROJEKAT_SCHEDULER_HPP

#include "Queue.hpp"
#include "PriorityQueue.hpp"

class PCB;

class Scheduler {
private:
    struct SleepNode {
        time_t delay; // delay is measured against Scheduler::timer
        PCB* thread;

        static bool GRT(const SleepNode* sn1, const SleepNode* sn2) {
            return sn1->delay > sn2->delay;
        }

        void* operator new(size_t sz);
        void operator delete(void* p);
        void* operator new[](size_t sz) = delete;
        void operator delete[](void* p) = delete;
    };

    static Queue<PCB>* readyQueue;
    static PriorityQueue<SleepNode>* sleepingPQ;
    static uint64 timer;
    static bool initialised;
public:

    static void init();
    static PCB* get();
    static void put(PCB*);
    static void sleep(PCB* , time_t);
    static void alarm();

    static void clear();
    static void incTimer() { Scheduler::timer++; }
    static uint64 getTime() { return Scheduler::timer; }

    Scheduler() = delete;
    Scheduler(const Scheduler&) = delete;
    Scheduler& operator =(Scheduler&) = delete;
    ~Scheduler();
};


#endif //PROJEKAT_SCHEDULER_HPP
