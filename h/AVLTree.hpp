//
// Created by os on 5/1/24.
//

#ifndef PROJEKAT_AVLTREE_HPP
#define PROJEKAT_AVLTREE_HPP

#include "../lib/hw.h"
#include "../lib/console.h"

class AVLTree {
private:


    static int getBalance(AVLTree* node);
    static int max(const AVLTree* n1, const AVLTree* n2);
    static bool isRightSon(const AVLTree* node);
    static AVLTree* findSuccessor(AVLTree* node);
    static AVLTree* rightRotation(AVLTree* node);
    static AVLTree* leftRotation(AVLTree* node);
    static AVLTree* balance(AVLTree* cur);

public:
    AVLTree* left, *right, *parent, *sameSizeNext, *sameSizePrev;
    AVLTree* next, *prev;
    size_t sz; int height;
    bool isFree;

    enum RESET_FLAGS {NO_FLAG=0, RS_SZ=1, RS_LL=2, RS_BT=4};

    void resetAll(int flags = NO_FLAG);
    static AVLTree* findFreeSeg(AVLTree*, size_t) ;
    static AVLTree* insert(AVLTree* root, AVLTree* node);
    static AVLTree* remove(AVLTree* root, AVLTree* node);
    static bool contains(const AVLTree* root, const AVLTree* node);
    static AVLTree* swapLL(AVLTree* toSwap, AVLTree* swap, AVLTree* root);
    static AVLTree* removeLL(AVLTree* toRem, AVLTree* root);
    static AVLTree* insertLL(AVLTree* toInsert, AVLTree* root);

    friend class MemoryAllocator;
};


#endif //PROJEKAT_AVLTREE_HPP
