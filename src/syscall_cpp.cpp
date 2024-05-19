//
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.h"

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


Thread::Thread(void (*body)(void *), void *arg):
    body(body), arg(arg) { }

Thread::~Thread() {
}

struct Wrapper: public Thread {
    static void wrap(void* arg){
        Wrapper* curThread = (Wrapper*) arg;
        curThread->run();
    }
};
int Thread::start() {
    using ThreadBody = void(*)(void*);

    void* funcArg = this->body ? arg : this;
    ThreadBody funcBody = this->body ? body : (ThreadBody) [](void* arg) {
        Thread* curThread = (Thread*) arg;
        curThread->run();
    };

    return thread_create(&myHandle, funcBody, funcArg);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t) {
    return 0;
}

Thread::Thread() {

}
