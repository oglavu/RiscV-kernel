//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_QUEUE_HPP
#define PROJEKAT_QUEUE_HPP

#include "MemoryAllocator.hpp"

template<typename T>
class Queue {
private:
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
    T** last = nullptr; // points to last taken address

    void* getHeadNodeAddr() const { return (void*)last; }
    void remove(void* ptr);

public:
    Queue() = default;
    Queue(const Queue<T>&) = delete;
    Queue<T>& operator=(Queue<T>&) = delete;

    void* operator new(size_t);
    void operator delete(void*);
    void* operator new[](size_t) = delete;
    void operator delete[](void*)  = delete;

    T* peekFirst() const { return (T*)head; }
    T* peekLast() const { return (T*)last; }

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
        QueueNode* del = node->next;
        node = del;
        delete node;
    }
}

template<typename T>
T *Queue<T>::pop(Queue<T>* self) {
    if (!self->head) return nullptr;
    // taking data from head
    T* data = *self->head;
    self->head = (T**) ((uint64)self->head + sizeof(T*));

    if (((uint64)self->head + sizeof(QueueNode*)) % MEM_BLOCK_SIZE == 0) {
        QueueNode* emptyBlock = (QueueNode*) (((uint64)self->head / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE );

        if ( (uint64)self->head - sizeof(T*) == (uint64)self->last) {
            // no next allocated block
            self->head = self->last = nullptr;
        } else {
            // hoping to next allocated block
            self->head = (T**) (*(QueueNode**)self->head);
        }
        delete emptyBlock;
        return data;
    }

    // if head > last doesn't mean they are in same block
    if ((uint64)self->head > (uint64)self->last &&
            (uint64)self->head / MEM_BLOCK_SIZE == (uint64)self->last / MEM_BLOCK_SIZE) {
        QueueNode* emptyBlock = (QueueNode*) (((uint64)self->head / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE );
        self->head = self->last = nullptr;
        delete emptyBlock;
    }

    return data;
}

template<typename T>
void Queue<T>::push(Queue<T>*self ,T *data) {

    // placing new data on self->last
    if (!self->head || ((uint64)self->last + sizeof(T*) + sizeof(QueueNode*)) % MEM_BLOCK_SIZE == 0) {
        if (!self->head) {
            // no head, allocating first node
            self->head = self->last = (T**) (new QueueNode());
            *self->head = data;
        } else {
            // data exceeded block
            *(QueueNode **) ((uint64)self->last + sizeof(T *)) = new QueueNode();
            self->last = (T**) *(QueueNode**) ((uint64)self->last + sizeof(T *));
            *self->last = data;
        }
        return;
    }

    // block not filled yet
    self->last = (T**) ((uint64)self->last + sizeof(T*));
    *self->last = data;
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
