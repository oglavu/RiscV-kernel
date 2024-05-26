//
// Created by os on 5/22/24.
//

#ifndef PROJEKAT_BUFFER_HPP
#define PROJEKAT_BUFFER_HPP

#include "_sem.hpp"
#include "MemoryAllocator.h"


class Buffer {
public:
    Buffer();
    static Buffer* inBuffer;
    static Buffer* outBuffer;

    char getc();
    void putc(char);
    bool isEmpty();

    void* operator new(size_t sz);
    void operator delete(void* p);

private:


    _sem* spaceAvailable;
    _sem* itemAvailable;
    static const uint64 SIZE = 512;
    uint64 start = 0, end = 0;
    char array[SIZE];

 };


#endif //PROJEKAT_BUFFER_HPP
