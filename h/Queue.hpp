//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_QUEUE_HPP
#define PROJEKAT_QUEUE_HPP

#include "MemoryAllocator.hpp"

template<typename T>
class Queue {
protected:
    struct QueueNode {
        static const int n = (MEM_BLOCK_SIZE - sizeof(QueueNode*)) / sizeof(T*);

        T* dataArray[n];
        QueueNode* next = nullptr;

        void* operator new(size_t);
        void operator delete(void*);
        void* operator new[](size_t) = delete;
        void operator delete[](void*)  = delete;
    };

    T** head = nullptr; // points to first taken address
    T** last = nullptr; // points to first free address

    void* getLastInsertAddr() const { return (void*)((uint64)last - sizeof(T*)); }
    void remove(void* ptr);

public:
    Queue() {
        this->head = nullptr;
        this->last = (T**) new QueueNode();
    }

    void* operator new(size_t);
    void operator delete(void*);
    void* operator new[](size_t) = delete;
    void operator delete[](void*)  = delete;

    T* peekFirst() const { return (T*)head; }

    static void push(Queue<T>* self, T* data);
    static T* pop(Queue<T>* self);

    ~Queue();

    friend class _sem;
};



template<typename T>
void Queue<T>::remove(void *ptr) {
    T* swapData = Queue<T>::pop(this);
    if (head) *(T**)ptr = swapData;

}

template<typename T>
Queue<T>::~Queue() {
    if (!head) return;
    QueueNode* node = (QueueNode*) (((uint64)this->head / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);
    while (node) {
        QueueNode* del = node;
        node = node->next;
        delete del;
    }

    this->head = nullptr;
    this->last = nullptr;
}

template<typename T>
T *Queue<T>::pop(Queue<T>* self) {
    if (!self->head) return nullptr;
    // taking data from head
    T* data = *self->head;
    self->head = (T**) ((uint64)self->head + sizeof(T*));

    if (((uint64)self->head + sizeof(QueueNode*)) % MEM_BLOCK_SIZE == 0) {
        QueueNode* emptyBlock = (QueueNode*) (((uint64)self->head / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE );

        if ( (uint64)self->head == (uint64)self->last) {
            // no next allocated block, current is empty => reset it
            self->head = nullptr;
            self->last = (T**) (((uint64)self->last / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);
        } else {
            // hoping to next allocated block
            self->head = (T**) (*(QueueNode**)self->head);
            // if head == last, block empty
            if (self->head == self->last)
                self->head = nullptr;
            delete emptyBlock;
        }
        return data;
    }

    // if head == last, block is empty, reset it
    if ((uint64)self->head == (uint64)self->last) {
        self->last = (T**) (((uint64)self->last / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE );
        self->head = nullptr;
    }

    return data;
}

template<typename T>
void Queue<T>::push(Queue<T>*self ,T *data) {

    // placing new data on self->last
    if (((uint64)self->last + sizeof(QueueNode*)) % MEM_BLOCK_SIZE == 0) {
        // data exceeded block
        *(QueueNode **)self->last = new QueueNode();
        self->last = (T**) *(QueueNode**)self->last;
        *self->last = data;
        self->last = (T**) ((uint64)self->last + sizeof(T*));
        return;
    }

    // block not filled yet
    if (!self->head) self->head = self->last;
    *self->last = data;
    self->last = (T**) ((uint64)self->last + sizeof(T*));
}

template<typename T>
void Queue<T>::QueueNode::operator delete(void* p) {
    MemoryAllocator::mem_free(p);
}

template<typename T>
void *Queue<T>::QueueNode::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

template<typename T>
void Queue<T>::operator delete(void* p) {
    MemoryAllocator::mem_free(p);
}

template<typename T>
void *Queue<T>::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}



#endif //PROJEKAT_QUEUE_HPP
