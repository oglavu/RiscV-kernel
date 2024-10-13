//
// Created by os on 7/7/24.
//

#include "timedWait_CPP_API.hpp"

static Semaphore* waitForAll = nullptr;

void testThread::run() {
    printString("Thread started\n");
    int i=3;
    while(i > 0) {
        int res = sem_timedwait(sem, id);
        if (res == 0) {
            printString("Entry <- ");
            printInt(id);
            printString("\n");
            Thread::sleep(id);
            printString("Exit  -> ");
            sem_signal(sem);
            printInt(id);
            printString("\n");
            i--;
        } else if (res == -2) {
            printString("Timeout: ");
            printInt(id);
            printString("\n");
        } else { // if (res == -1)
            printString("Semaphore closed (i, id): (");
            printInt(i);
            printString(", ");
            printInt(id);
            printString(")\n");
            waitForAll->signal();
            thread_exit();
        }
        Thread::dispatch();
    }

    printString("Thread ");
    printInt(id);
    printString(" finished\n");

    waitForAll->signal();
}

void timedWait_test() {

    waitForAll = new Semaphore(0);
    sem_t sem;
    sem_open(&sem, 1);
    const static int N = 10;

    testThread* threads[N];

    for (int i=0; i<N; i++) {
        threads[i] = new testThread(sem, i+1);
        if (threads[i]->start() < 0) printString("Couldn't start thread\n");
    }

    for (int i=0; i<N; i++) {
        waitForAll->wait();
        if (i==0) sem_close(sem);
    }

}
