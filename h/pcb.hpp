//
// Created by os on 5/8/24.
//

#ifndef PROJEKAT_PCB_HPP
#define PROJEKAT_PCB_HPP

#include "RiscV.hpp"
#include "Scheduler.hpp"
#include "_buffer.hpp"
#include "sem.hpp"

// This piece of sh is born out of
// necessity for enum members that take up actual space
// similar to Java enums
struct ThreadState {
    static ThreadState
        Running,
        Ready,
        Timed,
        Sleeping,
        Blocked,
        Terminated;
};

class PCB {
private:
    using ThreadBody = void (*) (void*);

    struct Context {
        uint64 sp, ra;
    };

    PCB* parentThread;
    Context context{};
    // usecases are >> disjoint <<
    // before starting thread: ptr to bodyArg
    // after starting thread: ptr to join-sem / key-on-sem
    void* pArg1 = nullptr;

    // usecases are >> disjoint <<
    // before starting thread: ptr to bodyFunc
    // after starting thread: ptr to ThreadState
    void* pArg2 = nullptr;

    // key for waitingPQ
    void* pArg3 = nullptr;

    // usecases are >> disjoint <<
    // (threadState == Running) => timeSlice
    // (threadState == Sleeping || Timed) => wake-up time
    uint64 timeLeft = DEFAULT_TIME_SLICE;

    uint64* stackPtr;
    static uint64 curPeriod;
    static Queue<PCB>* deadThreads;

    explicit PCB(PCB::ThreadBody bodyy, void* arg, uint64* stackStartAddrParam);
    static void contextSwitch(PCB::Context* oldCont, PCB::Context* newCont);
    static void wrap();

    bool isStarted() const {
        return (isReady() ||
            isRunning() ||
            isTerminated() ||
            isSleeping() ||
            isBlocked() ||
            isTimed());
    }

    static bool initialised;
public:
    static void init();
    static PCB* runningThread;
    static PCB* mainThread;

    static void outputThreadBody(void* status);

    // DO NOT use setState
    // before starting thread
    void setState(ThreadState& state) {
        if (isStarted())
            pArg2 = &state;
    }

    void setSemaphoreKey(void* k) { if (isTimed()) pArg1 = k; }
    void* getSemaphoreKey() const { return isTimed() ? pArg1 : nullptr; }

    void setWaitingKey(void* k) { if (isTimed() || isSleeping() || isBlocked()) pArg3 = k; }
    void* getWaitingKey() const { return (isTimed() || isSleeping() || isBlocked()) ? pArg3 : nullptr; }

    bool isRunning() const    { return pArg2 == &ThreadState::Running; }
    bool isReady() const      { return pArg2 == &ThreadState::Ready; }
    bool isTimed() const      { return pArg2 == &ThreadState::Timed; }
    bool isBlocked() const    { return pArg2 == &ThreadState::Blocked; }
    bool isSleeping() const   { return pArg2 == &ThreadState::Sleeping; }
    bool isTerminated() const { return pArg2 == &ThreadState::Terminated; }

    void setTimeLeft(time_t t = DEFAULT_TIME_SLICE) { timeLeft = t; }
    time_t getTimeLeft() const { return timeLeft; }

    static uint64 getCurPeriod() { return curPeriod; }
    static uint64 incCurPeriod() { return ++curPeriod; }
    static void resetCurPeriod() { curPeriod = 0; }

    static int createThread(PCB** handle, ThreadBody body, void* arg, uint64* allocStackParam);
    static int sleepThread(time_t);
    static int exitThread();
    static void dispatch();
    static void yield();

    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;

    ~PCB();
};


#endif //PROJEKAT_PCB_HPP
