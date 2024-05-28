//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_QUEUE_HPP
#define PROJEKAT_QUEUE_HPP

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

    void* getHeadNodeAddr() const { return (void*)head; }
    void remove(void* ptr);

public:
    Queue() = default;
    Queue(const Queue<T>&) = delete;
    Queue<T>& operator=(Queue<T>&) = delete;

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
    void* p = (void*) (((uint64) cur / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);
    mem_free(p);
}

template<typename T>
T *Queue<T>::pop(Queue<T>* self) {
    if(!self->head) return nullptr;
    Node* toPop = self->head;
    T* data = toPop->data;

    self->head = self->head->next;
    if (toPop == self->last) {
        self->last = nullptr;
        void* p = (void*) (((uint64) toPop / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);
        mem_free(p);
        self->lastNodeAddr = 0;
    } else
        delete toPop;
    return data;
}

template<typename T>
void Queue<T>::push(Queue<T>*self ,T *data) {
    Node* node = new(self) Node();
    node->data = data;

    if (!self->head) {
        self->head = self->last = node;
        return;
    }

    self->last->next = node;
    self->last = node;

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



#endif //PROJEKAT_QUEUE_HPP
