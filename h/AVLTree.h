//
// Created by os on 5/1/24.
//

#ifndef PROJEKAT_AVLTREE_H
#define PROJEKAT_AVLTREE_H

#include "../lib/hw.h"
#include "../lib/console.h"

class AVLTree {
private:


    static int getBalance(AVLTree* node);
    static int max(const AVLTree* n1, const AVLTree* n2);
    static bool isRightSon(const AVLTree* node);
    static AVLTree* findSuccessor(AVLTree* node);
    static AVLTree* findPredecessor(AVLTree* node);
    static AVLTree* rightRotation(AVLTree* node);
    static AVLTree* leftRotation(AVLTree* node);
    static AVLTree* balance(AVLTree* cur);

public:
    AVLTree* left, *right, *parent, *sameSize;
    AVLTree* next, *prev;
    size_t sz; int height;
    bool isFree;

    enum RESET_FLAGS {NO_FLAG=0, SAVE_SZ=1};

    AVLTree(size_t sz) {
        resetAll();
        this->sz = sz;
    }

    void resetAll(RESET_FLAGS flags = NO_FLAG) {
        left = right = parent = next = prev = sameSize = nullptr; height = 0;
        if((int)flags & ~(int)SAVE_SZ) sz = 0;
    }
    static AVLTree* findFreeSeg(AVLTree*, size_t) ;
    static AVLTree* insert(AVLTree* root, AVLTree* node);
    static AVLTree* remove(AVLTree* root, AVLTree* node);
    static bool contains(const AVLTree* root, const AVLTree* node);
    static AVLTree* swapLL(AVLTree* toSwap, AVLTree* swap, AVLTree* root);
    static AVLTree* removeLL(AVLTree* toRem, AVLTree* root);
    static AVLTree* insertLL(AVLTree* toInsert, AVLTree* root);

    friend class MemoryAllocator;
};


#endif //PROJEKAT_AVLTREE_H
