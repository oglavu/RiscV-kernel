
# x0 [zero] and x2[sp] regs are not being saved
# bcs sp will be changed after context change anyhow
.macro POP_REGS
.irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
ld x\index, \index*8(sp)
.endr
addi sp, sp, 256
.endm


.macro PUSH_REGS
addi sp, sp, -256
.irp index, 1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
sd x\index, \index*8(sp)
.endr
.endm



.align 4
.extern _ZN7_thread8dispatchEv

# void PCB::yield();
.global _ZN7_thread5yieldEv
.type _ZN7_thread5yieldEv, @function
_ZN7_thread5yieldEv:
    # save context (regs) of oldCont
    PUSH_REGS

    # block itself on dispatch until son thread finishes
    call _ZN7_thread8dispatchEv

    # restore context (regs) of newCont
    POP_REGS
    ret


# void PCB::contextSwitch(PCB::Context* oldR, PCB::Context* newR)
# a0 := oldR, a1 := newR
# *oldR = sp, *(oldR + 8) = ra
.global  _ZN7_thread13contextSwitchEPNS_7ContextES1_
.type  _ZN7_thread13contextSwitchEPNS_7ContextES1_, @function
_ZN7_thread13contextSwitchEPNS_7ContextES1_:
    sd sp,  (a0)
    sd ra, 8(a0)
    ld sp,  (a1)
    ld ra, 8(a1)
    ret







