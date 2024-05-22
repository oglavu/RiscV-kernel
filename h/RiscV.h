//
// Created by os on 5/4/24.
//

#ifndef PROJEKAT_RISCV_H
#define PROJEKAT_RISCV_H

#include "../lib/hw.h"

class RiscV {
public:
    static void popSppSpie();
    static void setStvecTable();

    enum CodeOps: uint64{
        MEM_ALOC = 0x01,
        MEM_FREE = 0x02,
        THR_CREA = 0x11,
        THR_EXIT = 0x12,
        THR_YIEL = 0x13,
        SEM_OPEN = 0x21,
        SEM_CLOS = 0x22,
        SEM_WAIT = 0x23,
        SEM_SIGN = 0x24,
        SEM_TMDW = 0x25,
        SEM_TRYW = 0x26,
        THR_SLEE = 0x31,
    };

    enum BitMaskSStatus: uint64 {
        SSTATUS_SIE = 1 << 1,
        SSTATUS_SPIE = 1 << 5,
        SSTATUS_SPP = 1 << 8
    };

    enum BitMaskSip: uint64 {
        SIP_SSIP = 1 << 1,
        SIP_SEIP = 1 << 9
    };

    static uint64 scauseR();
    static void scauseW(uint64 scause);

    static uint64 sepcR();
    static void sepcW(uint64);

    static uint64 stvecR();
    static void stvecW(uint64 stvec);

    static uint64 stvalR();
    static void stvalW(uint64 stval);

    static uint64 sstatusR();
    static void sstatusW(uint64 sstatus);

    static void ms_sstatus(BitMaskSStatus mask);
    static void mc_sstatus(BitMaskSStatus mask);


    static uint64 sipR();
    static void sipW(uint64);

    static void ms_sip(BitMaskSip mask);
    static void mc_sip(BitMaskSip mask);

    // param regs
    static uint64 a0R();
    static void a0W(uint64 val);
    static uint64 a1R();
    static void a1W(uint64 val);
    static uint64 a2R();
    static void a2W(uint64 val);
    static uint64 a3R();
    static void a3W(uint64 val);
    static uint64 a4R();
    static void a4W(uint64 val);
};

inline uint64 RiscV::scauseR() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    return scause;
}

inline void RiscV::scauseW(uint64 scause) {
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 RiscV::sepcR() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    return sepc;
}

inline void RiscV::sepcW(uint64 sepc) {
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
}

inline uint64 RiscV::stvecR() {
    uint64 volatile stvec;
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void RiscV::stvecW(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
}

inline uint64 RiscV::stvalR() {
    uint64 volatile stval;
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    return stval;
}

inline void RiscV::stvalW(uint64 stval) {
    __asm__ volatile ("csrw stval, %[stval]" : : [stval] "r"(stval));
}

inline uint64 RiscV::a0R() {
    uint64 volatile a0;
    __asm__ volatile ("mv %0, a0" : "=r"(a0));
    return a0;
}

inline void RiscV::a0W(uint64 val) {
    __asm__ volatile ("mv a0, %0" : : "r"(val));
}

inline uint64 RiscV::a1R() {
    uint64 volatile a1;
    __asm__ volatile ("mv %0, a1" : "=r"(a1));
    return a1;
}

inline void RiscV::a1W(uint64 val) {
    __asm__ volatile ("mv a1, %0" : : "r"(val));
}

inline uint64 RiscV::sstatusR() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    return sstatus;
}

inline void RiscV::sstatusW(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

inline void RiscV::ms_sstatus(RiscV::BitMaskSStatus mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"((uint64)mask));
}

inline void RiscV::mc_sstatus(RiscV::BitMaskSStatus mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"((uint64)mask));
}

inline uint64 RiscV::sipR() {
    uint64 volatile sip;
    __asm__ volatile ("csrr %[sip], sip" : [sip] "=r"(sip));
    return sip;
}

inline void RiscV::sipW(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void RiscV::ms_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"((uint64)mask));
}

inline void RiscV::mc_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"((uint64)mask));
}

inline uint64 RiscV::a2R() {
    uint64 volatile a2;
    __asm__ volatile ("mv %0, a2" : "=r"(a2));
    return a2;
}

inline void RiscV::a2W(uint64 val) {
    __asm__ volatile ("mv a2, %0" : : "r"(val));
}

inline uint64 RiscV::a3R() {
    uint64 volatile a3;
    __asm__ volatile ("mv %0, a3" : "=r"(a3));
    return a3;
}

inline void RiscV::a3W(uint64 val) {
    __asm__ volatile ("mv a3, %0" : : "r"(val));
}

inline uint64 RiscV::a4R() {
    uint64 volatile a4;
    __asm__ volatile ("mv %0, a4" : "=r"(a4));
    return a4;
}

inline void RiscV::a4W(uint64 val) {
    __asm__ volatile ("mv a4, %0" : : "r"(val));
}


#endif //PROJEKAT_RISCV_H
