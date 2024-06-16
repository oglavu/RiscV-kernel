//
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.hpp"


/* -------- MEM ALLOC ---------- */
void *operator new(size_t n) {
    return mem_alloc(n);
}

void *operator new[](size_t n) {
    return mem_alloc(n);
}

void operator delete(void *p) noexcept {
    mem_free(p);
}

void operator delete[](void *p) noexcept {
    mem_free(p);
}



/* -------- THREAD ---------- */
Thread::Thread(void (*body)(void *), void *arg):
    body(body), arg(arg) { }

Thread::~Thread() { }

int Thread::start() {
    using ThreadBody = void(*)(void*);

    void* funcArg = this->body ? arg : this;
    ThreadBody funcBody = this->body ? body : (ThreadBody) [](void* arg) {
        Thread* curThread = static_cast<Thread*>(arg);
        curThread->run();
    };

    return thread_create(&myHandle, funcBody, funcArg);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t t) {
    return time_sleep(t);
}

Thread::Thread():
    body(nullptr), arg(nullptr) { }


/* -------- PER THREAD ---------- */
PeriodicThread::PeriodicThread(time_t period) :
        Thread(), period(period) { }


void PeriodicThread::run() {
    if (period == 0) return;
    while(period > 0) {
        time_sleep(period);
        // do periodic action
        this->periodicActivation();
    }
}

void PeriodicThread::terminate() {
    period = 0;
}

PeriodicThread::~PeriodicThread() {
    terminate();
}


/* -------- SEMAPHORE ---------- */
Semaphore::Semaphore(unsigned int init) {
    sem_open(&this->myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(this->myHandle);
}

int Semaphore::wait() {
    return sem_wait(this->myHandle);
}

int Semaphore::signal() {
    return sem_signal(this->myHandle);
}

int Semaphore::timedWait(time_t t) {
    return sem_timedwait(this->myHandle, t);
}

int Semaphore::tryWait() {
    return sem_trywait(this->myHandle);
}


char Console::getc() {
    return ::getc();
}

void Console::putc(char chr) {
    return ::putc(chr);
}
