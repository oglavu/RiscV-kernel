//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_SCHEDULER_HPP
#define PROJEKAT_SCHEDULER_HPP

#include "Queue.hpp"
#include "PriorityQueue.hpp"

class _thread;

class Scheduler {
public:
    struct SleepNode {
        time_t delay; // delay is measured against Scheduler::timer
        _thread* thread;

        static bool GRT(const SleepNode* sn1, const SleepNode* sn2) {
            return sn1->delay > sn2->delay;
        }

        void* operator new(size_t sz);
        void operator delete(void* p);
        void* operator new[](size_t sz) = delete;
        void operator delete[](void* p) = delete;
    };

    static Queue<_thread>* readyQueue;
    static PriorityQueue<SleepNode>* sleepingPQ;

    static _thread* get();
    static void put(_thread*);
    static void sleep(_thread* ,time_t);
    static void tryToWake();

    static void emptySleepingThreads();
    static void incTimer();
    static uint64 getTime() { return Scheduler::timer; }

    Scheduler() = delete;
    Scheduler(const Scheduler&) = delete;
    Scheduler& operator =(Scheduler&) = delete;
    ~Scheduler() {
        delete sleepingPQ;
        delete readyQueue;
    }
private:



    static uint64 timer;
    static bool initialised;

    static void init();


};


#endif //PROJEKAT_SCHEDULER_HPP
