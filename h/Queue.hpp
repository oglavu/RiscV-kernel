//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_QUEUE_HPP
#define PROJEKAT_QUEUE_HPP

#include "MemoryAllocator.hpp"

template<typename T>
class Queue {
private:
    struct Node {
        Node* next = nullptr;
        T* data = nullptr;

        void* operator new(size_t);
        void operator delete(void*);
        void* operator new[](size_t) = delete;
        void operator delete[](void*)  = delete;
    };

    uint64 lastNodeAddr = 0;

    Node* head;
    Node* last;

    void* getHeadNodeAddr() const { return (void*)head; }
    void remove(void* ptr);

public:
    Queue() = default;
    Queue(const Queue<T>&) = delete;
    Queue<T>& operator=(Queue<T>&) = delete;

    void* operator new(size_t);
    void operator delete(void*);
    void* operator new[](size_t) = delete;
    void operator delete[](void*)  = delete;

    T* peekFirst() const { return (head) ? head->data : nullptr; }
    T* peekLast() const { return (last) ? last->data : nullptr; }

    static void push(Queue<T>* self, T* data);
    static T* pop(Queue<T>* self);

    ~Queue();

    friend class _sem;
};



template<typename T>
void Queue<T>::remove(void *ptr) {
    T* swapData = Queue<T>::pop(this);
    if (!head) {
        Node* node = (Node*)ptr;
        node->data = swapData;
    }
}

template<typename T>
Queue<T>::~Queue() {
    if (!this->head) return;
    Node* cur = head;
    while(cur->next) {
        Node* old = cur;
        cur = cur->next;
        delete old;
    }
}

template<typename T>
T *Queue<T>::pop(Queue<T>* self) {
    if(!self->head) return nullptr;
    Node* toPop = self->head;
    T* data = toPop->data;

    self->head = self->head->next;
    if (toPop == self->last) {
        self->last = nullptr;
    }
    delete toPop;
    return data;
}

template<typename T>
void Queue<T>::push(Queue<T>*self ,T *data) {
    Node* node = new Node();
    node->data = data;

    if (!self->head) {
        self->head = self->last = node;
        return;
    }

    self->last->next = node;
    self->last = node;

}

template<typename T>
void Queue<T>::Node::operator delete(void* p) {
    MemoryAllocator::mem_free(p);
}

template<typename T>
void *Queue<T>::Node::operator new(size_t sz) {
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
