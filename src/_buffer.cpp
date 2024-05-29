//
// Created by os on 5/22/24.
//

#include "../h/_buffer.hpp"


_buffer* _buffer::inBuffer = nullptr;
_buffer* _buffer::outBuffer = nullptr;

_buffer::_buffer() {
    _sem::createSemaphore(&this->spaceAvailable, SIZE);
    _sem::createSemaphore(&this->itemAvailable, 0);
}

char _buffer::getc() {
    itemAvailable->wait();
    char c = array[start];
    start = (start+1) % SIZE;
    spaceAvailable->signal();
    return c;
}

void _buffer::putc(char c){
    spaceAvailable->wait();
    array[end] = c;
    end = (end+1) % SIZE;
    itemAvailable->signal();
}

void *_buffer::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

void _buffer::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}

bool _buffer::isEmpty() {
    return itemAvailable->value() == 0;
}

_buffer::~_buffer() {
    _sem::closeSemaphore(this->spaceAvailable);
    _sem::closeSemaphore(this->itemAvailable);
}
