//
// Created by os on 5/19/24.
//

#include "../h/_sem.hpp"

int _sem::wait() {
    if (closed)
        return -1;

    if ((int) --n < 0) {
        // no free slots
        block();
    }
    return closed;
}

int _sem::signal() {
    if (closed)
        return -1;

    if ((int) ++n <= 0) {
        unblock();
    }

    return 0;
}

void _sem::block() {
    Queue<_thread>::push(blocked, _thread::runningThread);
    _thread::runningThread->suspend();
    _thread::yield();
}

void _sem::unblock(){
    _thread* cur = Queue<_thread>::pop(blocked);
    cur->unsuspend();
    Scheduler::put(cur);
}

int _sem::close() {
    if (closed)
        return -1;

    while(blocked->peekFirst()) {
        _thread* cur = Queue<_thread>::pop(blocked);
        cur->unsuspend();
        Scheduler::put(cur);
    }
    return 0;
}


int _sem::createSemaphore(_sem **handle, unsigned int init) {
    if (!handle) return -1;
    *handle = new _sem(init);
    if (!*handle) return -1;
    return 0;
}

int _sem::closeSemaphore(_sem **handle) {
    if (!handle) return -1;
    return (*handle)->close();
}
