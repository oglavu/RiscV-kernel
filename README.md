# RISC-V® Kernel

Single-core preemptive RISC-V Kernel is an assignment for [Operating systems 1](https://www.etf.bg.ac.rs/en/fis/karton_predmeta/13E112OS1-2019) course under [professor PhD Dragan Milićev](https://www.etf.bg.ac.rs/en/faculty/staff/dragan-milicev-522). 
Kernel's reliance to xv6 operating system is packed in `/lib/hw.lib`.

## Installastion
Qemu is used for emulation of 64 bit Risc-V architecture with Linux as host. Code is both cross-compiled and run with `make qemu`. 
Tests are added in `/test/userMain.cpp` and selected in runtime.

Files in paths `/lib/console.*` and `/lib/mem.*` are deprecated. 

## System Features
The kernel supports:
- Continuous memory allocation and deallocation
- Multitasking (stack per task)
- Threads and thread scheduling
- Semaphores
- Synchronous context switching
- Asynchronous context switching
- Console interface

Asynchronous context switching is done every two periods (1 period ~ 100 ms).

Interfaces available for user are (top-down): C++ API, C API and ABI. 

## Available System Calls
| No | C API System Call | Description |
|--------|------------|-------------|
| 0x01 | `void* mem_alloc(size_t size);` | Allocates _size_ bytes of memory, rounded and aligned to block of size MEM_BLOCK_SIZE. Returns a pointer to the memory block if successfull, or null if not. | 
| 0x02 | `int mem_free(void*);` | Frees memory previously allocated with mem_alloc. Argument must be a returned value of mem_alloc, otherwise action is undefined. | 
| 0x11 | `int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);` | Starts a thread of function _start_routine_, calling it with argument _arg_. In successful, _*handle_ will contain the handle for the thread and return value will be 0. |
| 0x12 | `int thread_exit(); ` | Forcefully leaves the thread. |
| 0x13 | `void thread_dispach();` | Possible synchronous context switch. |
| 0x21 | `int sem_open(sem_t* handle, unsigned init);` | Creates a semaphore with an initial value of _init_. In case of successful, _*handle_ will contain the handle for the semaphore and the return value will be 0. "Handle" is used to identify semaphores. |
| 0x22 | `int sem_close(sem_t handle);` | Frees the semaphore with the handle identifier. All threads that were blocked on this semaphore are deblocked, and their wait returns an error. |
| 0x23 | `int sem_wait(sem_t id);` | Operation wait for semaphore with given identifier. |
| 0x24 | `int sem_signal(sem_t id);` | Operation signal for semaphore with given identifier. |
| 0x25 | `int sem_timedwait(sem_t id, time_t time)` | Operation wait for semaphore with given identifier, but thread is blocked for maximum of _time_ periods. If wait is successfull return 0, if thread is timed out return -2 and if semaphore was closed in meantime return -1. |
| 0x31 | `time_sleep(time_t);` | Sleeps the active thread for timer periods. |
| 0x41 | `const int EOF = -1; char getc();` | Loads a character from the console. In case the buffer is empty, suspends active thread. Returns loaded char in case of success, or else EOF. |
| 0x42 | `void putc(char);` | Writes given char to the console. |
