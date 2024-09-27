//
// Created by os on 7/7/24.
//

#ifndef PROJEKAT_TIMEDWAIT_CPP_API_HPP
#define PROJEKAT_TIMEDWAIT_CPP_API_HPP

#include "../h/syscall_cpp.hpp"
#include "printing.hpp"


class testThread: public Thread {
private:
    Semaphore* sem;
    const int id;
public:
    testThread(Semaphore* sem, const int id): sem(sem), id(id) { }
    void run() override;
};

void timedWait_test();


#endif //PROJEKAT_TIMEDWAIT_CPP_API_HPP
