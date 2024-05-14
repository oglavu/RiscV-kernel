//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/syscall_cpp.h"
#include "../h/_thread.h"

const int N = 10;


void Afunc(void* p) {
    for(int i=0; i < N; i++) {
        __putc('A');
        __putc((char)('0' + i));
        __putc('\n');
        _thread::yield();
    }

}

void Bfunc(void* p) {
    for(int i=0; i < N; i++) {
        __putc('B');
        __putc((char)('0' + i));
        __putc('\n');
        _thread::yield();
    }
}

void Cfunc(void* p) {
    for(int i=0; i < N; i++) {
        __putc('C');
        __putc((char)('0' + i));
        __putc('\n');
        _thread::yield();
    }
}

void printMem(AVLTree* root) {
    /*
     * Function that visualises memory occupation
     * by printing N blocks in ROW rows
     * '.' block is free
     * '|' block is taken
     * param: MemoryAllocator::first
    */
    const uint64 N = 1024;
    const uint64 ROW = 16;
    AVLTree* cur = root;
    for (uint64 i=0; i<N ;i++) {
        uint64 addr = i*MEM_BLOCK_SIZE + MemoryAllocator::startAddr;
        uint64 freeStart = (uint64)cur;
        uint64 blockSize = cur->sz + MemoryAllocator::HEADER_SIZE;

        if (cur && addr == freeStart + blockSize) {
            cur = cur->next;
            freeStart = (uint64)cur;
            blockSize = cur->sz + MemoryAllocator::HEADER_SIZE;
        }

        if (cur && addr < freeStart) {
            __putc('|');
        } else {
            __putc('.');
        }
        if ((i+1) % (N/ROW) == 0) __putc('\n');
    }
    __putc('\n');
    __putc('\n');
}



int main() {


    RiscV::stvecW((uint64)&RiscV::setStvecTable);

    _thread* th1 = new _thread(&Afunc, nullptr);
    _thread* th2 = new _thread(&Bfunc, nullptr);
    _thread* th3 = new _thread(&Cfunc, nullptr);
    th1->start();
    th2->start();
    th3->start();

    th1->join();
    th2->join();
    th3->join();

    delete th1;
    delete th2;
    delete th3;



    //Queue<_thread>::push(Scheduler::readyQueue, new _thread(nullptr, nullptr));
    printMem(MemoryAllocator::first);
    return 0;
}
