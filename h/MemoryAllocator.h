//
// Created by os on 5/1/24.
//

#ifndef PROJEKAT_MEMORYALLOCATOR_H
#define PROJEKAT_MEMORYALLOCATOR_H

#include "../lib/hw.h"
#include "AVLTree.h"

class MemoryAllocator {
private:




    static bool initialised;

    static void init();
public:
    static uint64 startAddr;
    static uint64 endAddr;
    static const uint64 HEADER_SIZE;
    static AVLTree* free;
    static AVLTree* first;

    MemoryAllocator(const MemoryAllocator &obj) = delete;
    MemoryAllocator operator=(MemoryAllocator& obj) = delete;


    static void* mem_alloc(size_t size);
    static int mem_free(void* ptr);

};


#endif //PROJEKAT_MEMORYALLOCATOR_H
