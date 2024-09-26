.global _halt
_halt:
    haltLoop:
        j haltLoop

.global _ZN5RiscV8shutdownEv
.type _ZN5RiscV8shutdownEv, @function
.align 4
# RiscV::shutdown
_ZN5RiscV8shutdownEv:
    la t0, 0x100000
    la t1, 0x5555
    sw t1, 0(t0)