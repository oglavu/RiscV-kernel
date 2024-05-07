//
// Created by os on 5/1/24.
//

#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/syscall_cpp.h"
#include "../h/Scheduler.h"

class TCB {
public:
    uint64 i;
    uint64 s = 0;
    uint64 a = 0;
    explicit TCB(int k) : i(k) {}
};


int main() {

    RiscV::stvecW((uint64)&RiscV::setStvecTable | 0x01);

    Scheduler s;

    TCB* th1 = new TCB(55);
    TCB* th2 = new TCB(2);
    TCB* th3 = new TCB(3);
    TCB* th4 = new TCB(4);
    TCB* th5 = new TCB(5);

    s.put(th1);
    s.put(th2);
    s.put(th3);
    s.put(th4);
    s.put(th5);

    __putc((char)(s.get()->i + '0')); __putc('\n');
    __putc((char)(s.get()->i + '0')); __putc('\n');
    __putc((char)(s.get()->i + '0')); __putc('\n');
    __putc((char)(s.get()->i + '0')); __putc('\n');
    __putc((char)(s.get()->i + '0')); __putc('\n');


    delete th1;
    delete th2;
    delete th3;
    delete th4;
    delete th5;

    return 0;
}
