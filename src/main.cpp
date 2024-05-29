//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/_buffer.hpp"
#include "../h/_print.hpp"

extern void userMain();

static bool userFinished = false;
void userMainWrapper(void*) {
    userMain();
    userFinished = true;
}

void printMem(AVLTree* root) {
    AVLTree* cur = root;
    static const uint64 N = 256;
    static const uint64 R = 4;
    for (uint64 i=0; i<N; i++) {
        uint64 addr = i*MEM_BLOCK_SIZE + MemoryAllocator::startAddr;
        uint64 freeStart = (uint64)cur;
        uint64 freeSize = cur->sz + MemoryAllocator::HEADER_SIZE;

        if (cur && addr == freeStart + freeSize) {
            cur = cur->next;
            freeStart = (uint64)cur;
        }

        if (cur && addr < freeStart)
            putc('|');
        else
            putc('.');

        if ((i+1) % (N/R) == 0) putc('\n');

    }
    putc('\n');
}


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable);

    _buffer::inBuffer = new _buffer();
    _buffer::outBuffer = new _buffer();

    RiscV::ms_sstatus(RiscV::BitMaskSStatus::SSTATUS_SIE);
    _thread* userMainThread, *outputThread;
    bool outputThreadStatus = true;
    thread_create(&outputThread, &_thread::outputThreadBody, &outputThreadStatus);
    thread_dispatch();

    RiscV::userMode = true;
    thread_create(&userMainThread, &userMainWrapper, nullptr);

    while(!userFinished) {
        thread_dispatch();
    }

    outputThreadStatus = false;
    thread_dispatch();

    delete outputThread;

    return 0;
}
