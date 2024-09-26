//
// Created by os on 5/8/24.
//

#ifndef PROJEKAT_PCB_HPP
#define PROJEKAT_PCB_HPP

#include "RiscV.hpp"
#include "Scheduler.hpp"
#include "_buffer.hpp"
#include "sem.hpp"

class PCB {
private:
    using ThreadBody = void (*) (void*);
    using thread_p = PCB*;
    enum ThreadState {Init, Ready, Running, Suspended, Terminated};

    struct Context {
        uint64 sp, ra;
    };

    PCB* parentThread;
    Context context;
    PCB::ThreadBody body;
    ThreadState state = Init;
    bool timedOut = false; // must stay after ThreadState for packing
    void* bodyArguement;
    uint64 nPeriods = DEFAULT_TIME_SLICE;
    uint64 stackStartAddr;
    static uint64 curPeriod;
    static Queue<PCB>* deadThreads;

    explicit PCB(PCB::ThreadBody bodyy, void* arg, uint64* stackStartAddrParam);
    static void contextSwitch(PCB::Context* oldCont, PCB::Context* newCont);
    static void wrap();
    static void init();
    static void complete();


public:
    static PCB* runningThread;
    static PCB* mainThread;

    bool isTimeOut() const {return timedOut;}
    void setTimeOut() { timedOut = true; }
    void resetTimeOut() { timedOut = false; }
    void suspend() { this->state = ThreadState::Suspended; }
    void unsuspend() { if (state == Suspended) this->state = ThreadState::Ready; }
    uint64 getPeriods() const { return nPeriods; }
    bool isTerminated() const { return this->state == ThreadState::Terminated; }

    static uint64 getCurPeriod() { return curPeriod; }
    static uint64 incCurPeriod() { return ++curPeriod; }
    static void resetCurPeriod() { curPeriod = 0; }

    static int createThread(thread_p* handle, ThreadBody bodyy, void* arg, uint64* allocStackParam);
    static int sleepThread(time_t);
    static int exitThread();
    static void dispatch();
    static void yield();

    static void outputThreadBody(void* status);
    static void freeDeadThreadBody(void* status);
    static void freeDeadSemBody(void* status);

    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;


    ~PCB() {
        delete (uint64*)stackStartAddr;
        this->state = ThreadState::Terminated;
    }
};


#endif //PROJEKAT_PCB_HPP
