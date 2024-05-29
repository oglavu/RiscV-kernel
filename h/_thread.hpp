//
// Created by os on 5/8/24.
//

#ifndef PROJEKAT__THREAD_HPP
#define PROJEKAT__THREAD_HPP

#include "RiscV.hpp"
#include "Scheduler.hpp"
#include "_sem.hpp"

class _thread {
private:
    using ThreadBody = void (*) (void*);
    using thread_p = _thread*;
    enum ThreadState {Init, Ready, Running, Suspended, Terminated};

    struct Context {
        uint64 sp, ra;
    };

    struct SleepNode {
        SleepNode* next = nullptr;
        time_t timeRel;
        _thread* thread;

        void* operator new(size_t sz);
        void operator delete(void* p);
        void* operator new[](size_t sz) = delete;
        void operator delete[](void* p) = delete;
    };

    _thread* parentThread;
    Context context;
    _thread::ThreadBody body;
    ThreadState state = Init;
    void* bodyArguement;
    uint64 nPeriods = DEFAULT_TIME_SLICE;
    uint64 stackStartAddr;

    explicit _thread(_thread::ThreadBody bodyy, void* arg, uint64* stackStartAddrParam);
    static void contextSwitch(_thread::Context* oldCont, _thread::Context* newCont);
    static void wrap();
    static void init();
    static void complete();


public:
    static _thread* runningThread;
    static _thread* mainThread;
    static uint64 curPeriod;

    static SleepNode* sleepList;
    static time_t sleepTimeFirst;

    void suspend() { this->state = ThreadState::Suspended; }
    void unsuspend() { if (state == Suspended) this->state = ThreadState::Ready; }
    uint64 getPeriods() const { return nPeriods; }
    bool isTerminated() const { return this->state == ThreadState::Terminated; }

    static int createThread(thread_p* handle, ThreadBody bodyy, void* arg, uint64* allocStackParam);
    static int sleepThread(time_t);
    static int exitThread();
    static void dispatch();
    static void yield();


    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;


    ~_thread() {
        delete (uint64*)stackStartAddr;
        this->state = ThreadState::Terminated;
    }
};


#endif //PROJEKAT__THREAD_HPP
