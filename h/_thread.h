//
// Created by os on 5/8/24.
//

#ifndef PROJEKAT__THREAD_H
#define PROJEKAT__THREAD_H

#include "Scheduler.h"
#include "syscall_cpp.h"

class _thread {
private:
    using ThreadBody = void (*) (void*);
    using thread_p = _thread*;
    enum ThreadState {Init, Ready, Running, Suspended, Terminated};

    struct Context {
        uint64 sp, ra;
    };

    _thread* parentThread;
    Context context;
    _thread::ThreadBody body;
    ThreadState state = Init;
    void* bodyArguement;
    uint64 nPeriods = 1;

    explicit _thread(_thread::ThreadBody bodyy, void* arg, uint8* stackStartAddrParam); // uint64 !!!!!!!!!!
    static void contextSwitch(_thread::Context* oldCont, _thread::Context* newCont);
    static void wrap();
    static void init();
    static void complete();


public:
    uint64 stackStartAddr;
    static _thread* runningThread;
    static _thread* mainThread;
    static uint64 curPeriod;

    uint64 getPeriods() const { return nPeriods; }
    bool isTerminated() const { return this->state == ThreadState::Terminated; }
    static int createThread(thread_p* handle, ThreadBody bodyy, void* arg, uint8* allocStackParam); // uint64 !!!!!!!!!!
    static int exitThread();
    static void dispatch();
    static void yield();


    ~_thread() {
        delete (uint8*)stackStartAddr;  // uint64 !!!!!!!!!!
        this->state = ThreadState::Terminated;
    }
};


#endif //PROJEKAT__THREAD_H
