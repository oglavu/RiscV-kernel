//
// Created by os on 7/7/24.
//

#include "timedWait_CPP_API.hpp"

static Semaphore* waitForAll = nullptr;
static Semaphore* oddSemaphore = nullptr;

void testThread::run() {
    int i=3;
    while(i > 0) {
        int res = (id % 2 == 1) ? oddSemaphore->wait() : sem->timedWait(id);
        if (res == 0) {
            printString("Entry <- ");
            printInt(id);
            printString("\n");
            Thread::sleep(id);
            if (id % 2 == 0) sem->signal();
            else oddSemaphore->signal();
            printString("Exit  -> ");
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
            break;
        }
        Thread::dispatch();
    }
    delete sem;

    printString("Thread ");
    printInt(id);
    printString(" finished\n");

    waitForAll->signal();
    if (id%2==0) oddSemaphore->signal();
}

void timedWait_test() {

    waitForAll = new Semaphore(0);
    oddSemaphore = new Semaphore(0);
    Semaphore sem(1);
    const static int N = 10;

    testThread* threads[N];

    for (int i=0; i<N; i++) {
        threads[i] = new testThread(&sem, i+1);
        if (threads[i]->start() < 0) printString("Couldn't start thread\n");
    }

    printString("All threads started\n");

    for (int i=0; i<N; i++) {
        waitForAll->wait();
    }

}
