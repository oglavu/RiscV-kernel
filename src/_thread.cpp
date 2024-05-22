//
// Created by os on 5/8/24.
//

#include "../h/_thread.h"

_thread* _thread::runningThread = nullptr;
_thread* _thread::mainThread = nullptr;
_thread::SleepNode* _thread::sleepList = nullptr;
time_t _thread::sleepTimeFirst = 0;
uint64 _thread::curPeriod = 0;

_thread::_thread(_thread::ThreadBody bodyy, void *arg, uint8* allocStack): // UINT64 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    body(bodyy), bodyArguement(arg) {
    if (!_thread::mainThread)
        _thread::init();
    // stack grows downwards, so first location is top of allocated space
    stackStartAddr = (uint64)allocStack;
    parentThread = _thread::runningThread;
    // Not subtracting one bcs stack should point to last TAKEN address
    context.sp = stackStartAddr + sizeof(uint8)*DEFAULT_STACK_SIZE; // UINT64 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    context.ra = (uint64) &_thread::wrap;
    state = ThreadState::Ready;
    if (body) Scheduler::put(this);
}

void _thread::dispatch() {
    _thread *oldR = _thread::runningThread;
    if (!oldR) return;
    if (oldR->state == ThreadState::Running) {
        oldR->state = ThreadState::Ready;
        Scheduler::put(oldR);
    }

    _thread* newR;
    if (_sem::timed && _sem::timeAbs == 0) {
        newR = _sem::timed->thr;
        _sem::timed->sem->removeBlocked();
        _sem::timed->sem->timedOut = true;
        _sem::timeAbs = (_sem::timed->next) ? _sem::timed->next->timeRel : 0;
        int* ptr = (int*)_sem::timed;
        _sem::timed = _sem::timed->next;
        delete ptr;
    } else
        newR = Scheduler::get();


    if (newR) {
        _thread::runningThread = newR;
        _thread::runningThread->state = ThreadState::Running;
        _thread::contextSwitch(&oldR->context, &newR->context);
    }
}

void _thread::wrap() {
    RiscV::popSppSpie();
    runningThread->body(runningThread->bodyArguement);
    _thread::complete();
}

void _thread::init() {
    if (mainThread) return;
    _thread::mainThread = (_thread*)1; // blocking infinite loop
    _thread::mainThread = new _thread(nullptr, nullptr, nullptr);
    // context will anyway be changed after first dispatch
    _thread::runningThread = _thread::mainThread;
    _thread::runningThread->state = ThreadState::Running;
}

void _thread::complete() {
    _thread::runningThread->state = ThreadState::Terminated;
    _thread::yield();
}

// stack is allocated in ABI
int _thread::createThread(_thread **handle, _thread::ThreadBody bodyy, void *arg, uint8* allocStackParam) { // uint64 !!!!!!!!
    _thread* t = new _thread(bodyy, arg, allocStackParam);
    if (!t || !allocStackParam) return -1;
    *handle = t;
    return 0;
}

int _thread::exitThread() {
    if (_thread::runningThread->state != ThreadState::Running) return -1;
    _thread::runningThread->complete();
    return 0;
}

void _thread::yield() {
    RiscV::a0W(RiscV::CodeOps::THR_YIEL);
    __asm__ volatile ("ecall");
}

int _thread::sleepThread(time_t time) {
    if (time == 0) return 0;

    SleepNode* sn = new SleepNode;
    sn->thread = _thread::runningThread;
    if (!_thread::sleepList || _thread::sleepTimeFirst > time) {
        sn->next = _thread::sleepList;
        if (_thread::sleepList)
            _thread::sleepList->timeRel = _thread::sleepTimeFirst - time;
        _thread::sleepList = sn;
        _thread::sleepList->timeRel = 0;
        _thread::sleepTimeFirst = time;
    } else {
        time -= _thread::sleepTimeFirst;
        SleepNode* cur = _thread::sleepList;
        while (cur->next && cur->next->timeRel < time) {
            cur = cur->next;
            time -= cur->timeRel;
        }
        sn->timeRel = time;
        sn->next = cur->next;
        cur->next = sn;
    }

    _thread::runningThread->suspend();
    _thread::yield();
    return 0;

}
