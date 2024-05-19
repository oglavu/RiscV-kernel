//
// Created by os on 5/4/24.
//

#ifndef PROJEKAT_SYSCALL_CPP_H
#define PROJEKAT_SYSCALL_CPP_H

#include "syscall_c.h"

void *operator new(size_t);
void *operator new[](size_t);
void operator delete(void*) noexcept;
void operator delete[](void*) noexcept;


class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
private:
    thread_t myHandle;
    void (*body)(void*); void* arg;
};



#endif //PROJEKAT_SYSCALL_CPP_H
