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
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
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

void _buffer::outBufferFlush() {
    char status = *(char*)CONSOLE_STATUS;
    while (!_buffer::outBuffer->isEmpty() && CONSOLE_TX_STATUS_BIT & status){
        *(char*) CONSOLE_RX_DATA = _buffer::outBuffer->getc();
        status = *(char*)CONSOLE_STATUS;
    }
}

void _buffer::inBufferFill() {
    char status = *(char*)CONSOLE_STATUS;
    while (CONSOLE_RX_STATUS_BIT & status){
        char ch = *(char*) CONSOLE_RX_DATA;
        _buffer::inBuffer->putc(ch);
        status = *(char*)CONSOLE_STATUS;
    }
}
