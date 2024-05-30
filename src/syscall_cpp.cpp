//
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.hpp"

_node* PeriodicThread::pendingTermination = nullptr;


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
    _node* node, *prev = nullptr;
    while(true) {
        time_sleep(period);
        // check if current node's termination is pending
        node = pendingTermination;
        while(node && node->handle != getHandle()) {
            prev = node; node = node->next;
        }
        if (node) break;

        // do periodic action
        this->periodicActivation();
    }

    // remove cur thr from pending
    if (node == pendingTermination) {
        pendingTermination = pendingTermination->next;
    } else if (node->next) {
        node->handle = node->next->handle;
        _node* nxt = node->next;
        node->next = node->next->next;
        node = nxt;
    } else {
        prev->next = nullptr;
    }
    delete node;
}

void PeriodicThread::terminate() {
    _node* n = new _node;
    n->next = pendingTermination;
    n->handle = this->getHandle();
    pendingTermination = n;
}

PeriodicThread::~PeriodicThread() {
    if (!pendingTermination) return;
    _node *cur = pendingTermination;
    _node *prev = nullptr;
    for (; cur && cur->handle != getHandle(); prev = cur, cur = cur->next);
    if (pendingTermination == cur) {
        pendingTermination = cur->next;
        delete cur;
    } else if (cur && cur->next) {
        cur->handle = cur->next->handle;
        int *p = (int *) cur->next;
        cur->next = cur->next->next;
        delete p;
    } else if (cur) {
        delete cur;
        prev->next = nullptr;
    }
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
