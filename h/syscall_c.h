//
// Created by os on 5/4/24.
//

#ifndef PROJEKAT_SYSCALL_C_H
#define PROJEKAT_SYSCALL_C_H

#include "../lib/hw.h"
#include "../h/RiscV.h"

void* mem_alloc(size_t size);
int mem_free(void*);

class _thread;
typedef _thread* thread_t;
int thread_create(thread_t* handle,
                  void(*start_routine) (void*),
                  void* arg );
int thread_exit();
void thread_dispatch();


#endif //PROJEKAT_SYSCALL_C_H
