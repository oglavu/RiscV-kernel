//
// Created by os on 5/1/24.
//

#include "../h/MemoryAllocator.h"

AVLTree* MemoryAllocator::free = nullptr;
AVLTree* MemoryAllocator::first = nullptr;
uint64 MemoryAllocator::startAddr = 0;
uint64 MemoryAllocator::endAddr = 0;
const uint64 MemoryAllocator::HEADER_SIZE = (uint64)
        ((sizeof(AVLTree) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
bool MemoryAllocator::initialised = false;


void MemoryAllocator::init() {
    if (MemoryAllocator::initialised) return;

    MemoryAllocator::startAddr = (((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    MemoryAllocator::endAddr = ((uint64)HEAP_END_ADDR / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;

    MemoryAllocator::free = (AVLTree*) MemoryAllocator::startAddr;
    MemoryAllocator::free->resetAll();
    MemoryAllocator::free->isFree = true;
    MemoryAllocator::free->sz =
            (size_t) (MemoryAllocator::endAddr - MemoryAllocator::startAddr - MemoryAllocator::HEADER_SIZE);
    MemoryAllocator::first = MemoryAllocator::free;
    MemoryAllocator::initialised = true;
}

void* MemoryAllocator::mem_alloc(size_t size) {
    if (size <= 0) return nullptr;
    if (!MemoryAllocator::initialised)
        MemoryAllocator::init();

    size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;

    AVLTree* freeSeg = AVLTree::findFreeSeg(MemoryAllocator::free, size);
    if (!freeSeg) return nullptr;

    MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, freeSeg);

    if (size + MEM_BLOCK_SIZE + HEADER_SIZE <= freeSeg->sz
                && size + MEM_BLOCK_SIZE + HEADER_SIZE >= size) { //overflow check
        AVLTree* newFreeSeg = (AVLTree*) ((uint64)freeSeg + size + HEADER_SIZE);
        newFreeSeg->resetAll();
        newFreeSeg->sz = freeSeg->sz - size - HEADER_SIZE;
        freeSeg->sz = size;
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
        newFreeSeg->isFree = true;
    } else {
        MemoryAllocator::first = AVLTree::removeLL(freeSeg, MemoryAllocator::first);
    }
    freeSeg->isFree = false;
    return (void*) ((uint64)freeSeg + HEADER_SIZE);
}

int MemoryAllocator::mem_free(void *ptr) {

    if (!ptr) return -1;
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesn't point to beginning of block (its faulty)
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound

    AVLTree* cur = (AVLTree*) ((uint64)ptr - HEADER_SIZE); cur->resetAll(AVLTree::SAVE_SZ); cur->isFree = true;
    AVLTree* aft = ((uint64)cur + cur->sz + HEADER_SIZE >= MemoryAllocator::endAddr) ? nullptr :
            (AVLTree*) ((uint64)cur + cur->sz + HEADER_SIZE);
    AVLTree* toSwap = nullptr;

    if (aft && aft->isFree) {
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, aft);
        cur->sz += aft->sz + HEADER_SIZE;
        toSwap = aft;
    }

    AVLTree* prev = MemoryAllocator::first;
    for(;prev && prev->next && ((uint64)prev->next + prev->next->sz + HEADER_SIZE < (uint64)cur); prev = prev->next);

    if (prev && (uint64)prev + prev->sz + HEADER_SIZE == (uint64)cur) {
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, prev);
        prev->resetAll(AVLTree::SAVE_SZ);
        prev->sz += cur->sz + HEADER_SIZE;
        prev->isFree = true;

        // nullptr as toRem: no changes
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
        toSwap = (toSwap) ? toSwap : prev;
        cur = prev;
    }

    MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, cur);
    MemoryAllocator::first = (toSwap) ? AVLTree::swapLL(toSwap, cur, MemoryAllocator::first) :
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    return 0;
}

