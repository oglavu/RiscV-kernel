//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/syscall_cpp.h"
#include "../h/Scheduler.h"
#include "../h/AVLTree.h"

class TCB {
public:
    uint64 i;
    uint64 s = 0;
    uint64 a = 0;
    explicit TCB(int k) : i(k) {}
};


int main() {
    __putc(((char)sizeof(AVLTree) + (char)0));

    RiscV::stvecW((uint64)&RiscV::setStvecTable | 0x01);



    TCB* th1 = new TCB(55);
    TCB* th2 = new TCB(2);

    Scheduler::put(th1);
    Scheduler::put(th2);

    __putc((char)(Scheduler::get()->i + '0')); __putc('\n');
    __putc((char)(Scheduler::get()->i + '0')); __putc('\n');


    delete th1;
    delete th2;

    return 0;
}
