//
// Created by os on 5/1/24.
//

#include "../h/MemoryAllocator.hpp"

DataBlock* MemoryAllocator::first = nullptr;
uint64 MemoryAllocator::startAddr = 0;
uint64 MemoryAllocator::endAddr = 0;
const uint64 MemoryAllocator::HEADER_SIZE =
                (uint64) (sizeof(DataBlock) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
bool MemoryAllocator::initialised = false;

void MemoryAllocator::init() {
    if (MemoryAllocator::initialised) return;

    MemoryAllocator::startAddr = (((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    MemoryAllocator::endAddr = ((uint64)HEAP_END_ADDR / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;

    MemoryAllocator::first = (DataBlock*) MemoryAllocator::startAddr;
    MemoryAllocator::first->sz =
            (size_t) (MemoryAllocator::endAddr - MemoryAllocator::startAddr - MemoryAllocator::HEADER_SIZE * MEM_BLOCK_SIZE);

    MemoryAllocator::initialised = true;
}

void* MemoryAllocator::mem_alloc(size_t n) {
    if (n == 0) return nullptr;
    if (!MemoryAllocator::initialised)
        MemoryAllocator::init();

    // finding best-fit
    DataBlock* prevFreeSeg = nullptr;
    DataBlock* freeSeg = nullptr;
    DataBlock* prevIter = nullptr;
    DataBlock* iter = MemoryAllocator::first;
    while(iter) {
        if (iter->sz == n) { prevFreeSeg = prevIter; freeSeg = iter; break; }
        if (iter->sz > n) { prevFreeSeg = prevIter; freeSeg = iter; }
        prevIter = iter;
        iter = iter->next;
    }
    // no suitable segment
    if (!freeSeg) return nullptr;

    // remove freeSeg from list
    if (prevFreeSeg) {
        prevFreeSeg->next = freeSeg->next;
    } else {
        MemoryAllocator::first = MemoryAllocator::first->next;
    }

    if (n + HEADER_SIZE + 1 <= freeSeg->sz) {
        // spliting found best-fit
        DataBlock* newFreeSeg = (DataBlock*) ((uint64)freeSeg + (n + HEADER_SIZE) * MEM_BLOCK_SIZE);
        newFreeSeg->sz = freeSeg->sz - n - HEADER_SIZE;
        freeSeg->sz = n;

        // insert remaining part of freeBlock
        if (prevFreeSeg) {
            newFreeSeg->next = prevFreeSeg->next;
            prevFreeSeg->next = newFreeSeg;
        } else {
            newFreeSeg->next = MemoryAllocator::first;
            MemoryAllocator::first = newFreeSeg;
        }
    }

    freeSeg->next = 0;
    return (void*) ((uint64)freeSeg + HEADER_SIZE * MEM_BLOCK_SIZE);
}



int MemoryAllocator::mem_free(void *ptr) {

    if (!ptr) return -1; // nullptr
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesn't point to beginning of block (faulty ptr)
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound

    DataBlock* toFree = (DataBlock*) ((uint64)ptr - HEADER_SIZE * MEM_BLOCK_SIZE); toFree->next = nullptr;
    DataBlock* aft = ((uint64)toFree + (toFree->sz + HEADER_SIZE) * MEM_BLOCK_SIZE >= MemoryAllocator::endAddr) ? nullptr :
            (DataBlock*) ((uint64)toFree + (toFree->sz + HEADER_SIZE) * MEM_BLOCK_SIZE);

    // whole memory used
    if (MemoryAllocator::first == nullptr) {
        MemoryAllocator::first = toFree;
        MemoryAllocator::first->next = nullptr;
        return 0;
    }


    DataBlock* iter = MemoryAllocator::first; // first block whose address is grtE toFree
    DataBlock* prevIter = nullptr; // first block whose address is lt toFree
    while(iter && (uint64)iter < (uint64)toFree) {
        prevIter = iter;
        iter = iter->next;
    }

    if (iter && (uint64)iter == (uint64)toFree) return -5; // mem already freed
    if (iter && (uint64)toFree + (toFree->sz + HEADER_SIZE) * MEM_BLOCK_SIZE > (uint64)iter) return -4; // mem block overlaps another
    if (prevIter && (uint64)prevIter + (prevIter->sz + HEADER_SIZE) * MEM_BLOCK_SIZE > (uint64)toFree) return -6; // mem block already contained in free mem

    // insert toFree
    toFree->next = iter;
    ((prevIter) ? prevIter->next : MemoryAllocator::first) = toFree;

    if (aft && iter && (uint64)aft == (uint64)iter) {
        // block after toFree is free as well, merge them
        toFree->sz += aft->sz + HEADER_SIZE;
        toFree->next = iter->next;
        ((prevIter) ? prevIter->next : MemoryAllocator::first) = toFree;
    }

    if (prevIter && (uint64)prevIter + (prevIter->sz + HEADER_SIZE) * MEM_BLOCK_SIZE == (uint64)toFree) {
        // block before toFree is free as well. merge them
        prevIter->sz += toFree->sz + HEADER_SIZE;
        prevIter->next = toFree->next;
    }


    return 0;
}

