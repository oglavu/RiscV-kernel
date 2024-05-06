
# x0 [zero] reg is no being saved
.macro POP_REGS
.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index*8(sp)
.endr
addi sp, sp, 248
.endm

.macro PUSH_REGS
addi sp, sp, -248
.irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index*8(sp)
.endr
.endm



.extern _ZN17interruptHandlers20handleSupervisorTrapEv
.extern _ZN17interruptHandlers20handleTimerInterruptEv
.extern _ZN17interruptHandlers22handleConsoleInterruptEv

.global _ZN5RiscV13setStvecTableEv
.align 4
.type _ZN5RiscV13setStvecTableEv, @function
_ZN5RiscV13setStvecTableEv:
    j softwareInterruptHandler #offs 0*4
    j timerInterruptHandler    #offs 1*4
    .skip 28
    j consoleHandler           #offs 9*4
    sret


softwareInterruptHandler:
    PUSH_REGS
    call _ZN17interruptHandlers20handleSupervisorTrapEv
    POP_REGS
    sret


timerInterruptHandler:
    PUSH_REGS
    call _ZN17interruptHandlers20handleTimerInterruptEv
    POP_REGS
    sret


consoleHandler:
    PUSH_REGS
    call _ZN17interruptHandlers22handleConsoleInterruptEv
    POP_REGS
    sret















