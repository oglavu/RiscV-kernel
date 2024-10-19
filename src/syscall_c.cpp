//
// Created by os on 5/4/24.
//

#include "../h/syscall_c.h"

static uint64 systemCall(uint64 arg0 = 0,
                         uint64 arg1 = 0,
                         uint64 arg2 = 0,
                         uint64 arg3 = 0,
                         uint64 arg4 = 0) {
    // standardizes system calls
    // links variables to registers
    // -> a0 var always has same value as reg a0
    register uint64 a0 asm ("a0") = arg0;
	register uint64 a1 asm ("a1") = arg1;
	register uint64 a2 asm ("a2") = arg2;
	register uint64 a3 asm ("a3") = arg3;
    register uint64 a4 asm ("a4") = arg4;

    // tell compiler that a0 can be both rw
    // "memory" tells not to cache aX vals
    asm volatile ("ecall"
		      : "+r" (a0)
		      : "r" (a1), "r" (a2), "r" (a3), "r" (a4)
		      : "memory");
	return a0;
}

void* mem_alloc(size_t size) {
    // convert bytes to blocks
    size_t blocks = (size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    return (void*) systemCall(RiscV::MEM_ALOC, blocks);
}


int mem_free(void* ptr){
    return (int) systemCall(RiscV::MEM_FREE, (uint64)ptr);
}

int thread_create(thread_t* handle,
                  void(*start_routine) (void*),
                  void* arg ) {
    if (!start_routine)
        return -1;

    uint64* stack = (uint64*)mem_alloc(sizeof(uint64)*DEFAULT_STACK_SIZE);
    if (!stack)
        return -2;

    return (int) systemCall(RiscV::THR_CREA,
                            (uint64)handle,
                            (uint64)start_routine,
                            (uint64)arg,
                            (uint64)stack);
}

int thread_exit() {
    return (int) systemCall(RiscV::THR_EXIT);
}

void thread_dispatch() {
    systemCall(RiscV::THR_YIEL);
}

int sem_open (sem_t* handle, unsigned init ) {
    return (int) systemCall(RiscV::SEM_OPEN, (uint64)handle, (uint64) init);
}

int sem_close (sem_t handle) {
    return (int) systemCall(RiscV::SEM_CLOS, (uint64)handle);
}

int sem_wait (sem_t id){
    return (int) systemCall(RiscV::SEM_WAIT, (uint64)id);
}
int sem_signal (sem_t id) {
    return (int) systemCall(RiscV::SEM_SIGN, (uint64)id);
}

int sem_timedwait(sem_t id, time_t time) {
    return (int) systemCall(RiscV::SEM_TMDW, (uint64)id, (uint64)time);
}

int sem_trywait(sem_t id) {
    return (int) systemCall(RiscV::SEM_TRYW, (uint64)id);
}

int time_sleep (time_t time) {
    return (int) systemCall(RiscV::THR_SLEE, (uint64)time);
}

char getc() {
    return (char) systemCall(RiscV::CON_GETC);
}

void putc(char c) {
    systemCall(RiscV::CON_PUTC, (uint64)c);
}



