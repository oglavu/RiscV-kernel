//
// Created by os on 5/8/24.
//

#ifndef PROJEKAT__THREAD_H
#define PROJEKAT__THREAD_H

#include "Scheduler.h"
#include "MemoryAllocator.h"
#include "syscall_cpp.h"

class _thread {
private:
    using Runnable = void (*) (void*);
    enum ThreadState {Init, Ready, Running, Suspended, Blocked, Terminated};

    struct Context {
        uint64 sp, ra;
    };

    _thread* parentThread;
    Context context;
    _thread::Runnable threadBody;
    ThreadState state = Init;
    bool isParentWaiting = false;
    void* bodyArguement;
    uint64 stackStartAddr;
    static _thread* mainThread;


    static void contextSwitch(_thread::Context* oldCont, _thread::Context* newCont);
    static void wrap();
    static void init();
    static void complete();

public:
    static _thread* runningThread;

    explicit _thread(_thread::Runnable body, void* arg);
    static void dispatch();
    static void yield();
    int join();
    void start();

    ~_thread() {
        MemoryAllocator::mem_free((void*)stackStartAddr);
        this->state = ThreadState::Terminated;
    }
};


#endif //PROJEKAT__THREAD_H
