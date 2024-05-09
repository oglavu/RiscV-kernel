//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_SCHEDULER_H
#define PROJEKAT_SCHEDULER_H

#include "Queue.h"
#include "syscall_cpp.h"

class _thread;

class Scheduler {
public:
    static _thread* get();
    static void put(_thread*);
    static Queue<_thread>* readyQueue;

    Scheduler() = delete;
    Scheduler(const Scheduler&) = delete;
    Scheduler& operator =(Scheduler&) = delete;
    ~Scheduler() {
        delete readyQueue;
    }
private:
    static void init();
    static bool initialised;


};


#endif //PROJEKAT_SCHEDULER_H
