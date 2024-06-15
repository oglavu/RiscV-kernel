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

    void push(T* data);
    T* pop();

    ~Queue();

    friend class _sem;
};



template<typename T>
void Queue<T>::remove(void *ptr) {
    T* swapData = this->pop();
    if (!head) return;
    QueueNode* headNode = (QueueNode*) (((uint64)this->head / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);
    QueueNode* lastNode = (QueueNode*) (((uint64)this->last / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);

    int firstT = ((uint64)this->head - (uint64)headNode) / sizeof(T*);
    int lastT = ((uint64)this->last - (uint64)lastNode) / sizeof(T*) - 1;
    QueueNode* node = headNode;
    while(node) {
        for (int i=0; i<QueueNode::n; i++) {
            if (headNode == node && i < firstT) continue;
            if (lastNode == node && i > lastT) continue;
            if (node->dataArray[i] == (T*)ptr) {
                node->dataArray[i] = swapData;
                return;
            }

        }
        node = node->next;
    }


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
T *Queue<T>::pop() {
    if (!head) return nullptr;
    // taking data from head
    T* data = *head;
    head = (T**) ((uint64)head + sizeof(T*));

    if (((uint64)head + sizeof(QueueNode*)) % MEM_BLOCK_SIZE == 0) {
        QueueNode* emptyBlock = (QueueNode*) (((uint64)head / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE );

        if ( (uint64)head == (uint64)last) {
            // no next allocated block, current is empty => reset it
            head = nullptr;
            last = (T**) (((uint64)last / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);
        } else {
            // hoping to next allocated block
            head = (T**) (*(QueueNode**)head);
            // if head == last, block empty
            if (head == last)
                head = nullptr;
            delete emptyBlock;
        }
        return data;
    }

    // if head == last, block is empty, reset it
    if ((uint64)head == (uint64)last) {
        last = (T**) (((uint64)last / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE );
        head = nullptr;
    }

    return data;
}

template<typename T>
void Queue<T>::push(T *data) {

    // placing new data on self->last
    if (((uint64)last + sizeof(QueueNode*)) % MEM_BLOCK_SIZE == 0) {
        // data exceeded block
        *(QueueNode **)last = new QueueNode();
        last = (T**) *(QueueNode**)last;
        *last = data;
        last = (T**) ((uint64)last + sizeof(T*));
        return;
    }

    // block not filled yet
    if (!head) head = last;
    *last = data;
    last = (T**) ((uint64)last + sizeof(T*));
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
