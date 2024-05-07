//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_QUEUE_H
#define PROJEKAT_QUEUE_H

#include "syscall_c.h"


template<typename T>
class Queue {
private:
    struct Node {
        Node* next = nullptr;
        T* data = nullptr;

        void* operator new(size_t, Queue<T>*);
        void operator delete(void*);

        void* operator new(size_t) = delete;
        void* operator new[](size_t) = delete;
        void operator delete[](void*)  = delete;
    };

    uint64 lastNodeAddr = 0;

    Node* head;
    Node* last;

public:
    Queue() = default;
    Queue(const Queue<T>&) = delete;
    Queue<T>& operator=(Queue<T>&) = delete;

    T* peekFirst() { return (head) ? head->data : nullptr; }
    T* peekLast() { return (last) ? last->data : nullptr; }

    void push(T* data);
    T* pop();

    ~Queue();

};

template<typename T>
Queue<T>::~Queue() {
    if (!head) return;
    while(head->next)
        pop();
    void* p = (void*) (((uint64) head / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);
    mem_free(p);
}

template<typename T>
T *Queue<T>::pop() {
    if(!head) return nullptr;
    Node* node = head;
    T* data = node->data;

    head = head->next;
    if (node == last)
        last = nullptr;
    delete node;
    return data;
}

template<typename T>
void Queue<T>::push(T *data) {
    Node* node = new(this) Node();
    node->data = data;

    if (!head) {
        head = last = node;
        return;
    }

    last->next = node;
    last = node;

}

template<typename T>
void *Queue<T>::Node::operator new(size_t sz, Queue<T>* p) {
    if (sz > MEM_BLOCK_SIZE)
        return mem_alloc(sz);

    if (p->lastNodeAddr % MEM_BLOCK_SIZE == 0) {
        void* ptr = mem_alloc(MEM_BLOCK_SIZE);
        p->lastNodeAddr = (uint64) ptr + MEM_BLOCK_SIZE;
    }
    p->lastNodeAddr -= (uint64)sizeof(Node);
    return (void*)p->lastNodeAddr;
}

template<typename T>
void Queue<T>::Node::operator delete(void* p) {
    // page won't be freed if pointer doesn't point to its beginning
    mem_free(p);
}



#endif //PROJEKAT_QUEUE_H
