//
// Created by os on 5/19/24.
//

#ifndef PROJEKAT__SEM_HPP
#define PROJEKAT__SEM_HPP

#include "../lib/hw.h"
#include "Queue.hpp"
#include "_thread.hpp"
#include "Scheduler.hpp"

class _sem {
private:
    uint32 n;
    bool closed = false;
    bool timedOut = false;
    Queue<_thread>* blocked;

    struct DataPack {
        DataPack* next = nullptr;
        _sem* sem;
        _thread* thr;
        time_t timeRel;
        void* nodeAddr;

        void* operator new(size_t sz);
        void operator delete(void* p);
        void* operator new[](size_t sz) = delete;
        void operator delete[](void* p) = delete;
    };
    void removeBlocked();

    explicit _sem(uint32 val):
            n(val), blocked(new Queue<_thread>()) {}

    void block();
    void unblock();
    int close();

public:
    static DataPack* timed;
    static time_t timeAbs;

    static int createSemaphore(_sem** handle, unsigned init);
    static int closeSemaphore(_sem* handle);
    static int timedWait(_sem* handle, time_t time);
    static int tryWait(_sem* handle);

    int wait();
    int signal();
    uint32 value() const { return n; }

    ~_sem() {
        close();
        delete blocked;
    }

    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;

    friend class _thread;

};


#endif //PROJEKAT__SEM_HPP
