# void _thread::contextSwitch(_thread::Context* oldR, _thread::Context* newR)
# a0 := oldR, a1 := newR
# *oldR = sp, *(oldR + 8) = ra
.align 4
.global  _ZN7_thread13contextSwitchEPNS_7ContextES1_
.type  _ZN7_thread13contextSwitchEPNS_7ContextES1_, @function
_ZN7_thread13contextSwitchEPNS_7ContextES1_:
    sd sp,  (a0)
    sd ra, 8(a0)
    ld sp,  (a1)
    ld ra, 8(a1)
    ret







