//
// Created by os on 5/19/24.
//

#include "../h/sem.hpp"

Queue<SEM>* SEM::deadSems = nullptr;

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
    PCB::runningThread->setState(ThreadState::Blocked);
    PCB::dispatch();
}

void SEM::unblock(){
    PCB* thread = blocked->pop();
    if (thread->isTimed()) {
        auto key = (PriorityQueue<PCB>::Key) thread->getWaitingKey();
        Scheduler::callOut(key, thread);
    } else {
        thread->setState(ThreadState::Ready);
    }
    Scheduler::put(thread);
}

int SEM::close() {
    if (closed)
        return -1;

    closed = true;

    while(!blocked->isEmpty()) {
        PCB* cur = blocked->pop();
        auto key = (PriorityQueue<PCB>::Key) cur->getWaitingKey();
        Scheduler::callOut(key, cur);
        Scheduler::put(cur);
    }

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

int SEM::timedWait(time_t time) {
    if (closed)
        return -1;

    int ret = 0;
    if ((int) --n < 0) {

        PCB::runningThread->setState(ThreadState::Timed);
        PCB::runningThread->setTimeLeft(Scheduler::getTime() + time);

        Queue<PCB>::Key semKey = blocked->push(PCB::runningThread);
        PCB::runningThread->setSemaphoreKey(semKey);

        PriorityQueue<PCB>::Key waitKey = Scheduler::putToWait(PCB::runningThread);
        PCB::runningThread->setWaitingKey(waitKey);

        PCB::dispatch();

        if (closed) {
            ret = -1;
            n++;
        } else if (Scheduler::getTime() > PCB::runningThread->getTimeLeft()) {
            // timeout
            ret = -2;
            n++;
        }

        PCB::runningThread->setTimeLeft();

    }

    return ret;
}


int SEM::tryWait() {
    if (closed)
        return -1;

    return ((int)n > 0);
}

void *SEM::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
}

void SEM::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}
