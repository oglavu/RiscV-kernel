
# x0 [zero] reg is no being saved
.macro POP_REGS
.irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index*8(sp)
.endr
addi sp, sp, 256
.endm

# x10 [a0] reg is not restored changed because in
# softwareInterrupt, return value is in it
.macro PUSH_REGS
addi sp, sp, -256
.irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index*8(sp)
.endr
.endm



.extern _ZN17interruptHandlers20handleSupervisorTrapEmmmmm

.align 4
.global _ZN5RiscV13setStvecTableEv
.type _ZN5RiscV13setStvecTableEv, @function
# RiscV::setStvecTable()
_ZN5RiscV13setStvecTableEv:
    PUSH_REGS
    call _ZN17interruptHandlers20handleSupervisorTrapEmmmmm
    POP_REGS
    sret


