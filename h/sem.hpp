//
// Created by os on 5/19/24.
//

#ifndef PROJEKAT_SEM_HPP
#define PROJEKAT_SEM_HPP

#include "../lib/hw.h"
#include "Queue.hpp"
#include "pcb.hpp"
#include "Scheduler.hpp"

class SEM {
private:
    uint32 n;
    bool closed = false;
    Queue<PCB>* blocked;
    static Queue<SEM>* deadSems;

    struct DataPack {
        DataPack* next = nullptr;
        SEM* sem;
        PCB* thr;
        time_t timeRel;

        void* operator new(size_t sz);
        void operator delete(void* p);
        void* operator new[](size_t sz) = delete;
        void operator delete[](void* p) = delete;
    };

    explicit SEM(uint32 val):
            n(val), blocked(new Queue<PCB>()) {}

    void block();
    void unblock();
    int close();

public:
    static DataPack* timed;
    static time_t timeAbs;

    void removeBlocked();

    static int createSemaphore(SEM** handle, unsigned init);
    static int closeSemaphore(SEM* handle);
    static int timedWait(SEM* handle, time_t time);
    static int tryWait(SEM* handle);

    int wait();
    int signal();
    uint32 value() const { return n; }

    ~SEM() {
        close();
        delete blocked;
    }

    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;

    friend class PCB;

};


#endif //PROJEKAT_SEM_HPP
