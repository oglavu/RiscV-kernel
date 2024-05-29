//
// Created by os on 5/19/24.
//

#include "../h/_sem.hpp"

_sem::DataPack* _sem::timed = nullptr;
time_t _sem::timeAbs = 0;

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
    DataPack* i = _sem::timed, *j = nullptr;
    if (i) {
        while (i && i->thr != cur) {
            j = i;
            i = i->next;
        }
        if (i && i->thr == cur) {
            if (j) {
                if (i->next) i->next->timeRel += i->timeRel;
                j->next = i->next;
                delete i;
            } else {
                _sem::DataPack* ptr = _sem::timed;
                _sem::timed = _sem::timed->next;
                delete ptr;
                if (_sem::timed) {
                    _sem::timeAbs = _sem::timed->timeRel;
                    _sem::timed->timeRel = 0;
                } else
                    _sem::timeAbs = 0;
            }
        }
    }


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

int _sem::closeSemaphore(_sem *handle) {
    if (!handle) return -1;
    return handle->close();
}

int _sem::timedWait(_sem *handle, time_t time) {
    if (handle->closed)
        return -1;

    if ((int) --handle->n < 0) {
        DataPack* dp = new DataPack;
        dp->sem = handle; dp->thr = _thread::runningThread;
        if (!_sem::timed || _sem::timeAbs > time) {
            dp->next = _sem::timed;
            if (_sem::timed)
                _sem::timed->timeRel = _sem::timeAbs - time;
            _sem::timed = dp;
            _sem::timed->timeRel = 0;
            _sem::timeAbs = time;
        } else {
            time -= _sem::timeAbs;
            _sem::DataPack *cur = _sem::timed;
            while (cur->next && cur->next->timeRel < time) {
                cur = cur->next;
                time -= cur->timeRel;
            }
            dp->timeRel = time;
            dp->next = cur->next;
            cur->next = dp;
        }

        Queue<_thread>::push(handle->blocked, _thread::runningThread);
        dp->nodeAddr = handle->blocked->getHeadNodeAddr();
        _thread::runningThread->suspend();
        _thread::yield();

        if (handle->timedOut) handle->n++;

    }

    int ret = (handle->closed) ? -1 : (handle->timedOut) ? -2 : 0;
    handle->timedOut = false;

    return ret;
}

void _sem::removeBlocked() {
    blocked->remove(_sem::timed->nodeAddr);
}

int _sem::tryWait(_sem *handle) {
    if (handle->closed)
        return -1;

    return ((int)handle->n > 0);
}

void *_sem::DataPack::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

void _sem::DataPack::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}


void *_sem::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

void _sem::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}
