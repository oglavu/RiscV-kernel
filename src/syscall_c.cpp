//
// Created by os on 5/4/24.
//

#include "../h/syscall_c.h"


void* mem_alloc(size_t size) {
    RiscV::a1W(size);
    RiscV::a0W(RiscV::CodeOps::MEM_ALOC);

    __asm__ volatile ("ecall");

    uint64 volatile retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (void*) retVal;
}


int mem_free(void* ptr){
    RiscV::a1W((uint64)ptr);
    RiscV::a0W(RiscV::CodeOps::MEM_FREE);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

int thread_create(thread_t* handle,
                  void(*start_routine) (void*),
                  void* arg ) {
    uint8* stack = nullptr; // uint64 !!!!!!!!!!!!!!!!!!!!!!
    if (start_routine) {
        stack = (uint8*)mem_alloc(sizeof(uint8)*DEFAULT_STACK_SIZE); // uint64 !!!!!!!!!!!!!!!!!!!!!! x2
        if (!stack) return -1;
    }
    RiscV::a4W((uint64)stack);
    RiscV::a3W((uint64)arg);
    RiscV::a2W((uint64)start_routine);
    RiscV::a1W((uint64)handle);
    RiscV::a0W((uint64)RiscV::CodeOps::THR_CREA);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

int thread_exit() {
    RiscV::a0W(RiscV::CodeOps::THR_EXIT);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

void thread_dispatch() {
    RiscV::a0W(RiscV::CodeOps::THR_YIEL);

    __asm__ volatile ("ecall");
}

int sem_open (sem_t* handle, unsigned init ) {
    RiscV::a2W((uint64) init);
    RiscV::a1W((uint64) handle);
    RiscV::a0W((uint64) RiscV::CodeOps::SEM_OPEN);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

int sem_close (sem_t handle) {
    RiscV::a1W((uint64) handle);
    RiscV::a0W((uint64) RiscV::CodeOps::SEM_CLOS);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

int sem_wait (sem_t id){
    RiscV::a1W((uint64) id);
    RiscV::a0W((uint64) RiscV::CodeOps::SEM_WAIT);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}
int sem_signal (sem_t id) {

    RiscV::a1W((uint64) id);
    RiscV::a0W((uint64) RiscV::CodeOps::SEM_SIGN);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

int sem_timedwait(sem_t id, time_t time) {
    RiscV::a2W((uint64) time);
    RiscV::a1W((uint64) id);
    RiscV::a0W((uint64) RiscV::CodeOps::SEM_TMDW);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

int sem_trywait(sem_t id) {
    RiscV::a1W((uint64) id);
    RiscV::a0W((uint64) RiscV::CodeOps::SEM_TRYW);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

int time_sleep (time_t time) {
    RiscV::a1W((uint64) time);
    RiscV::a0W((uint64) RiscV::CodeOps::THR_SLEE);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

char getc() {
    RiscV::a0W((uint64) RiscV::CodeOps::CON_GETC);

    __asm__ volatile ("ecall");

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return (int) retVal;
}

void putc(char c) {
    RiscV::a1W((uint64) c);
    RiscV::a0W((uint64) RiscV::CodeOps::CON_PUTC);

    __asm__ volatile ("ecall");
}



