//
// Created by os on 5/1/24.
//

#include "../h/AVLTree.h"

AVLTree* AVLTree::findFreeSeg(AVLTree* root, size_t size) {
    AVLTree* cur = root, *BestFit = nullptr;
    while(cur) {
        if (cur->sz == size)
            return cur;
        if (cur->sz > size) {
            BestFit = cur; cur = cur->left;
        } else
            cur = cur->right;
    }
    return BestFit;
}

AVLTree* AVLTree::insert(AVLTree *root, AVLTree *node) {

    // Performing Insert in BST
    if (!root) {
        return node;
    }

    AVLTree* cur = root, *prev = nullptr;
    while(cur) {
        if (node->sz == cur->sz) {
            if (cur->sameSizeNext) cur->sameSizeNext->sameSizePrev = node;
            node->sameSizeNext = cur->sameSizeNext;
            cur->sameSizeNext = node;
            node->sameSizePrev = cur;
            return root;
        }
        prev = cur;
        if (node->sz > cur->sz)
            cur = cur->right;
        else
            cur = cur->left;
    }

    (node->sz > prev->sz ? prev->right : prev->left) = node;
    node->parent = prev;
    cur = prev;
    prev = nullptr;

    // Iterating through parents and balancing
    return AVLTree::balance(cur);
}

inline int AVLTree::getBalance(AVLTree *node) {
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
}

int AVLTree::max(const AVLTree *n1, const AVLTree *n2) {
    if (!n1 && !n2)
        return -1;
    if (!n1 && n2)
        return n2->height;
    if (n1 && !n2)
        return n1->height;
    return (n1->height > n2->height) ? n1->height : n2->height;
}

inline bool AVLTree::isRightSon(const AVLTree* node) {
    return (node->parent && node->parent->right == node);
}

AVLTree* AVLTree::findSuccessor(AVLTree* node){
    if (!node || !node->right) return nullptr;
    node = node->right;
    while(node->left)
        node = node->left;
    return node;
}

AVLTree* AVLTree::rightRotation(AVLTree *y) {
    AVLTree* x = y->left;
    AVLTree* t2 = x->right;

    x->right = y;
    y->left = t2;

    x->parent = y->parent;
    y->parent = x;
    if (t2) t2->parent = y;

    y->height = 1+max(y->left, y->right);
    x->height = 1+max(x->left, x->right);
    return x;

}

/*
         y                    x
       /  \    RightRot     /  \
      x   t3   ------->   t1    y
     / \       <-------        / \
    t1  t2      LeftRot       t2  t3
*/
AVLTree* AVLTree::leftRotation(AVLTree *x) {
    AVLTree* y = x->right;
    AVLTree* t2 = y->left;

    y->left = x;
    x->right = t2;

    y->parent = x->parent;
    x->parent = y;
    if (t2) t2->parent = x;

    x->height = 1+max(x->left, x->right);
    y->height = 1+max(y->left, y->right);


    return y;
}

AVLTree* AVLTree::remove(AVLTree* root, AVLTree* node) {
    if (!root) return nullptr;
    if (!node || !contains(root, node)) return root;

    if (node->sameSizeNext) {
        AVLTree* p = node->parent, *l = node->left,
                *r = node->right, *sn = node->sameSizeNext, *sp = node->sameSizePrev;
        // updating towards s
        if (sp) sp->sameSizeNext = sn;
        if (p) (isRightSon(node) ? p->right : p->left) = sn;
        if (r) r->parent = sn;
        if (l) l->parent = sn;
        // updating from s
        sn->sameSizePrev = sp;
        sn->right = r;
        sn->left = l;
        sn->parent = p;
        return (p) ? root : sn;
    }

    if (node->sameSizePrev) {
        node->sameSizePrev->sameSizeNext = nullptr;
        return root;
    }

    AVLTree* updateFrom;

    if (!node->left && !node->right) { // no children
        updateFrom = node->parent;
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = nullptr;
    } else if (!node->left || !node->right) { // one child
        updateFrom = node->parent;
        if (node == root) {updateFrom = (node->left) ? node->left : node->right; updateFrom->parent = nullptr;}
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    } else { //two children
        AVLTree* swap = findSuccessor(node);


        if (swap == node->right) {
            updateFrom = swap;
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
            node->right->parent = nullptr;
            node->left->parent = swap;

            swap->left = node->left;
            swap->parent = node->parent;
            // no change to swap->right
        } else {
            updateFrom = swap->parent; // updating starts from swapped node
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
            node->left->parent = swap;
            node->right->parent = swap;

            swap->parent->left = swap->right;
            if (swap->right) swap->right->parent = swap->parent;

            swap->left = node->left;
            swap->right = node->right;
            swap->parent = node->parent;
        }
    }

    // Perform balancing
    return AVLTree::balance(updateFrom);
}

bool AVLTree::contains(const AVLTree* root, const AVLTree* node) {
    const AVLTree* cur = root;
    while(cur) {
        if (cur == node)
            return true;

        if (cur->sz == node->sz)
            cur = cur->sameSizeNext;
        else if (cur->sz < node->sz)
            cur = cur->right;
        else
            cur = cur->left;
    }

    return false;
}

AVLTree* AVLTree::balance(AVLTree* cur) {
    AVLTree* prev = nullptr;
    while(cur) {
        cur->height = 1 + max(cur->left, cur->right);
        int curBalance = AVLTree::getBalance(cur);
        int prevBalance = AVLTree::getBalance(prev);

        AVLTree* oldCurParent = cur->parent;

        if (curBalance < -1 && prevBalance * curBalance < 0) {
            prev = AVLTree::leftRotation(prev);
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
            cur = AVLTree::rightRotation(cur);
        }else if (curBalance < -1) {
            cur = AVLTree::rightRotation(cur);
        }
        if (curBalance > 1 && prevBalance * curBalance < 0) {
            prev = AVLTree::rightRotation(prev);
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
            cur = AVLTree::leftRotation(cur);
        }else if (curBalance > 1) {
            cur = AVLTree::leftRotation(cur);
        }

        if (oldCurParent) ((oldCurParent->sz < cur->sz) ? oldCurParent->right : oldCurParent->left) = cur;

        prev = cur;
        cur = cur->parent;
    }
    return prev;
}

AVLTree *AVLTree::swapLL(AVLTree *toSwap, AVLTree *swap, AVLTree* root) {
    if (!toSwap || !swap || !root || toSwap == swap)
        return root;

    if (toSwap == root) {
        swap->next = root->next;
        swap->prev = nullptr;
        if (root->next) root->next->prev = swap;
        return swap;
    }

    AVLTree* prevNode = toSwap->prev;
    AVLTree* nextNode = toSwap->next;
    prevNode->next = swap;
    swap->prev = prevNode;
    if (nextNode) nextNode->prev = swap;
    swap->next = nextNode;

    return root;

}

AVLTree *AVLTree::removeLL(AVLTree *toRem, AVLTree *root) {
    if (!root) return toRem;
    if (!toRem) return root;
    if (root == toRem) {
        root = root->next;
        if (root) root->prev = nullptr;
        return root;
    }
    AVLTree* prevNode = toRem->prev;
    AVLTree* nextNode = toRem->next;
    prevNode->next = nextNode;
    if (nextNode)
        nextNode->prev = prevNode;

    return root;
}

AVLTree *AVLTree::insertLL(AVLTree *toInsert, AVLTree *root) {
    if (!toInsert) return root;
    if (!root || toInsert < root) {
        toInsert->next = root;
        toInsert->prev = nullptr;
        if (root) root->prev = toInsert;
        return toInsert;
    }

    AVLTree* cur = root;
    for (; cur->next && (cur->next < toInsert); cur = cur->next);

    toInsert->next = cur->next;
    if(cur->next) cur->next->prev = toInsert;
    cur->next = toInsert;
    toInsert->prev = cur;

    return root;
}

void AVLTree::resetAll(int flags) {
    if((int)flags & (int)RS_SZ) sz = 0;
    if((int)flags & (int)RS_LL) next = prev = nullptr;
    if((int)flags & (int)RS_BT) {left = right = parent = sameSizeNext = sameSizePrev = nullptr; height = 0;}
}

