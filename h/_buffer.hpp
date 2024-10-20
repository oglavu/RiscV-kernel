//
// Created by os on 5/22/24.
//

#ifndef PROJEKAT__BUFFER_HPP
#define PROJEKAT__BUFFER_HPP

#include "sem.hpp"
#include "MemoryAllocator.hpp"

class SEM;

class _buffer {
public:
    _buffer();
    static _buffer* inBuffer;
    static _buffer* outBuffer;

    char getc();
    void putc(char);
    bool isEmpty();

    ~_buffer();

    static void outBufferFlush();
    static void inBufferFill();

    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;

private:

    SEM* spaceAvailable;
    SEM* itemAvailable;
    static const uint64 SIZE = 512;
    uint64 start = 0, end = 0;
    char array[SIZE];

 };


#endif //PROJEKAT__BUFFER_HPP
