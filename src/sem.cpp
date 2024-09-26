//
// Created by os on 5/19/24.
//

#include "../h/sem.hpp"

SEM::DataPack* SEM::timed = nullptr;
Queue<SEM>* SEM::deadSems = nullptr;
time_t SEM::timeAbs = 0;

int SEM::wait() {
    if (closed)
        return -1;

    if ((int) --n < 0) {
        // no free slots
        block();
    }
    return closed;
}

int SEM::signal() {
    if (closed)
        return -1;

    if ((int) ++n <= 0) {
        unblock();
    }

    return 0;
}

void SEM::block() {
    blocked->push( PCB::runningThread);
    PCB::runningThread->suspend();
    PCB::yield();
}

void SEM::unblock(){
    PCB* cur = blocked->pop();
    DataPack* i = SEM::timed, *j = nullptr;
    if (i) {
        while (i && i->thr != cur) {
            j = i;
            i = i->next;
        }
        if (i && i->thr == cur) {
            // thr found
            if (j) {
                if (i->next) i->next->timeRel += i->timeRel;
                j->next = i->next;
                delete i;
            } else {
                SEM::DataPack* ptr = SEM::timed;
                SEM::timed = SEM::timed->next;
                delete ptr;
                if (SEM::timed) {
                    SEM::timeAbs = SEM::timed->timeRel;
                    SEM::timed->timeRel = 0;
                } else
                    SEM::timeAbs = 0;
            }
        }
    }


    cur->unsuspend();
    Scheduler::put(cur);
}

int SEM::close() {
    if (closed)
        return -1;

    closed = true;

    while(blocked->peekFirst()) {
        PCB* cur = blocked->pop();
        cur->unsuspend();
        Scheduler::put(cur);
    }

    if (!SEM::deadSems)
        SEM::deadSems = new Queue<SEM>();
    SEM::deadSems->push(this);

    return 0;
}


int SEM::createSemaphore(SEM **handle, unsigned int init) {
    if (!handle) return -1;
    *handle = new SEM(init);
    if (!*handle) return -1;
    return 0;
}

int SEM::closeSemaphore(SEM *handle) {
    if (!handle) return -1;
    return handle->close();
}

int SEM::timedWait(SEM *handle, time_t time) {
    if (handle->closed)
        return -1;

    if ((int) --handle->n < 0) {
        DataPack* dp = new DataPack;
        dp->sem = handle; dp->thr = PCB::runningThread;
        if (!SEM::timed || SEM::timeAbs > time) {
            dp->next = SEM::timed;
            if (SEM::timed)
                SEM::timed->timeRel = SEM::timeAbs - time;
            SEM::timed = dp;
            SEM::timed->timeRel = 0;
            SEM::timeAbs = time;
        } else {
            time -= SEM::timeAbs;
            SEM::DataPack *cur = SEM::timed;
            while (cur->next && cur->next->timeRel < time) {
                cur = cur->next;
                time -= cur->timeRel;
            }
            dp->timeRel = time;
            dp->next = cur->next;
            cur->next = dp;
        }

        handle->blocked->push(PCB::runningThread);
        PCB::runningThread->suspend();
        PCB::yield();


        if (PCB::runningThread->isTimeOut()) {
            handle->n++;
        }

    }

    int ret = (handle->closed) ? -1 : (PCB::runningThread->isTimeOut()) ? -2 : 0;
    PCB::runningThread->resetTimeOut();

    return ret;
}

void SEM::removeBlocked() {
    blocked->remove(SEM::timed->thr);
}

int SEM::tryWait(SEM *handle) {
    if (handle->closed)
        return -1;

    return ((int)handle->n > 0);
}

void *SEM::DataPack::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
}

void SEM::DataPack::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}


void *SEM::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
}

void SEM::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}
