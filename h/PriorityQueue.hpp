//
// Created by os on 5/31/24.
//

#ifndef PROJEKAT_PRIORITYQUEUE_HPP
#define PROJEKAT_PRIORITYQUEUE_HPP

#include "MemoryAllocator.hpp"

template <typename T>
class PriorityQueue {
private:
    // min-heap
    // true means t1 > t2
    using ComparatorFunc = bool (*) (const T*, const T*);

    static const uint64 INIT_SIZE = 32;

    uint64 last = 0; // first free position
    uint64 SIZE = INIT_SIZE;
    T** dataArray;
    ComparatorFunc GRT;

    void resize();

public:
    PriorityQueue(bool(*pf)(const T*, const T*)): GRT(pf) {
        dataArray = (T**)MemoryAllocator::mem_alloc(sizeof(T*) * INIT_SIZE);
    }
    PriorityQueue(const PriorityQueue<T>&) = delete;
    PriorityQueue<T>& operator=(PriorityQueue<T>&) = delete;

    void push(T* data);
    T* pop();

    bool isEmpty() const { return last == 0; }
    T* peekFirst() const { return (isEmpty() ? nullptr : dataArray[0]); }

    ~PriorityQueue();

    void* operator new(size_t);
    void operator delete(void*);
    void* operator new[](size_t) = delete;
    void operator delete[](void*)  = delete;
};

template <typename T>
void PriorityQueue<T>::push(T* data) {
    if (last == SIZE) {
        resize();
    }

    // insert on first free position [self->last]
    uint64 cur = last++;
    uint64 parent = (cur - 1) / 2;
    dataArray[cur] = data;

    // rearrange ancestors
    while(cur > 0 && GRT(dataArray[parent], dataArray[cur])) {
        // swap
        T* tmp = dataArray[parent];
        dataArray[parent] = dataArray[cur];
        dataArray[cur] = tmp;

        cur = parent;
        parent = (cur - 1) / 2;
    }
}

template <typename T>
T* PriorityQueue<T>::pop() {
    if (last == 0) return nullptr;

    // save min
    T* data = dataArray[0];
    // insert last taken on first pos [--last]
    dataArray[0] = dataArray[--last];

    // set cur to top pos and set its children
    uint64 cur = 0;
    uint64 left = 2*cur + 1;
    uint64 right = 2*cur + 2;

    if (right >= last) return data; // out-of-bound
    uint64 minKey = GRT(dataArray[left], dataArray[right]) ? right : left;

    while(minKey < last && GRT(dataArray[cur], dataArray[minKey])) {
        // swap
        T* tmp = dataArray[cur];
        dataArray[cur] = dataArray[minKey];
        dataArray[minKey] = tmp;

        // update
        cur = minKey;
        left = 2*cur + 1;
        right = 2*cur + 2;
        if (right >= last) return data; // out-of-bound
        minKey = GRT(dataArray[left], dataArray[right]) ? right : left;
    }

    return data;
}

template<typename T>
void PriorityQueue<T>::resize() {
    // double dataArray size
    SIZE *= 2;
    T** newDataArray = (T**)MemoryAllocator::mem_alloc(sizeof(T*) * SIZE);

    // copy contents of old dataArray to newDataArray
    for (uint64 i = 0; i < SIZE/2; i++) {
        newDataArray[i] = dataArray[i];
    }

    // swap and delete old
    T** oldDataArray = dataArray;
    dataArray = newDataArray;

    MemoryAllocator::mem_free(oldDataArray);
}

template<typename T>
PriorityQueue<T>::~PriorityQueue() {
    MemoryAllocator::mem_free(dataArray);
}

template<typename T>
void PriorityQueue<T>::operator delete(void* p) {
    MemoryAllocator::mem_free(p);
}

template<typename T>
void *PriorityQueue<T>::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}




#endif //PROJEKAT_PRIORITYQUEUE_HPP
