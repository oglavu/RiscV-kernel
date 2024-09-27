//
// Created by os on 5/6/24.
//

#include "../h/Scheduler.hpp"

bool Scheduler::initialised = false;
uint64 Scheduler::timer = 0;
Queue<PCB>* Scheduler::readyQueue = nullptr;
PriorityQueue<Scheduler::SleepNode>* Scheduler::sleepingPQ = nullptr;

PCB *Scheduler::get() {
    return (Scheduler::initialised) ?
        readyQueue->pop() : nullptr;
}

void Scheduler::put(PCB * data) {
    if (!Scheduler::initialised)
        Scheduler::init();
    readyQueue->push(data);
}

void Scheduler::sleep(PCB* thread,time_t time) {
    SleepNode* node = new SleepNode;
    node->delay = Scheduler::timer + time;
    node->thread = thread;

    sleepingPQ->push(node);
}


void Scheduler::alarm() {
    if (!sleepingPQ || !sleepingPQ->peekFirst()) return;
    if (Scheduler::timer >= sleepingPQ->peekFirst()->delay) {
        SleepNode* wokenUp = sleepingPQ->pop();
        Scheduler::put(wokenUp->thread);
        delete wokenUp;
    }
}

void Scheduler::clear() {
    if (!sleepingPQ || sleepingPQ->isEmpty()) return;
    while(Scheduler::sleepingPQ->peekFirst()){
        delete sleepingPQ->pop();
    }
    delete sleepingPQ;
}

void Scheduler::init() {
    if (Scheduler::initialised) return;
    // init queue for ready threads
    Scheduler::readyQueue = new Queue<PCB>();
    // init queue for sleeping threads
    Scheduler::sleepingPQ = new PriorityQueue<SleepNode>(&SleepNode::GRT);
    Scheduler::initialised = true;
}

Scheduler::~Scheduler() {
    Scheduler::clear();
}

void *Scheduler::SleepNode::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
}

void Scheduler::SleepNode::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}
