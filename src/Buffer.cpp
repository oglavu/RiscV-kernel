//
// Created by os on 5/22/24.
//

#include "../h/Buffer.hpp"


Buffer* Buffer::inBuffer = nullptr;
Buffer* Buffer::outBuffer = nullptr;

Buffer::Buffer() {
    sem_open(&this->spaceAvailable, SIZE);
    sem_open(&this->itemAvailable, 0);
}

char Buffer::getc() {
    itemAvailable->wait();
    char c = array[start];
    start = (start+1) % SIZE;
    spaceAvailable->signal();
    return c;
}

void Buffer::putc(char c){
    spaceAvailable->wait();
    array[end] = c;
    end = (end+1) % SIZE;
    itemAvailable->signal();
}

void *Buffer::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

void Buffer::operator delete(void *p) {
    MemoryAllocator::mem_free(p);
}

bool Buffer::isEmpty() {
    return itemAvailable->value() == 0;
}
