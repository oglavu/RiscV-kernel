//
// Created by os on 5/19/24.
//

#ifndef PROJEKAT__SEM_HPP
#define PROJEKAT__SEM_HPP

#include "../lib/hw.h"
#include "Queue.h"
#include "_thread.h"
#include "Scheduler.h"

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

    int wait();
    int signal();
    uint32 value() const { return n; }

    ~_sem() {
        close();
        delete blocked;
    }

    friend class _thread;

};


#endif //PROJEKAT__SEM_HPP
