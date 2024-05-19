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
    Queue<_thread>* blocked;

    explicit _sem(uint32 val):
            n(val), blocked(new Queue<_thread>()) {}

    void block();
    void unblock();

    int close();

public:

    static int createSemaphore(_sem** handle, unsigned init);

    int wait();
    int signal();
    uint32 value() const { return n; }

    ~_sem() {
        close();
        delete blocked;
    }
};


#endif //PROJEKAT__SEM_HPP
