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
    int m_value;
    bool m_closed = false;
    Queue<PCB> m_blocked;

    explicit SEM(uint32 val):
            m_value((int)val) {}

    void block();
    void unblock();
    bool freeAttempt();

public:

    static int createSemaphore(SEM** handle, unsigned init);
    static int closeSemaphore(SEM* handle);

    int wait();
    int signal();
    int tryWait();
    int timedWait(time_t time);
    int value() const { return m_value; }

    ~SEM() {
        SEM::closeSemaphore(this);
    }

    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;

    friend class PCB;

};


#endif //PROJEKAT_SEM_HPP
