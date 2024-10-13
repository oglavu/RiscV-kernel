//
// Created by os on 5/6/24.
//

#ifndef PROJEKAT_QUEUE_HPP
#define PROJEKAT_QUEUE_HPP

#include "MemoryAllocator.hpp"

class PCB;
template<typename T>
class Queue {
protected:
    struct QueueNode {

        T* data;
        QueueNode* next = nullptr;
        QueueNode* prev = nullptr;

        void* operator new(size_t sz);
        void operator delete(void* p);
        void* operator new[](size_t sz) = delete;
        void operator delete[](void* p) = delete;

    };

    QueueNode* head = nullptr; // points to first taken address
    QueueNode* tail = nullptr; // points to first free address

    QueueNode* removeEmptyHead();

public:
    typedef QueueNode* Key;

    T* peekFirst() { removeEmptyHead(); return head ? head->data : nullptr; }
    bool isEmpty() { removeEmptyHead(); return !head; }

    static void remove(Key, T*);
    virtual Key push(T* data);
    virtual T* pop();

    virtual ~Queue();

    void* operator new(size_t sz);
    void operator delete(void* p);
    void* operator new[](size_t sz) = delete;
    void operator delete[](void* p) = delete;
};



template <typename T>
class PriorityQueue: public Queue<T> {
public:
    using ComparatorFunc = bool (*) (const T*, const T*);
    typedef typename Queue<T>::QueueNode* Key;
private:
    // GRTE (T* t1, T* t2):
    // t1 >= t2 = true, else false
    ComparatorFunc GRTE;

public:
    explicit PriorityQueue(ComparatorFunc grt): GRTE(grt) {}
    PriorityQueue(const PriorityQueue<T>&) = delete;
    PriorityQueue<T>& operator=(PriorityQueue<T>&) = delete;

    static void remove(Key k, T* t) { Queue<T>::remove(k, t); }
    Key push(T* data) override;
    T* pop() override;


};


template <typename T>
typename Queue<T>::QueueNode* Queue<T>::removeEmptyHead() {
    if (!this->head || this->head->data) return nullptr;
    auto old = this->head;
    this->head = this->head->next;
    if (this->head) this->head->prev = nullptr;
    old->prev = nullptr; old->next = nullptr;
    return old;
}


template<typename T>
void Queue<T>::remove(Queue<T>::Key key, T* data) {
    if (!key) return;
    if (key->data != data) return;

    if (!key->prev || !key->next) {
        // key == head or key == tail
        // do NOT untangle node if its head or tail
        key->data = nullptr;
    } else {

        // adjust prev node
        if (key->prev) {
            key->prev->next = key->next;
        }

        // adjust next node
        if (key->next) {
            key->next->prev = key->prev;
        }
        delete key;
    }
}

template<typename T>
Queue<T>::~Queue() {
    if (!head) return;
    QueueNode* node = head;
    while (node) {
        QueueNode* del = node;
        node = node->next;
        delete del;
    }

    this->head = this->tail = nullptr;
}

template<typename T>
typename Queue<T>::Key Queue<T>::push(T *data) {
    if (head && !head->data) {
        head->data = data;
        return head;
    }
    auto node = new QueueNode;
    node->data = data;

    node->next = head;
    if (head) head->prev = node;
    if (!tail) tail = node;
    head = node;
    return node;
}

template<typename T>
T *Queue<T>::pop() {
    if (isEmpty()) return nullptr;

    T* data = tail->data;
    QueueNode* old = tail;
    tail = tail->prev;
    if (tail && !data) {
        data = tail->data;
        delete old;
        old = tail;
        tail = tail->prev;

    }
    if (tail) tail->next = nullptr;
    else head = nullptr;

    delete old;

    return data;
}


// ---------------------------------

template <typename T>
typename PriorityQueue<T>::Key PriorityQueue<T>::push(T* data) {

    // check for empty head or allocate node
    auto node = Queue<T>::removeEmptyHead();
    if (!node) node = new typename Queue<T>::QueueNode();

    node->data = data;

    // simple push
    if (this->isEmpty() || GRTE(this->head->data, node->data)) {
        delete node;
        return Queue<T>::push(data);
    }

    auto cur = this->head;
    while (cur && cur->data && GRTE(node->data, cur->data)) {
        node->prev = cur;
        cur = cur->next;
    }

    // emptyTail
    if (cur && !cur->data) {
        cur->data = node->data;
        delete node;
        return cur;
    }

    // there is always at least one T*
    // lesser than node
    auto before = node->prev;
    node->next = before->next;
    if (before->next) before->next->prev = node;
    before->next = node;

    return node;
}

template <typename T>
T* PriorityQueue<T>::pop() {
    if (this->isEmpty())
        return nullptr;

    T* data = this->head->data;

    auto old = this->head;
    this->head = old->next;
    delete old;

    if (this->head && !data) {
        old = this->head;
        data = old->data;
        this->head = this->head->next;
        delete old;
    }

    if (this->head) {
        this->head->prev = nullptr;
    }

    return data;
}


template<typename T>
void Queue<T>::QueueNode::operator delete(void* p) {
    MemoryAllocator::mem_free(p);
}

template<typename T>
void *Queue<T>::QueueNode::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
}

template<typename T>
void Queue<T>::operator delete(void* p) {
    MemoryAllocator::mem_free(p);
}

template<typename T>
void *Queue<T>::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc((sz + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
}


#endif //PROJEKAT_QUEUE_HPP
