//
// Created by os on 5/1/24.
//

#ifndef PROJEKAT_MEMORYALLOCATOR_HPP
#define PROJEKAT_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

struct DataBlock {
    DataBlock* next;
    size_t sz;
};

class MemoryAllocator {
private:
    // in bytes
    static uint64 startAddr;
    static uint64 endAddr;
    // in blocks
    static const uint64 HEADER_SIZE;
    static DataBlock* first;

    static bool initialised;
public:
    MemoryAllocator() = delete;
    MemoryAllocator(const MemoryAllocator &obj) = delete;
    MemoryAllocator operator=(MemoryAllocator& obj) = delete;

    static void init();

    static void* mem_alloc(size_t size);
    static int mem_free(void* ptr);

};


#endif //PROJEKAT_MEMORYALLOCATOR_HPP
