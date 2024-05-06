
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00005117          	auipc	sp,0x5
    80000004:	76813103          	ld	sp,1896(sp) # 80005768 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	224020ef          	jal	ra,80002240 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5RiscV13setStvecTableEv>:

.global _ZN5RiscV13setStvecTableEv
.align 4
.type _ZN5RiscV13setStvecTableEv, @function
_ZN5RiscV13setStvecTableEv:
    j softwareInterruptHandler #offs 0*4
    80001000:	02c0006f          	j	8000102c <softwareInterruptHandler>
    j timerInterruptHandler    #offs 1*4
    80001004:	1300006f          	j	80001134 <timerInterruptHandler>
	...
    .skip 28
    j consoleHandler           #offs 9*4
    80001024:	2180006f          	j	8000123c <consoleHandler>
    sret
    80001028:	10200073          	sret

000000008000102c <softwareInterruptHandler>:


softwareInterruptHandler:
    PUSH_REGS
    8000102c:	f0810113          	addi	sp,sp,-248
    80001030:	00113423          	sd	ra,8(sp)
    80001034:	00213823          	sd	sp,16(sp)
    80001038:	00313c23          	sd	gp,24(sp)
    8000103c:	02413023          	sd	tp,32(sp)
    80001040:	02513423          	sd	t0,40(sp)
    80001044:	02613823          	sd	t1,48(sp)
    80001048:	02713c23          	sd	t2,56(sp)
    8000104c:	04813023          	sd	s0,64(sp)
    80001050:	04913423          	sd	s1,72(sp)
    80001054:	04a13823          	sd	a0,80(sp)
    80001058:	04b13c23          	sd	a1,88(sp)
    8000105c:	06c13023          	sd	a2,96(sp)
    80001060:	06d13423          	sd	a3,104(sp)
    80001064:	06e13823          	sd	a4,112(sp)
    80001068:	06f13c23          	sd	a5,120(sp)
    8000106c:	09013023          	sd	a6,128(sp)
    80001070:	09113423          	sd	a7,136(sp)
    80001074:	09213823          	sd	s2,144(sp)
    80001078:	09313c23          	sd	s3,152(sp)
    8000107c:	0b413023          	sd	s4,160(sp)
    80001080:	0b513423          	sd	s5,168(sp)
    80001084:	0b613823          	sd	s6,176(sp)
    80001088:	0b713c23          	sd	s7,184(sp)
    8000108c:	0d813023          	sd	s8,192(sp)
    80001090:	0d913423          	sd	s9,200(sp)
    80001094:	0da13823          	sd	s10,208(sp)
    80001098:	0db13c23          	sd	s11,216(sp)
    8000109c:	0fc13023          	sd	t3,224(sp)
    800010a0:	0fd13423          	sd	t4,232(sp)
    800010a4:	0fe13823          	sd	t5,240(sp)
    800010a8:	0ff13c23          	sd	t6,248(sp)
    call _ZN17interruptHandlers20handleSupervisorTrapEv
    800010ac:	471000ef          	jal	ra,80001d1c <_ZN17interruptHandlers20handleSupervisorTrapEv>
    POP_REGS
    800010b0:	00813083          	ld	ra,8(sp)
    800010b4:	01013103          	ld	sp,16(sp)
    800010b8:	01813183          	ld	gp,24(sp)
    800010bc:	02013203          	ld	tp,32(sp)
    800010c0:	02813283          	ld	t0,40(sp)
    800010c4:	03013303          	ld	t1,48(sp)
    800010c8:	03813383          	ld	t2,56(sp)
    800010cc:	04013403          	ld	s0,64(sp)
    800010d0:	04813483          	ld	s1,72(sp)
    800010d4:	05013503          	ld	a0,80(sp)
    800010d8:	05813583          	ld	a1,88(sp)
    800010dc:	06013603          	ld	a2,96(sp)
    800010e0:	06813683          	ld	a3,104(sp)
    800010e4:	07013703          	ld	a4,112(sp)
    800010e8:	07813783          	ld	a5,120(sp)
    800010ec:	08013803          	ld	a6,128(sp)
    800010f0:	08813883          	ld	a7,136(sp)
    800010f4:	09013903          	ld	s2,144(sp)
    800010f8:	09813983          	ld	s3,152(sp)
    800010fc:	0a013a03          	ld	s4,160(sp)
    80001100:	0a813a83          	ld	s5,168(sp)
    80001104:	0b013b03          	ld	s6,176(sp)
    80001108:	0b813b83          	ld	s7,184(sp)
    8000110c:	0c013c03          	ld	s8,192(sp)
    80001110:	0c813c83          	ld	s9,200(sp)
    80001114:	0d013d03          	ld	s10,208(sp)
    80001118:	0d813d83          	ld	s11,216(sp)
    8000111c:	0e013e03          	ld	t3,224(sp)
    80001120:	0e813e83          	ld	t4,232(sp)
    80001124:	0f013f03          	ld	t5,240(sp)
    80001128:	0f813f83          	ld	t6,248(sp)
    8000112c:	0f810113          	addi	sp,sp,248
    sret
    80001130:	10200073          	sret

0000000080001134 <timerInterruptHandler>:


timerInterruptHandler:
    PUSH_REGS
    80001134:	f0810113          	addi	sp,sp,-248
    80001138:	00113423          	sd	ra,8(sp)
    8000113c:	00213823          	sd	sp,16(sp)
    80001140:	00313c23          	sd	gp,24(sp)
    80001144:	02413023          	sd	tp,32(sp)
    80001148:	02513423          	sd	t0,40(sp)
    8000114c:	02613823          	sd	t1,48(sp)
    80001150:	02713c23          	sd	t2,56(sp)
    80001154:	04813023          	sd	s0,64(sp)
    80001158:	04913423          	sd	s1,72(sp)
    8000115c:	04a13823          	sd	a0,80(sp)
    80001160:	04b13c23          	sd	a1,88(sp)
    80001164:	06c13023          	sd	a2,96(sp)
    80001168:	06d13423          	sd	a3,104(sp)
    8000116c:	06e13823          	sd	a4,112(sp)
    80001170:	06f13c23          	sd	a5,120(sp)
    80001174:	09013023          	sd	a6,128(sp)
    80001178:	09113423          	sd	a7,136(sp)
    8000117c:	09213823          	sd	s2,144(sp)
    80001180:	09313c23          	sd	s3,152(sp)
    80001184:	0b413023          	sd	s4,160(sp)
    80001188:	0b513423          	sd	s5,168(sp)
    8000118c:	0b613823          	sd	s6,176(sp)
    80001190:	0b713c23          	sd	s7,184(sp)
    80001194:	0d813023          	sd	s8,192(sp)
    80001198:	0d913423          	sd	s9,200(sp)
    8000119c:	0da13823          	sd	s10,208(sp)
    800011a0:	0db13c23          	sd	s11,216(sp)
    800011a4:	0fc13023          	sd	t3,224(sp)
    800011a8:	0fd13423          	sd	t4,232(sp)
    800011ac:	0fe13823          	sd	t5,240(sp)
    800011b0:	0ff13c23          	sd	t6,248(sp)
    call _ZN17interruptHandlers20handleTimerInterruptEv
    800011b4:	445000ef          	jal	ra,80001df8 <_ZN17interruptHandlers20handleTimerInterruptEv>
    POP_REGS
    800011b8:	00813083          	ld	ra,8(sp)
    800011bc:	01013103          	ld	sp,16(sp)
    800011c0:	01813183          	ld	gp,24(sp)
    800011c4:	02013203          	ld	tp,32(sp)
    800011c8:	02813283          	ld	t0,40(sp)
    800011cc:	03013303          	ld	t1,48(sp)
    800011d0:	03813383          	ld	t2,56(sp)
    800011d4:	04013403          	ld	s0,64(sp)
    800011d8:	04813483          	ld	s1,72(sp)
    800011dc:	05013503          	ld	a0,80(sp)
    800011e0:	05813583          	ld	a1,88(sp)
    800011e4:	06013603          	ld	a2,96(sp)
    800011e8:	06813683          	ld	a3,104(sp)
    800011ec:	07013703          	ld	a4,112(sp)
    800011f0:	07813783          	ld	a5,120(sp)
    800011f4:	08013803          	ld	a6,128(sp)
    800011f8:	08813883          	ld	a7,136(sp)
    800011fc:	09013903          	ld	s2,144(sp)
    80001200:	09813983          	ld	s3,152(sp)
    80001204:	0a013a03          	ld	s4,160(sp)
    80001208:	0a813a83          	ld	s5,168(sp)
    8000120c:	0b013b03          	ld	s6,176(sp)
    80001210:	0b813b83          	ld	s7,184(sp)
    80001214:	0c013c03          	ld	s8,192(sp)
    80001218:	0c813c83          	ld	s9,200(sp)
    8000121c:	0d013d03          	ld	s10,208(sp)
    80001220:	0d813d83          	ld	s11,216(sp)
    80001224:	0e013e03          	ld	t3,224(sp)
    80001228:	0e813e83          	ld	t4,232(sp)
    8000122c:	0f013f03          	ld	t5,240(sp)
    80001230:	0f813f83          	ld	t6,248(sp)
    80001234:	0f810113          	addi	sp,sp,248
    sret
    80001238:	10200073          	sret

000000008000123c <consoleHandler>:


consoleHandler:
    PUSH_REGS
    8000123c:	f0810113          	addi	sp,sp,-248
    80001240:	00113423          	sd	ra,8(sp)
    80001244:	00213823          	sd	sp,16(sp)
    80001248:	00313c23          	sd	gp,24(sp)
    8000124c:	02413023          	sd	tp,32(sp)
    80001250:	02513423          	sd	t0,40(sp)
    80001254:	02613823          	sd	t1,48(sp)
    80001258:	02713c23          	sd	t2,56(sp)
    8000125c:	04813023          	sd	s0,64(sp)
    80001260:	04913423          	sd	s1,72(sp)
    80001264:	04a13823          	sd	a0,80(sp)
    80001268:	04b13c23          	sd	a1,88(sp)
    8000126c:	06c13023          	sd	a2,96(sp)
    80001270:	06d13423          	sd	a3,104(sp)
    80001274:	06e13823          	sd	a4,112(sp)
    80001278:	06f13c23          	sd	a5,120(sp)
    8000127c:	09013023          	sd	a6,128(sp)
    80001280:	09113423          	sd	a7,136(sp)
    80001284:	09213823          	sd	s2,144(sp)
    80001288:	09313c23          	sd	s3,152(sp)
    8000128c:	0b413023          	sd	s4,160(sp)
    80001290:	0b513423          	sd	s5,168(sp)
    80001294:	0b613823          	sd	s6,176(sp)
    80001298:	0b713c23          	sd	s7,184(sp)
    8000129c:	0d813023          	sd	s8,192(sp)
    800012a0:	0d913423          	sd	s9,200(sp)
    800012a4:	0da13823          	sd	s10,208(sp)
    800012a8:	0db13c23          	sd	s11,216(sp)
    800012ac:	0fc13023          	sd	t3,224(sp)
    800012b0:	0fd13423          	sd	t4,232(sp)
    800012b4:	0fe13823          	sd	t5,240(sp)
    800012b8:	0ff13c23          	sd	t6,248(sp)
    call _ZN17interruptHandlers22handleConsoleInterruptEv
    800012bc:	315000ef          	jal	ra,80001dd0 <_ZN17interruptHandlers22handleConsoleInterruptEv>
    POP_REGS
    800012c0:	00813083          	ld	ra,8(sp)
    800012c4:	01013103          	ld	sp,16(sp)
    800012c8:	01813183          	ld	gp,24(sp)
    800012cc:	02013203          	ld	tp,32(sp)
    800012d0:	02813283          	ld	t0,40(sp)
    800012d4:	03013303          	ld	t1,48(sp)
    800012d8:	03813383          	ld	t2,56(sp)
    800012dc:	04013403          	ld	s0,64(sp)
    800012e0:	04813483          	ld	s1,72(sp)
    800012e4:	05013503          	ld	a0,80(sp)
    800012e8:	05813583          	ld	a1,88(sp)
    800012ec:	06013603          	ld	a2,96(sp)
    800012f0:	06813683          	ld	a3,104(sp)
    800012f4:	07013703          	ld	a4,112(sp)
    800012f8:	07813783          	ld	a5,120(sp)
    800012fc:	08013803          	ld	a6,128(sp)
    80001300:	08813883          	ld	a7,136(sp)
    80001304:	09013903          	ld	s2,144(sp)
    80001308:	09813983          	ld	s3,152(sp)
    8000130c:	0a013a03          	ld	s4,160(sp)
    80001310:	0a813a83          	ld	s5,168(sp)
    80001314:	0b013b03          	ld	s6,176(sp)
    80001318:	0b813b83          	ld	s7,184(sp)
    8000131c:	0c013c03          	ld	s8,192(sp)
    80001320:	0c813c83          	ld	s9,200(sp)
    80001324:	0d013d03          	ld	s10,208(sp)
    80001328:	0d813d83          	ld	s11,216(sp)
    8000132c:	0e013e03          	ld	t3,224(sp)
    80001330:	0e813e83          	ld	t4,232(sp)
    80001334:	0f013f03          	ld	t5,240(sp)
    80001338:	0f813f83          	ld	t6,248(sp)
    8000133c:	0f810113          	addi	sp,sp,248
    sret
    80001340:	10200073          	sret
    80001344:	0000                	unimp
	...

0000000080001348 <_Z9mem_allocm>:
//

#include "../h/syscall_c.h"


void* mem_alloc(size_t size) {
    80001348:	ff010113          	addi	sp,sp,-16
    8000134c:	00813423          	sd	s0,8(sp)
    80001350:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv %0, a1" : "=r"(a1));
    return a1;
}

inline void RiscV::a1W(uint64 val) {
    __asm__ volatile ("mv a1, %0" : : "r"(val));
    80001354:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(val));
    80001358:	00100793          	li	a5,1
    8000135c:	00078513          	mv	a0,a5
    RiscV::a1W(size);
    RiscV::a0W(RiscV::CodeOps::MEM_ALOC);

    __asm__ volatile ("ecall");
    80001360:	00000073          	ecall

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    80001364:	00050513          	mv	a0,a0
    return (void*) retVal;
}
    80001368:	00813403          	ld	s0,8(sp)
    8000136c:	01010113          	addi	sp,sp,16
    80001370:	00008067          	ret

0000000080001374 <_Z8mem_freePv>:


int mem_free(void* ptr){
    80001374:	ff010113          	addi	sp,sp,-16
    80001378:	00813423          	sd	s0,8(sp)
    8000137c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(val));
    80001380:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(val));
    80001384:	00200793          	li	a5,2
    80001388:	00078513          	mv	a0,a5
    RiscV::a1W((uint64)ptr);
    RiscV::a0W(RiscV::CodeOps::MEM_FREE);

    __asm__ volatile ("ecall");
    8000138c:	00000073          	ecall

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    80001390:	00050513          	mv	a0,a0
    return (int) retVal;
    80001394:	0005051b          	sext.w	a0,a0
    80001398:	00813403          	ld	s0,8(sp)
    8000139c:	01010113          	addi	sp,sp,16
    800013a0:	00008067          	ret

00000000800013a4 <_ZN7AVLTree11findFreeSegEPS_m>:
// Created by os on 5/1/24.
//

#include "../h/AVLTree.h"

AVLTree* AVLTree::findFreeSeg(AVLTree* root, size_t size) {
    800013a4:	ff010113          	addi	sp,sp,-16
    800013a8:	00813423          	sd	s0,8(sp)
    800013ac:	01010413          	addi	s0,sp,16
    800013b0:	00050793          	mv	a5,a0
    AVLTree* cur = root, *BestFit = nullptr;
    800013b4:	00000513          	li	a0,0
    800013b8:	0080006f          	j	800013c0 <_ZN7AVLTree11findFreeSegEPS_m+0x1c>
        if (cur->sz == size)
            return cur;
        if (cur->sz > size) {
            BestFit = cur; cur = cur->left;
        } else
            cur = cur->right;
    800013bc:	0087b783          	ld	a5,8(a5)
    while(cur) {
    800013c0:	02078063          	beqz	a5,800013e0 <_ZN7AVLTree11findFreeSegEPS_m+0x3c>
        if (cur->sz == size)
    800013c4:	0307b703          	ld	a4,48(a5)
    800013c8:	00b70a63          	beq	a4,a1,800013dc <_ZN7AVLTree11findFreeSegEPS_m+0x38>
        if (cur->sz > size) {
    800013cc:	fee5f8e3          	bgeu	a1,a4,800013bc <_ZN7AVLTree11findFreeSegEPS_m+0x18>
            BestFit = cur; cur = cur->left;
    800013d0:	00078513          	mv	a0,a5
    800013d4:	0007b783          	ld	a5,0(a5)
    800013d8:	fe9ff06f          	j	800013c0 <_ZN7AVLTree11findFreeSegEPS_m+0x1c>
            return cur;
    800013dc:	00078513          	mv	a0,a5
    }
    return BestFit;
}
    800013e0:	00813403          	ld	s0,8(sp)
    800013e4:	01010113          	addi	sp,sp,16
    800013e8:	00008067          	ret

00000000800013ec <_ZN7AVLTree3maxEPKS_S1_>:

inline int AVLTree::getBalance(AVLTree *node) {
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
}

int AVLTree::max(const AVLTree *n1, const AVLTree *n2) {
    800013ec:	ff010113          	addi	sp,sp,-16
    800013f0:	00813423          	sd	s0,8(sp)
    800013f4:	01010413          	addi	s0,sp,16
    if (!n1 && !n2)
    800013f8:	02050663          	beqz	a0,80001424 <_ZN7AVLTree3maxEPKS_S1_+0x38>
        return -1;
    if (!n1 && n2)
    800013fc:	02050a63          	beqz	a0,80001430 <_ZN7AVLTree3maxEPKS_S1_+0x44>
        return n2->height;
    if (n1 && !n2)
    80001400:	00050463          	beqz	a0,80001408 <_ZN7AVLTree3maxEPKS_S1_+0x1c>
    80001404:	02058c63          	beqz	a1,8000143c <_ZN7AVLTree3maxEPKS_S1_+0x50>
        return n1->height;
    return (n1->height > n2->height) ? n1->height : n2->height;
    80001408:	03852783          	lw	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    8000140c:	0385a503          	lw	a0,56(a1)
    80001410:	00f55463          	bge	a0,a5,80001418 <_ZN7AVLTree3maxEPKS_S1_+0x2c>
    80001414:	00078513          	mv	a0,a5
}
    80001418:	00813403          	ld	s0,8(sp)
    8000141c:	01010113          	addi	sp,sp,16
    80001420:	00008067          	ret
    if (!n1 && !n2)
    80001424:	fc059ce3          	bnez	a1,800013fc <_ZN7AVLTree3maxEPKS_S1_+0x10>
        return -1;
    80001428:	fff00513          	li	a0,-1
    8000142c:	fedff06f          	j	80001418 <_ZN7AVLTree3maxEPKS_S1_+0x2c>
    if (!n1 && n2)
    80001430:	fc0588e3          	beqz	a1,80001400 <_ZN7AVLTree3maxEPKS_S1_+0x14>
        return n2->height;
    80001434:	0385a503          	lw	a0,56(a1)
    80001438:	fe1ff06f          	j	80001418 <_ZN7AVLTree3maxEPKS_S1_+0x2c>
        return n1->height;
    8000143c:	03852503          	lw	a0,56(a0)
    80001440:	fd9ff06f          	j	80001418 <_ZN7AVLTree3maxEPKS_S1_+0x2c>

0000000080001444 <_ZN7AVLTree13findSuccessorEPS_>:

inline bool AVLTree::isRightSon(const AVLTree* node) {
    return (node->parent && node->parent->right == node);
}

AVLTree* AVLTree::findSuccessor(AVLTree* node){
    80001444:	ff010113          	addi	sp,sp,-16
    80001448:	00813423          	sd	s0,8(sp)
    8000144c:	01010413          	addi	s0,sp,16
    if (!node || !node->right) return nullptr;
    80001450:	00050c63          	beqz	a0,80001468 <_ZN7AVLTree13findSuccessorEPS_+0x24>
    80001454:	00853783          	ld	a5,8(a0)
    80001458:	00078e63          	beqz	a5,80001474 <_ZN7AVLTree13findSuccessorEPS_+0x30>
    node = node->right;
    while(node->left)
    8000145c:	00078513          	mv	a0,a5
    80001460:	0007b783          	ld	a5,0(a5)
    80001464:	fe079ce3          	bnez	a5,8000145c <_ZN7AVLTree13findSuccessorEPS_+0x18>
        node = node->left;
    return node;
}
    80001468:	00813403          	ld	s0,8(sp)
    8000146c:	01010113          	addi	sp,sp,16
    80001470:	00008067          	ret
    if (!node || !node->right) return nullptr;
    80001474:	00078513          	mv	a0,a5
    80001478:	ff1ff06f          	j	80001468 <_ZN7AVLTree13findSuccessorEPS_+0x24>

000000008000147c <_ZN7AVLTree13rightRotationEPS_>:

AVLTree* AVLTree::rightRotation(AVLTree *y) {
    8000147c:	fe010113          	addi	sp,sp,-32
    80001480:	00113c23          	sd	ra,24(sp)
    80001484:	00813823          	sd	s0,16(sp)
    80001488:	00913423          	sd	s1,8(sp)
    8000148c:	01213023          	sd	s2,0(sp)
    80001490:	02010413          	addi	s0,sp,32
    80001494:	00050493          	mv	s1,a0
    AVLTree* x = y->left;
    80001498:	00053903          	ld	s2,0(a0)
    AVLTree* t2 = x->right;
    8000149c:	00893783          	ld	a5,8(s2)

    x->right = y;
    800014a0:	00a93423          	sd	a0,8(s2)
    y->left = t2;
    800014a4:	00f53023          	sd	a5,0(a0)

    x->parent = y->parent;
    800014a8:	01053703          	ld	a4,16(a0)
    800014ac:	00e93823          	sd	a4,16(s2)
    y->parent = x;
    800014b0:	01253823          	sd	s2,16(a0)
    if (t2) t2->parent = y;
    800014b4:	00078463          	beqz	a5,800014bc <_ZN7AVLTree13rightRotationEPS_+0x40>
    800014b8:	00a7b823          	sd	a0,16(a5)

    y->height = 1+max(y->left, y->right);
    800014bc:	0084b583          	ld	a1,8(s1)
    800014c0:	0004b503          	ld	a0,0(s1)
    800014c4:	00000097          	auipc	ra,0x0
    800014c8:	f28080e7          	jalr	-216(ra) # 800013ec <_ZN7AVLTree3maxEPKS_S1_>
    800014cc:	0015051b          	addiw	a0,a0,1
    800014d0:	02a4ac23          	sw	a0,56(s1)
    x->height = 1+max(x->left, x->right);
    800014d4:	00893583          	ld	a1,8(s2)
    800014d8:	00093503          	ld	a0,0(s2)
    800014dc:	00000097          	auipc	ra,0x0
    800014e0:	f10080e7          	jalr	-240(ra) # 800013ec <_ZN7AVLTree3maxEPKS_S1_>
    800014e4:	0015051b          	addiw	a0,a0,1
    800014e8:	02a92c23          	sw	a0,56(s2)
    return x;

}
    800014ec:	00090513          	mv	a0,s2
    800014f0:	01813083          	ld	ra,24(sp)
    800014f4:	01013403          	ld	s0,16(sp)
    800014f8:	00813483          	ld	s1,8(sp)
    800014fc:	00013903          	ld	s2,0(sp)
    80001500:	02010113          	addi	sp,sp,32
    80001504:	00008067          	ret

0000000080001508 <_ZN7AVLTree12leftRotationEPS_>:
       /  \    RightRot     /  \
      x   t3   ------->   t1    y
     / \       <-------        / \
    t1  t2      LeftRot       t2  t3
*/
AVLTree* AVLTree::leftRotation(AVLTree *x) {
    80001508:	fe010113          	addi	sp,sp,-32
    8000150c:	00113c23          	sd	ra,24(sp)
    80001510:	00813823          	sd	s0,16(sp)
    80001514:	00913423          	sd	s1,8(sp)
    80001518:	01213023          	sd	s2,0(sp)
    8000151c:	02010413          	addi	s0,sp,32
    80001520:	00050493          	mv	s1,a0
    AVLTree* y = x->right;
    80001524:	00853903          	ld	s2,8(a0)
    AVLTree* t2 = y->left;
    80001528:	00093783          	ld	a5,0(s2)

    y->left = x;
    8000152c:	00a93023          	sd	a0,0(s2)
    x->right = t2;
    80001530:	00f53423          	sd	a5,8(a0)

    y->parent = x->parent;
    80001534:	01053703          	ld	a4,16(a0)
    80001538:	00e93823          	sd	a4,16(s2)
    x->parent = y;
    8000153c:	01253823          	sd	s2,16(a0)
    if (t2) t2->parent = x;
    80001540:	00078463          	beqz	a5,80001548 <_ZN7AVLTree12leftRotationEPS_+0x40>
    80001544:	00a7b823          	sd	a0,16(a5)

    x->height = 1+max(x->left, x->right);
    80001548:	0084b583          	ld	a1,8(s1)
    8000154c:	0004b503          	ld	a0,0(s1)
    80001550:	00000097          	auipc	ra,0x0
    80001554:	e9c080e7          	jalr	-356(ra) # 800013ec <_ZN7AVLTree3maxEPKS_S1_>
    80001558:	0015051b          	addiw	a0,a0,1
    8000155c:	02a4ac23          	sw	a0,56(s1)
    y->height = 1+max(y->left, y->right);
    80001560:	00893583          	ld	a1,8(s2)
    80001564:	00093503          	ld	a0,0(s2)
    80001568:	00000097          	auipc	ra,0x0
    8000156c:	e84080e7          	jalr	-380(ra) # 800013ec <_ZN7AVLTree3maxEPKS_S1_>
    80001570:	0015051b          	addiw	a0,a0,1
    80001574:	02a92c23          	sw	a0,56(s2)


    return y;
}
    80001578:	00090513          	mv	a0,s2
    8000157c:	01813083          	ld	ra,24(sp)
    80001580:	01013403          	ld	s0,16(sp)
    80001584:	00813483          	ld	s1,8(sp)
    80001588:	00013903          	ld	s2,0(sp)
    8000158c:	02010113          	addi	sp,sp,32
    80001590:	00008067          	ret

0000000080001594 <_ZN7AVLTree8containsEPKS_S1_>:

    // Perform balancing
    return AVLTree::balance(updateFrom);
}

bool AVLTree::contains(const AVLTree* root, const AVLTree* node) {
    80001594:	ff010113          	addi	sp,sp,-16
    80001598:	00813423          	sd	s0,8(sp)
    8000159c:	01010413          	addi	s0,sp,16
    800015a0:	0080006f          	j	800015a8 <_ZN7AVLTree8containsEPKS_S1_+0x14>
        if (cur == node)
            return true;
        if (cur->sz < node->sz)
            cur = cur->right;
        else
            cur = cur->left;
    800015a4:	00053503          	ld	a0,0(a0)
    while(cur) {
    800015a8:	00050e63          	beqz	a0,800015c4 <_ZN7AVLTree8containsEPKS_S1_+0x30>
        if (cur == node)
    800015ac:	02b50463          	beq	a0,a1,800015d4 <_ZN7AVLTree8containsEPKS_S1_+0x40>
        if (cur->sz < node->sz)
    800015b0:	03053703          	ld	a4,48(a0)
    800015b4:	0305b783          	ld	a5,48(a1)
    800015b8:	fef776e3          	bgeu	a4,a5,800015a4 <_ZN7AVLTree8containsEPKS_S1_+0x10>
            cur = cur->right;
    800015bc:	00853503          	ld	a0,8(a0)
    800015c0:	fe9ff06f          	j	800015a8 <_ZN7AVLTree8containsEPKS_S1_+0x14>
    }

    return false;
    800015c4:	00000513          	li	a0,0
}
    800015c8:	00813403          	ld	s0,8(sp)
    800015cc:	01010113          	addi	sp,sp,16
    800015d0:	00008067          	ret
            return true;
    800015d4:	00100513          	li	a0,1
    800015d8:	ff1ff06f          	j	800015c8 <_ZN7AVLTree8containsEPKS_S1_+0x34>

00000000800015dc <_ZN7AVLTree7balanceEPS_>:

AVLTree* AVLTree::balance(AVLTree* cur) {
    800015dc:	fc010113          	addi	sp,sp,-64
    800015e0:	02113c23          	sd	ra,56(sp)
    800015e4:	02813823          	sd	s0,48(sp)
    800015e8:	02913423          	sd	s1,40(sp)
    800015ec:	03213023          	sd	s2,32(sp)
    800015f0:	01313c23          	sd	s3,24(sp)
    800015f4:	01413823          	sd	s4,16(sp)
    800015f8:	01513423          	sd	s5,8(sp)
    800015fc:	01613023          	sd	s6,0(sp)
    80001600:	04010413          	addi	s0,sp,64
    80001604:	00050493          	mv	s1,a0
    AVLTree* prev = nullptr;
    80001608:	00000913          	li	s2,0
    8000160c:	0e00006f          	j	800016ec <_ZN7AVLTree7balanceEPS_+0x110>
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
    80001610:	00000993          	li	s3,0
    80001614:	1080006f          	j	8000171c <_ZN7AVLTree7balanceEPS_+0x140>
    80001618:	00000793          	li	a5,0
    8000161c:	10c0006f          	j	80001728 <_ZN7AVLTree7balanceEPS_+0x14c>
    80001620:	00000a13          	li	s4,0
    80001624:	1200006f          	j	80001744 <_ZN7AVLTree7balanceEPS_+0x168>
    80001628:	00000a13          	li	s4,0
    8000162c:	1180006f          	j	80001744 <_ZN7AVLTree7balanceEPS_+0x168>
    80001630:	00000793          	li	a5,0
    80001634:	1240006f          	j	80001758 <_ZN7AVLTree7balanceEPS_+0x17c>
    80001638:	00000793          	li	a5,0
    8000163c:	11c0006f          	j	80001758 <_ZN7AVLTree7balanceEPS_+0x17c>
        int curBalance = AVLTree::getBalance(cur);
        int prevBalance = AVLTree::getBalance(prev);

        AVLTree* oldCurParent = cur->parent;

        if (curBalance < -1 && prevBalance * curBalance < 0) {
    80001640:	033a07bb          	mulw	a5,s4,s3
    80001644:	1207d263          	bgez	a5,80001768 <_ZN7AVLTree7balanceEPS_+0x18c>
            prev = AVLTree::leftRotation(prev);
    80001648:	00090513          	mv	a0,s2
    8000164c:	00000097          	auipc	ra,0x0
    80001650:	ebc080e7          	jalr	-324(ra) # 80001508 <_ZN7AVLTree12leftRotationEPS_>
    80001654:	00050913          	mv	s2,a0
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    80001658:	0304b703          	ld	a4,48(s1)
    8000165c:	03053783          	ld	a5,48(a0)
    80001660:	00f77e63          	bgeu	a4,a5,8000167c <_ZN7AVLTree7balanceEPS_+0xa0>
    80001664:	00a4b423          	sd	a0,8(s1)
            cur = AVLTree::rightRotation(cur);
    80001668:	00048513          	mv	a0,s1
    8000166c:	00000097          	auipc	ra,0x0
    80001670:	e10080e7          	jalr	-496(ra) # 8000147c <_ZN7AVLTree13rightRotationEPS_>
    80001674:	00050493          	mv	s1,a0
    80001678:	0f80006f          	j	80001770 <_ZN7AVLTree7balanceEPS_+0x194>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    8000167c:	00a4b023          	sd	a0,0(s1)
    80001680:	fe9ff06f          	j	80001668 <_ZN7AVLTree7balanceEPS_+0x8c>
        }else if (curBalance < -1) {
            cur = AVLTree::rightRotation(cur);
    80001684:	00048513          	mv	a0,s1
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	df4080e7          	jalr	-524(ra) # 8000147c <_ZN7AVLTree13rightRotationEPS_>
    80001690:	00050493          	mv	s1,a0
    80001694:	0dc0006f          	j	80001770 <_ZN7AVLTree7balanceEPS_+0x194>
        }
        if (curBalance > 1 && prevBalance * curBalance < 0) {
            prev = AVLTree::rightRotation(prev);
    80001698:	00090513          	mv	a0,s2
    8000169c:	00000097          	auipc	ra,0x0
    800016a0:	de0080e7          	jalr	-544(ra) # 8000147c <_ZN7AVLTree13rightRotationEPS_>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016a4:	0304b703          	ld	a4,48(s1)
    800016a8:	03053783          	ld	a5,48(a0)
    800016ac:	00f77e63          	bgeu	a4,a5,800016c8 <_ZN7AVLTree7balanceEPS_+0xec>
    800016b0:	00a4b423          	sd	a0,8(s1)
            cur = AVLTree::leftRotation(cur);
    800016b4:	00048513          	mv	a0,s1
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	e50080e7          	jalr	-432(ra) # 80001508 <_ZN7AVLTree12leftRotationEPS_>
    800016c0:	00050913          	mv	s2,a0
    800016c4:	0c80006f          	j	8000178c <_ZN7AVLTree7balanceEPS_+0x1b0>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016c8:	00a4b023          	sd	a0,0(s1)
    800016cc:	fe9ff06f          	j	800016b4 <_ZN7AVLTree7balanceEPS_+0xd8>
        }else if (curBalance > 1) {
            cur = AVLTree::leftRotation(cur);
    800016d0:	00048513          	mv	a0,s1
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	e34080e7          	jalr	-460(ra) # 80001508 <_ZN7AVLTree12leftRotationEPS_>
    800016dc:	00050913          	mv	s2,a0
    800016e0:	0ac0006f          	j	8000178c <_ZN7AVLTree7balanceEPS_+0x1b0>
        }

        if (oldCurParent) ((oldCurParent->sz < cur->sz) ? oldCurParent->right : oldCurParent->left) = cur;
    800016e4:	012b3023          	sd	s2,0(s6)

        prev = cur;
        cur = cur->parent;
    800016e8:	01093483          	ld	s1,16(s2)
    while(cur) {
    800016ec:	0a048c63          	beqz	s1,800017a4 <_ZN7AVLTree7balanceEPS_+0x1c8>
        cur->height = 1 + max(cur->left, cur->right);
    800016f0:	0004ba03          	ld	s4,0(s1)
    800016f4:	0084b983          	ld	s3,8(s1)
    800016f8:	00098593          	mv	a1,s3
    800016fc:	000a0513          	mv	a0,s4
    80001700:	00000097          	auipc	ra,0x0
    80001704:	cec080e7          	jalr	-788(ra) # 800013ec <_ZN7AVLTree3maxEPKS_S1_>
    80001708:	0015051b          	addiw	a0,a0,1
    8000170c:	02a4ac23          	sw	a0,56(s1)
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
    80001710:	f00980e3          	beqz	s3,80001610 <_ZN7AVLTree7balanceEPS_+0x34>
    80001714:	0389a983          	lw	s3,56(s3)
    80001718:	0019899b          	addiw	s3,s3,1
    8000171c:	ee0a0ee3          	beqz	s4,80001618 <_ZN7AVLTree7balanceEPS_+0x3c>
    80001720:	038a2783          	lw	a5,56(s4)
    80001724:	0017879b          	addiw	a5,a5,1
    80001728:	40f989bb          	subw	s3,s3,a5
    8000172c:	00098a9b          	sext.w	s5,s3
    80001730:	ee0908e3          	beqz	s2,80001620 <_ZN7AVLTree7balanceEPS_+0x44>
    80001734:	00893783          	ld	a5,8(s2)
    80001738:	ee0788e3          	beqz	a5,80001628 <_ZN7AVLTree7balanceEPS_+0x4c>
    8000173c:	0387aa03          	lw	s4,56(a5)
    80001740:	001a0a1b          	addiw	s4,s4,1
    80001744:	ee0906e3          	beqz	s2,80001630 <_ZN7AVLTree7balanceEPS_+0x54>
    80001748:	00093783          	ld	a5,0(s2)
    8000174c:	ee0786e3          	beqz	a5,80001638 <_ZN7AVLTree7balanceEPS_+0x5c>
    80001750:	0387a783          	lw	a5,56(a5)
    80001754:	0017879b          	addiw	a5,a5,1
    80001758:	40fa0a3b          	subw	s4,s4,a5
        AVLTree* oldCurParent = cur->parent;
    8000175c:	0104bb03          	ld	s6,16(s1)
        if (curBalance < -1 && prevBalance * curBalance < 0) {
    80001760:	fff00793          	li	a5,-1
    80001764:	ecfacee3          	blt	s5,a5,80001640 <_ZN7AVLTree7balanceEPS_+0x64>
        }else if (curBalance < -1) {
    80001768:	fff00793          	li	a5,-1
    8000176c:	f0facce3          	blt	s5,a5,80001684 <_ZN7AVLTree7balanceEPS_+0xa8>
        if (curBalance > 1 && prevBalance * curBalance < 0) {
    80001770:	00100793          	li	a5,1
    80001774:	0157d663          	bge	a5,s5,80001780 <_ZN7AVLTree7balanceEPS_+0x1a4>
    80001778:	033a09bb          	mulw	s3,s4,s3
    8000177c:	f009cee3          	bltz	s3,80001698 <_ZN7AVLTree7balanceEPS_+0xbc>
        }else if (curBalance > 1) {
    80001780:	00100793          	li	a5,1
    80001784:	f557c6e3          	blt	a5,s5,800016d0 <_ZN7AVLTree7balanceEPS_+0xf4>
    80001788:	00048913          	mv	s2,s1
        if (oldCurParent) ((oldCurParent->sz < cur->sz) ? oldCurParent->right : oldCurParent->left) = cur;
    8000178c:	f40b0ee3          	beqz	s6,800016e8 <_ZN7AVLTree7balanceEPS_+0x10c>
    80001790:	030b3703          	ld	a4,48(s6)
    80001794:	03093783          	ld	a5,48(s2)
    80001798:	f4f776e3          	bgeu	a4,a5,800016e4 <_ZN7AVLTree7balanceEPS_+0x108>
    8000179c:	012b3423          	sd	s2,8(s6)
    800017a0:	f49ff06f          	j	800016e8 <_ZN7AVLTree7balanceEPS_+0x10c>
    }
    return prev;
}
    800017a4:	00090513          	mv	a0,s2
    800017a8:	03813083          	ld	ra,56(sp)
    800017ac:	03013403          	ld	s0,48(sp)
    800017b0:	02813483          	ld	s1,40(sp)
    800017b4:	02013903          	ld	s2,32(sp)
    800017b8:	01813983          	ld	s3,24(sp)
    800017bc:	01013a03          	ld	s4,16(sp)
    800017c0:	00813a83          	ld	s5,8(sp)
    800017c4:	00013b03          	ld	s6,0(sp)
    800017c8:	04010113          	addi	sp,sp,64
    800017cc:	00008067          	ret

00000000800017d0 <_ZN7AVLTree6insertEPS_S0_>:
    if (!root) {
    800017d0:	08050663          	beqz	a0,8000185c <_ZN7AVLTree6insertEPS_S0_+0x8c>
    800017d4:	00050613          	mv	a2,a0
    AVLTree* cur = root, *prev = nullptr;
    800017d8:	00050793          	mv	a5,a0
    800017dc:	00000513          	li	a0,0
    800017e0:	01c0006f          	j	800017fc <_ZN7AVLTree6insertEPS_S0_+0x2c>
            cur->sameSize = node;
    800017e4:	00b7bc23          	sd	a1,24(a5)
            return root;
    800017e8:	00060513          	mv	a0,a2
    800017ec:	00008067          	ret
            cur = cur->left;
    800017f0:	0007b703          	ld	a4,0(a5)
AVLTree* AVLTree::insert(AVLTree *root, AVLTree *node) {
    800017f4:	00078513          	mv	a0,a5
    800017f8:	00070793          	mv	a5,a4
    while(cur) {
    800017fc:	00078e63          	beqz	a5,80001818 <_ZN7AVLTree6insertEPS_S0_+0x48>
        if (node->sz == cur->sz) {
    80001800:	0305b683          	ld	a3,48(a1)
    80001804:	0307b703          	ld	a4,48(a5)
    80001808:	fce68ee3          	beq	a3,a4,800017e4 <_ZN7AVLTree6insertEPS_S0_+0x14>
        if (node->sz > cur->sz)
    8000180c:	fed772e3          	bgeu	a4,a3,800017f0 <_ZN7AVLTree6insertEPS_S0_+0x20>
            cur = cur->right;
    80001810:	0087b703          	ld	a4,8(a5)
    80001814:	fe1ff06f          	j	800017f4 <_ZN7AVLTree6insertEPS_S0_+0x24>
AVLTree* AVLTree::insert(AVLTree *root, AVLTree *node) {
    80001818:	ff010113          	addi	sp,sp,-16
    8000181c:	00113423          	sd	ra,8(sp)
    80001820:	00813023          	sd	s0,0(sp)
    80001824:	01010413          	addi	s0,sp,16
    (node->sz > prev->sz ? prev->right : prev->left) = node;
    80001828:	0305b703          	ld	a4,48(a1)
    8000182c:	03053783          	ld	a5,48(a0)
    80001830:	02e7f263          	bgeu	a5,a4,80001854 <_ZN7AVLTree6insertEPS_S0_+0x84>
    80001834:	00b53423          	sd	a1,8(a0)
    node->parent = prev;
    80001838:	00a5b823          	sd	a0,16(a1)
    return AVLTree::balance(cur);
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	da0080e7          	jalr	-608(ra) # 800015dc <_ZN7AVLTree7balanceEPS_>
}
    80001844:	00813083          	ld	ra,8(sp)
    80001848:	00013403          	ld	s0,0(sp)
    8000184c:	01010113          	addi	sp,sp,16
    80001850:	00008067          	ret
    (node->sz > prev->sz ? prev->right : prev->left) = node;
    80001854:	00b53023          	sd	a1,0(a0)
    80001858:	fe1ff06f          	j	80001838 <_ZN7AVLTree6insertEPS_S0_+0x68>
        return node;
    8000185c:	00058513          	mv	a0,a1
}
    80001860:	00008067          	ret

0000000080001864 <_ZN7AVLTree6removeEPS_S0_>:
AVLTree* AVLTree::remove(AVLTree* root, AVLTree* node) {
    80001864:	fd010113          	addi	sp,sp,-48
    80001868:	02113423          	sd	ra,40(sp)
    8000186c:	02813023          	sd	s0,32(sp)
    80001870:	00913c23          	sd	s1,24(sp)
    80001874:	01213823          	sd	s2,16(sp)
    80001878:	01313423          	sd	s3,8(sp)
    8000187c:	03010413          	addi	s0,sp,48
    80001880:	00050913          	mv	s2,a0
    if (!root) return nullptr;
    80001884:	04050c63          	beqz	a0,800018dc <_ZN7AVLTree6removeEPS_S0_+0x78>
    80001888:	00058493          	mv	s1,a1
    if (!node || !contains(root, node)) return root;
    8000188c:	04058863          	beqz	a1,800018dc <_ZN7AVLTree6removeEPS_S0_+0x78>
    80001890:	00000097          	auipc	ra,0x0
    80001894:	d04080e7          	jalr	-764(ra) # 80001594 <_ZN7AVLTree8containsEPKS_S1_>
    80001898:	04050263          	beqz	a0,800018dc <_ZN7AVLTree6removeEPS_S0_+0x78>
    if (node->sameSize) {
    8000189c:	0184b783          	ld	a5,24(s1)
    800018a0:	06078263          	beqz	a5,80001904 <_ZN7AVLTree6removeEPS_S0_+0xa0>
    return (node->parent && node->parent->right == node);
    800018a4:	0104b703          	ld	a4,16(s1)
    800018a8:	00070663          	beqz	a4,800018b4 <_ZN7AVLTree6removeEPS_S0_+0x50>
    800018ac:	00873683          	ld	a3,8(a4)
    800018b0:	04d48663          	beq	s1,a3,800018fc <_ZN7AVLTree6removeEPS_S0_+0x98>
        (isRightSon(node) ? node->parent->right : node->parent->left) = node->sameSize;
    800018b4:	00f73023          	sd	a5,0(a4)
        node->sameSize->right = node->right;
    800018b8:	0184b783          	ld	a5,24(s1)
    800018bc:	0084b703          	ld	a4,8(s1)
    800018c0:	00e7b423          	sd	a4,8(a5)
        node->sameSize->left = node->left;
    800018c4:	0184b783          	ld	a5,24(s1)
    800018c8:	0004b703          	ld	a4,0(s1)
    800018cc:	00e7b023          	sd	a4,0(a5)
        node->sameSize->parent = node->parent;
    800018d0:	0184b783          	ld	a5,24(s1)
    800018d4:	0104b703          	ld	a4,16(s1)
    800018d8:	00e7b823          	sd	a4,16(a5)
}
    800018dc:	00090513          	mv	a0,s2
    800018e0:	02813083          	ld	ra,40(sp)
    800018e4:	02013403          	ld	s0,32(sp)
    800018e8:	01813483          	ld	s1,24(sp)
    800018ec:	01013903          	ld	s2,16(sp)
    800018f0:	00813983          	ld	s3,8(sp)
    800018f4:	03010113          	addi	sp,sp,48
    800018f8:	00008067          	ret
        (isRightSon(node) ? node->parent->right : node->parent->left) = node->sameSize;
    800018fc:	00f73423          	sd	a5,8(a4)
    80001900:	fb9ff06f          	j	800018b8 <_ZN7AVLTree6removeEPS_S0_+0x54>
    if (!node->left && !node->right) { // no children
    80001904:	0004b783          	ld	a5,0(s1)
    80001908:	08078263          	beqz	a5,8000198c <_ZN7AVLTree6removeEPS_S0_+0x128>
    } else if (!node->left || !node->right) { // one child
    8000190c:	0a078663          	beqz	a5,800019b8 <_ZN7AVLTree6removeEPS_S0_+0x154>
    80001910:	0084b983          	ld	s3,8(s1)
    80001914:	0a098263          	beqz	s3,800019b8 <_ZN7AVLTree6removeEPS_S0_+0x154>
        AVLTree* swap = findSuccessor(node);
    80001918:	00048513          	mv	a0,s1
    8000191c:	00000097          	auipc	ra,0x0
    80001920:	b28080e7          	jalr	-1240(ra) # 80001444 <_ZN7AVLTree13findSuccessorEPS_>
    80001924:	00050793          	mv	a5,a0
        if (swap == node->right) {
    80001928:	10a98063          	beq	s3,a0,80001a28 <_ZN7AVLTree6removeEPS_S0_+0x1c4>
            updateFrom = swap->parent; // updating starts from swapped node
    8000192c:	01053503          	ld	a0,16(a0)
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001930:	00990c63          	beq	s2,s1,80001948 <_ZN7AVLTree6removeEPS_S0_+0xe4>
    return (node->parent && node->parent->right == node);
    80001934:	0104b703          	ld	a4,16(s1)
    80001938:	00070663          	beqz	a4,80001944 <_ZN7AVLTree6removeEPS_S0_+0xe0>
    8000193c:	00873683          	ld	a3,8(a4)
    80001940:	12d48863          	beq	s1,a3,80001a70 <_ZN7AVLTree6removeEPS_S0_+0x20c>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001944:	00f73023          	sd	a5,0(a4)
            node->left->parent = swap;
    80001948:	0004b703          	ld	a4,0(s1)
    8000194c:	00f73823          	sd	a5,16(a4)
            node->right->parent = swap;
    80001950:	0084b703          	ld	a4,8(s1)
    80001954:	00f73823          	sd	a5,16(a4)
            swap->parent->left = swap->right;
    80001958:	0107b683          	ld	a3,16(a5)
    8000195c:	0087b703          	ld	a4,8(a5)
    80001960:	00e6b023          	sd	a4,0(a3)
            if (swap->right) swap->right->parent = swap->parent;
    80001964:	00070663          	beqz	a4,80001970 <_ZN7AVLTree6removeEPS_S0_+0x10c>
    80001968:	0107b683          	ld	a3,16(a5)
    8000196c:	00d73823          	sd	a3,16(a4)
            swap->left = node->left;
    80001970:	0004b703          	ld	a4,0(s1)
    80001974:	00e7b023          	sd	a4,0(a5)
            swap->right = node->right;
    80001978:	0084b703          	ld	a4,8(s1)
    8000197c:	00e7b423          	sd	a4,8(a5)
            swap->parent = node->parent;
    80001980:	0104b703          	ld	a4,16(s1)
    80001984:	00e7b823          	sd	a4,16(a5)
    80001988:	0580006f          	j	800019e0 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    if (!node->left && !node->right) { // no children
    8000198c:	0084b703          	ld	a4,8(s1)
    80001990:	f6071ee3          	bnez	a4,8000190c <_ZN7AVLTree6removeEPS_S0_+0xa8>
        updateFrom = node->parent;
    80001994:	0104b503          	ld	a0,16(s1)
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = nullptr;
    80001998:	04990463          	beq	s2,s1,800019e0 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    return (node->parent && node->parent->right == node);
    8000199c:	00050663          	beqz	a0,800019a8 <_ZN7AVLTree6removeEPS_S0_+0x144>
    800019a0:	00853783          	ld	a5,8(a0)
    800019a4:	00f48663          	beq	s1,a5,800019b0 <_ZN7AVLTree6removeEPS_S0_+0x14c>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = nullptr;
    800019a8:	00053023          	sd	zero,0(a0)
    800019ac:	0340006f          	j	800019e0 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    800019b0:	00053423          	sd	zero,8(a0)
    800019b4:	02c0006f          	j	800019e0 <_ZN7AVLTree6removeEPS_S0_+0x17c>
        updateFrom = node->parent;
    800019b8:	0104b503          	ld	a0,16(s1)
        if (node == root) {updateFrom = (node->left) ? node->left : node->right; updateFrom->parent = nullptr;}
    800019bc:	02990a63          	beq	s2,s1,800019f0 <_ZN7AVLTree6removeEPS_S0_+0x18c>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    800019c0:	02990063          	beq	s2,s1,800019e0 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    return (node->parent && node->parent->right == node);
    800019c4:	0104b783          	ld	a5,16(s1)
    800019c8:	00078663          	beqz	a5,800019d4 <_ZN7AVLTree6removeEPS_S0_+0x170>
    800019cc:	0087b703          	ld	a4,8(a5)
    800019d0:	02e48c63          	beq	s1,a4,80001a08 <_ZN7AVLTree6removeEPS_S0_+0x1a4>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    800019d4:	0084b703          	ld	a4,8(s1)
    800019d8:	04070463          	beqz	a4,80001a20 <_ZN7AVLTree6removeEPS_S0_+0x1bc>
    800019dc:	00e7b023          	sd	a4,0(a5)
    return AVLTree::balance(updateFrom);
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	bfc080e7          	jalr	-1028(ra) # 800015dc <_ZN7AVLTree7balanceEPS_>
    800019e8:	00050913          	mv	s2,a0
    800019ec:	ef1ff06f          	j	800018dc <_ZN7AVLTree6removeEPS_S0_+0x78>
        if (node == root) {updateFrom = (node->left) ? node->left : node->right; updateFrom->parent = nullptr;}
    800019f0:	00078863          	beqz	a5,80001a00 <_ZN7AVLTree6removeEPS_S0_+0x19c>
    800019f4:	0007b823          	sd	zero,16(a5)
    800019f8:	00078513          	mv	a0,a5
    800019fc:	fc5ff06f          	j	800019c0 <_ZN7AVLTree6removeEPS_S0_+0x15c>
    80001a00:	0084b783          	ld	a5,8(s1)
    80001a04:	ff1ff06f          	j	800019f4 <_ZN7AVLTree6removeEPS_S0_+0x190>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    80001a08:	0084b703          	ld	a4,8(s1)
    80001a0c:	00070663          	beqz	a4,80001a18 <_ZN7AVLTree6removeEPS_S0_+0x1b4>
    80001a10:	00e7b423          	sd	a4,8(a5)
    80001a14:	fcdff06f          	j	800019e0 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    80001a18:	0004b703          	ld	a4,0(s1)
    80001a1c:	ff5ff06f          	j	80001a10 <_ZN7AVLTree6removeEPS_S0_+0x1ac>
    80001a20:	0004b703          	ld	a4,0(s1)
    80001a24:	fb9ff06f          	j	800019dc <_ZN7AVLTree6removeEPS_S0_+0x178>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a28:	00990c63          	beq	s2,s1,80001a40 <_ZN7AVLTree6removeEPS_S0_+0x1dc>
    return (node->parent && node->parent->right == node);
    80001a2c:	0104b703          	ld	a4,16(s1)
    80001a30:	00070663          	beqz	a4,80001a3c <_ZN7AVLTree6removeEPS_S0_+0x1d8>
    80001a34:	00873683          	ld	a3,8(a4)
    80001a38:	02d48863          	beq	s1,a3,80001a68 <_ZN7AVLTree6removeEPS_S0_+0x204>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a3c:	00f73023          	sd	a5,0(a4)
            node->right->parent = nullptr;
    80001a40:	0084b703          	ld	a4,8(s1)
    80001a44:	00073823          	sd	zero,16(a4)
            node->left->parent = swap;
    80001a48:	0004b703          	ld	a4,0(s1)
    80001a4c:	00f73823          	sd	a5,16(a4)
            swap->left = node->left;
    80001a50:	0004b703          	ld	a4,0(s1)
    80001a54:	00e7b023          	sd	a4,0(a5)
            swap->parent = node->parent;
    80001a58:	0104b703          	ld	a4,16(s1)
    80001a5c:	00e7b823          	sd	a4,16(a5)
            updateFrom = swap;
    80001a60:	00078513          	mv	a0,a5
    80001a64:	f7dff06f          	j	800019e0 <_ZN7AVLTree6removeEPS_S0_+0x17c>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a68:	00a73423          	sd	a0,8(a4)
    80001a6c:	fd5ff06f          	j	80001a40 <_ZN7AVLTree6removeEPS_S0_+0x1dc>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a70:	00f73423          	sd	a5,8(a4)
    80001a74:	ed5ff06f          	j	80001948 <_ZN7AVLTree6removeEPS_S0_+0xe4>

0000000080001a78 <_ZN7AVLTree6swapLLEPS_S0_S0_>:

AVLTree *AVLTree::swapLL(AVLTree *toSwap, AVLTree *swap, AVLTree* root) {
    80001a78:	ff010113          	addi	sp,sp,-16
    80001a7c:	00813423          	sd	s0,8(sp)
    80001a80:	01010413          	addi	s0,sp,16
    80001a84:	00050793          	mv	a5,a0
    80001a88:	00060513          	mv	a0,a2
    if (!toSwap || !swap || !root || toSwap == swap)
    80001a8c:	02078863          	beqz	a5,80001abc <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001a90:	02058663          	beqz	a1,80001abc <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001a94:	02060463          	beqz	a2,80001abc <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001a98:	02b78263          	beq	a5,a1,80001abc <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
        return root;

    if (toSwap == root) {
    80001a9c:	02c78663          	beq	a5,a2,80001ac8 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x50>
        swap->prev = nullptr;
        if (root->next) root->next->prev = swap;
        return swap;
    }

    AVLTree* prevNode = toSwap->prev;
    80001aa0:	0287b703          	ld	a4,40(a5)
    AVLTree* nextNode = toSwap->next;
    80001aa4:	0207b783          	ld	a5,32(a5)
    prevNode->next = swap;
    80001aa8:	02b73023          	sd	a1,32(a4)
    swap->prev = prevNode;
    80001aac:	02e5b423          	sd	a4,40(a1)
    if (nextNode) nextNode->prev = swap;
    80001ab0:	00078463          	beqz	a5,80001ab8 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x40>
    80001ab4:	02b7b423          	sd	a1,40(a5)
    swap->next = nextNode;
    80001ab8:	02f5b023          	sd	a5,32(a1)

    return root;

}
    80001abc:	00813403          	ld	s0,8(sp)
    80001ac0:	01010113          	addi	sp,sp,16
    80001ac4:	00008067          	ret
        swap->next = root->next;
    80001ac8:	02063783          	ld	a5,32(a2)
    80001acc:	02f5b023          	sd	a5,32(a1)
        swap->prev = nullptr;
    80001ad0:	0205b423          	sd	zero,40(a1)
        if (root->next) root->next->prev = swap;
    80001ad4:	02063783          	ld	a5,32(a2)
    80001ad8:	00078463          	beqz	a5,80001ae0 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x68>
    80001adc:	02b7b423          	sd	a1,40(a5)
        return swap;
    80001ae0:	00058513          	mv	a0,a1
    80001ae4:	fd9ff06f          	j	80001abc <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>

0000000080001ae8 <_ZN7AVLTree8removeLLEPS_S0_>:

AVLTree *AVLTree::removeLL(AVLTree *toRem, AVLTree *root) {
    80001ae8:	ff010113          	addi	sp,sp,-16
    80001aec:	00813423          	sd	s0,8(sp)
    80001af0:	01010413          	addi	s0,sp,16
    80001af4:	00050793          	mv	a5,a0
    if (!root) return toRem;
    80001af8:	02058263          	beqz	a1,80001b1c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    80001afc:	00058513          	mv	a0,a1
    if (!toRem) return root;
    80001b00:	00078e63          	beqz	a5,80001b1c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    if (root == toRem) {
    80001b04:	02f58263          	beq	a1,a5,80001b28 <_ZN7AVLTree8removeLLEPS_S0_+0x40>
        root = root->next;
        if (root) root->prev = nullptr;
        return root;
    }
    AVLTree* prevNode = toRem->prev;
    80001b08:	0287b703          	ld	a4,40(a5)
    AVLTree* nextNode = toRem->next;
    80001b0c:	0207b783          	ld	a5,32(a5)
    prevNode->next = nextNode;
    80001b10:	02f73023          	sd	a5,32(a4)
    if (nextNode)
    80001b14:	00078463          	beqz	a5,80001b1c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
        nextNode->prev = prevNode;
    80001b18:	02e7b423          	sd	a4,40(a5)

    return root;
}
    80001b1c:	00813403          	ld	s0,8(sp)
    80001b20:	01010113          	addi	sp,sp,16
    80001b24:	00008067          	ret
        root = root->next;
    80001b28:	0205b503          	ld	a0,32(a1)
        if (root) root->prev = nullptr;
    80001b2c:	fe0508e3          	beqz	a0,80001b1c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    80001b30:	02053423          	sd	zero,40(a0)
        return root;
    80001b34:	fe9ff06f          	j	80001b1c <_ZN7AVLTree8removeLLEPS_S0_+0x34>

0000000080001b38 <_ZN7AVLTree15findPredecessorEPS_>:

AVLTree *AVLTree::findPredecessor(AVLTree *node) {
    80001b38:	ff010113          	addi	sp,sp,-16
    80001b3c:	00813423          	sd	s0,8(sp)
    80001b40:	01010413          	addi	s0,sp,16
    if (!node || !node->left) return nullptr;
    80001b44:	00050c63          	beqz	a0,80001b5c <_ZN7AVLTree15findPredecessorEPS_+0x24>
    80001b48:	00053783          	ld	a5,0(a0)
    80001b4c:	00078e63          	beqz	a5,80001b68 <_ZN7AVLTree15findPredecessorEPS_+0x30>
    node = node->left;
    while(node->right)
    80001b50:	00078513          	mv	a0,a5
    80001b54:	0087b783          	ld	a5,8(a5)
    80001b58:	fe079ce3          	bnez	a5,80001b50 <_ZN7AVLTree15findPredecessorEPS_+0x18>
        node = node->right;
    return node;
}
    80001b5c:	00813403          	ld	s0,8(sp)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret
    if (!node || !node->left) return nullptr;
    80001b68:	00078513          	mv	a0,a5
    80001b6c:	ff1ff06f          	j	80001b5c <_ZN7AVLTree15findPredecessorEPS_+0x24>

0000000080001b70 <_ZN7AVLTree8insertLLEPS_S0_>:

AVLTree *AVLTree::insertLL(AVLTree *toInsert, AVLTree *root) {
    80001b70:	ff010113          	addi	sp,sp,-16
    80001b74:	00813423          	sd	s0,8(sp)
    80001b78:	01010413          	addi	s0,sp,16
    if (!toInsert) return root;
    80001b7c:	04050c63          	beqz	a0,80001bd4 <_ZN7AVLTree8insertLLEPS_S0_+0x64>
    if (!root || toInsert < root) {
    80001b80:	04058063          	beqz	a1,80001bc0 <_ZN7AVLTree8insertLLEPS_S0_+0x50>
    80001b84:	02b56e63          	bltu	a0,a1,80001bc0 <_ZN7AVLTree8insertLLEPS_S0_+0x50>
        toInsert->prev = nullptr;
        if (root) root->prev = toInsert;
        return toInsert;
    }

    AVLTree* cur = root;
    80001b88:	00058793          	mv	a5,a1
    for (; cur->next && (cur->next < toInsert); cur = cur->next);
    80001b8c:	00078713          	mv	a4,a5
    80001b90:	0207b783          	ld	a5,32(a5)
    80001b94:	00078463          	beqz	a5,80001b9c <_ZN7AVLTree8insertLLEPS_S0_+0x2c>
    80001b98:	fea7eae3          	bltu	a5,a0,80001b8c <_ZN7AVLTree8insertLLEPS_S0_+0x1c>

    toInsert->next = cur->next;
    80001b9c:	02f53023          	sd	a5,32(a0)
    if(cur->next) cur->next->prev = toInsert;
    80001ba0:	00078463          	beqz	a5,80001ba8 <_ZN7AVLTree8insertLLEPS_S0_+0x38>
    80001ba4:	02a7b423          	sd	a0,40(a5)
    cur->next = toInsert;
    80001ba8:	02a73023          	sd	a0,32(a4)
    toInsert->prev = cur;
    80001bac:	02e53423          	sd	a4,40(a0)

    return root;
    80001bb0:	00058513          	mv	a0,a1
}
    80001bb4:	00813403          	ld	s0,8(sp)
    80001bb8:	01010113          	addi	sp,sp,16
    80001bbc:	00008067          	ret
        toInsert->next = root;
    80001bc0:	02b53023          	sd	a1,32(a0)
        toInsert->prev = nullptr;
    80001bc4:	02053423          	sd	zero,40(a0)
        if (root) root->prev = toInsert;
    80001bc8:	fe0586e3          	beqz	a1,80001bb4 <_ZN7AVLTree8insertLLEPS_S0_+0x44>
    80001bcc:	02a5b423          	sd	a0,40(a1)
        return toInsert;
    80001bd0:	fe5ff06f          	j	80001bb4 <_ZN7AVLTree8insertLLEPS_S0_+0x44>
    if (!toInsert) return root;
    80001bd4:	00058513          	mv	a0,a1
    80001bd8:	fddff06f          	j	80001bb4 <_ZN7AVLTree8insertLLEPS_S0_+0x44>

0000000080001bdc <_ZN5RiscV10popSppSpieEv>:
//

#include "../h/RiscV.h"


void RiscV::popSppSpie() {
    80001bdc:	ff010113          	addi	sp,sp,-16
    80001be0:	00813423          	sd	s0,8(sp)
    80001be4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80001be8:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80001bec:	10200073          	sret
}
    80001bf0:	00813403          	ld	s0,8(sp)
    80001bf4:	01010113          	addi	sp,sp,16
    80001bf8:	00008067          	ret

0000000080001bfc <main>:

#include "../lib/console.h"
#include "../h/syscall_c.h"


int main() {
    80001bfc:	ff010113          	addi	sp,sp,-16
    80001c00:	00113423          	sd	ra,8(sp)
    80001c04:	00813023          	sd	s0,0(sp)
    80001c08:	01010413          	addi	s0,sp,16

    RiscV::stvecW((uint64)&RiscV::setStvecTable | 0x01);
    80001c0c:	fffff797          	auipc	a5,0xfffff
    80001c10:	3f478793          	addi	a5,a5,1012 # 80001000 <_ZN5RiscV13setStvecTableEv>
    80001c14:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001c18:	10579073          	csrw	stvec,a5

    int* ptr = (int*)mem_alloc(10*sizeof(int));
    80001c1c:	02800513          	li	a0,40
    80001c20:	fffff097          	auipc	ra,0xfffff
    80001c24:	728080e7          	jalr	1832(ra) # 80001348 <_Z9mem_allocm>
    for(int i=0; i<10; i++) ptr[i] = 0;
    80001c28:	00000793          	li	a5,0
    80001c2c:	00900713          	li	a4,9
    80001c30:	00f74c63          	blt	a4,a5,80001c48 <main+0x4c>
    80001c34:	00279713          	slli	a4,a5,0x2
    80001c38:	00e50733          	add	a4,a0,a4
    80001c3c:	00072023          	sw	zero,0(a4)
    80001c40:	0017879b          	addiw	a5,a5,1
    80001c44:	fe9ff06f          	j	80001c2c <main+0x30>
    mem_free(ptr);
    80001c48:	fffff097          	auipc	ra,0xfffff
    80001c4c:	72c080e7          	jalr	1836(ra) # 80001374 <_Z8mem_freePv>

    return 0;
}
    80001c50:	00000513          	li	a0,0
    80001c54:	00813083          	ld	ra,8(sp)
    80001c58:	00013403          	ld	s0,0(sp)
    80001c5c:	01010113          	addi	sp,sp,16
    80001c60:	00008067          	ret
    static void setStvecTable(){}
    80001c64:	ff010113          	addi	sp,sp,-16
    80001c68:	00813423          	sd	s0,8(sp)
    80001c6c:	01010413          	addi	s0,sp,16
    80001c70:	00813403          	ld	s0,8(sp)
    80001c74:	01010113          	addi	sp,sp,16
    80001c78:	00008067          	ret

0000000080001c7c <_Znwm>:
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.h"

void *operator new(size_t n) {
    80001c7c:	ff010113          	addi	sp,sp,-16
    80001c80:	00113423          	sd	ra,8(sp)
    80001c84:	00813023          	sd	s0,0(sp)
    80001c88:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001c8c:	fffff097          	auipc	ra,0xfffff
    80001c90:	6bc080e7          	jalr	1724(ra) # 80001348 <_Z9mem_allocm>
}
    80001c94:	00813083          	ld	ra,8(sp)
    80001c98:	00013403          	ld	s0,0(sp)
    80001c9c:	01010113          	addi	sp,sp,16
    80001ca0:	00008067          	ret

0000000080001ca4 <_Znam>:

void *operator new[](size_t n) {
    80001ca4:	ff010113          	addi	sp,sp,-16
    80001ca8:	00113423          	sd	ra,8(sp)
    80001cac:	00813023          	sd	s0,0(sp)
    80001cb0:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001cb4:	fffff097          	auipc	ra,0xfffff
    80001cb8:	694080e7          	jalr	1684(ra) # 80001348 <_Z9mem_allocm>
}
    80001cbc:	00813083          	ld	ra,8(sp)
    80001cc0:	00013403          	ld	s0,0(sp)
    80001cc4:	01010113          	addi	sp,sp,16
    80001cc8:	00008067          	ret

0000000080001ccc <_ZdlPv>:

void operator delete(void *p) noexcept {
    80001ccc:	ff010113          	addi	sp,sp,-16
    80001cd0:	00113423          	sd	ra,8(sp)
    80001cd4:	00813023          	sd	s0,0(sp)
    80001cd8:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001cdc:	fffff097          	auipc	ra,0xfffff
    80001ce0:	698080e7          	jalr	1688(ra) # 80001374 <_Z8mem_freePv>
}
    80001ce4:	00813083          	ld	ra,8(sp)
    80001ce8:	00013403          	ld	s0,0(sp)
    80001cec:	01010113          	addi	sp,sp,16
    80001cf0:	00008067          	ret

0000000080001cf4 <_ZdaPv>:

void operator delete[](void *p) noexcept {
    80001cf4:	ff010113          	addi	sp,sp,-16
    80001cf8:	00113423          	sd	ra,8(sp)
    80001cfc:	00813023          	sd	s0,0(sp)
    80001d00:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001d04:	fffff097          	auipc	ra,0xfffff
    80001d08:	670080e7          	jalr	1648(ra) # 80001374 <_Z8mem_freePv>
    80001d0c:	00813083          	ld	ra,8(sp)
    80001d10:	00013403          	ld	s0,0(sp)
    80001d14:	01010113          	addi	sp,sp,16
    80001d18:	00008067          	ret

0000000080001d1c <_ZN17interruptHandlers20handleSupervisorTrapEv>:
#include "../h/MemoryAllocator.h"
#include "../h/RiscV.h"

namespace interruptHandlers {

    void handleSupervisorTrap() {
    80001d1c:	fc010113          	addi	sp,sp,-64
    80001d20:	02113c23          	sd	ra,56(sp)
    80001d24:	02813823          	sd	s0,48(sp)
    80001d28:	02913423          	sd	s1,40(sp)
    80001d2c:	03213023          	sd	s2,32(sp)
    80001d30:	04010413          	addi	s0,sp,64
    static void mc_sip(BitMaskSip mask);
};

inline uint64 RiscV::scauseR() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001d34:	142027f3          	csrr	a5,scause
    80001d38:	fcf43023          	sd	a5,-64(s0)
    return scause;
    80001d3c:	fc043783          	ld	a5,-64(s0)
        uint64 scause = RiscV::scauseR();
        // not ecall interruption
        if (scause != (uint64) (1 << 3) && scause != (uint64) (1 << 3 | 0x01)) {
    80001d40:	ff878793          	addi	a5,a5,-8
    80001d44:	00100713          	li	a4,1
    80001d48:	04f76063          	bltu	a4,a5,80001d88 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x6c>
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 RiscV::sepcR() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001d4c:	141027f3          	csrr	a5,sepc
    80001d50:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80001d54:	fd843483          	ld	s1,-40(s0)
             */
            return;
        }

        // interrupt from UserMode(0x08) or KernelMode(0x09)
        uint64 sepc = RiscV::sepcR() + 4;
    80001d58:	00448493          	addi	s1,s1,4
    __asm__ volatile ("mv a1, %0" : : "r"(val));
}

inline uint64 RiscV::sstatusR() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001d5c:	100027f3          	csrr	a5,sstatus
    80001d60:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001d64:	fd043903          	ld	s2,-48(s0)
    __asm__ volatile ("mv %0, a0" : "=r"(a0));
    80001d68:	00050793          	mv	a5,a0
    80001d6c:	fcf43423          	sd	a5,-56(s0)
    return a0;
    80001d70:	fc843783          	ld	a5,-56(s0)
        uint64 sstatus = RiscV::sstatusR();
        uint64 codeOp = RiscV::a0R();
        uint64 retVal;

        switch (codeOp) {
    80001d74:	02e78663          	beq	a5,a4,80001da0 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x84>
    80001d78:	00200713          	li	a4,2
    80001d7c:	02e78e63          	beq	a5,a4,80001db8 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x9c>
}

inline void RiscV::sstatusW(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001d80:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001d84:	14149073          	csrw	sepc,s1
        }

        RiscV::sstatusW(sstatus);
        RiscV::sepcW(sepc);

    }
    80001d88:	03813083          	ld	ra,56(sp)
    80001d8c:	03013403          	ld	s0,48(sp)
    80001d90:	02813483          	ld	s1,40(sp)
    80001d94:	02013903          	ld	s2,32(sp)
    80001d98:	04010113          	addi	sp,sp,64
    80001d9c:	00008067          	ret
                __asm__ volatile ("mv %0, a1" : "=r" (size));
    80001da0:	00058513          	mv	a0,a1
                retVal = (uint64) MemoryAllocator::mem_alloc(size);
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	114080e7          	jalr	276(ra) # 80001eb8 <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    80001dac:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(x8)" : : "r"(retVal));
    80001db0:	04543823          	sd	t0,80(s0)
                break;
    80001db4:	fcdff06f          	j	80001d80 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>
                __asm__ volatile ("mv %0, a1" : "=r"(ptr));
    80001db8:	00058513          	mv	a0,a1
                retVal = MemoryAllocator::mem_free(ptr);
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	250080e7          	jalr	592(ra) # 8000200c <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    80001dc4:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(x8)" : : "r"(retVal));
    80001dc8:	04543823          	sd	t0,80(s0)
                break;
    80001dcc:	fb5ff06f          	j	80001d80 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>

0000000080001dd0 <_ZN17interruptHandlers22handleConsoleInterruptEv>:

    void handleConsoleInterrupt() {
    80001dd0:	ff010113          	addi	sp,sp,-16
    80001dd4:	00113423          	sd	ra,8(sp)
    80001dd8:	00813023          	sd	s0,0(sp)
    80001ddc:	01010413          	addi	s0,sp,16
        console_handler();
    80001de0:	00002097          	auipc	ra,0x2
    80001de4:	590080e7          	jalr	1424(ra) # 80004370 <console_handler>
    }
    80001de8:	00813083          	ld	ra,8(sp)
    80001dec:	00013403          	ld	s0,0(sp)
    80001df0:	01010113          	addi	sp,sp,16
    80001df4:	00008067          	ret

0000000080001df8 <_ZN17interruptHandlers20handleTimerInterruptEv>:

    void handleTimerInterrupt() {
    80001df8:	ff010113          	addi	sp,sp,-16
    80001dfc:	00813423          	sd	s0,8(sp)
    80001e00:	01010413          	addi	s0,sp,16
inline void RiscV::ms_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"((uint64)mask));
}

inline void RiscV::mc_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"((uint64)mask));
    80001e04:	00200793          	li	a5,2
    80001e08:	1447b073          	csrc	sip,a5
        /*uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        TCB::dispatch();
        w_sstatus(sstatus);
        w_sepc(sepc);*/
    }
    80001e0c:	00813403          	ld	s0,8(sp)
    80001e10:	01010113          	addi	sp,sp,16
    80001e14:	00008067          	ret

0000000080001e18 <_ZN15MemoryAllocator7initMemEv>:
const uint64 MemoryAllocator::HEADER_SIZE = (uint64)
        ((sizeof(AVLTree) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
bool MemoryAllocator::initialised = false;


void MemoryAllocator::initMem() {
    80001e18:	ff010113          	addi	sp,sp,-16
    80001e1c:	00813423          	sd	s0,8(sp)
    80001e20:	01010413          	addi	s0,sp,16
    if (MemoryAllocator::initialised) return;
    80001e24:	00004797          	auipc	a5,0x4
    80001e28:	99c7c783          	lbu	a5,-1636(a5) # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80001e2c:	08079063          	bnez	a5,80001eac <_ZN15MemoryAllocator7initMemEv+0x94>

    MemoryAllocator::startAddr = (((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80001e30:	00004797          	auipc	a5,0x4
    80001e34:	9307b783          	ld	a5,-1744(a5) # 80005760 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e38:	0007b783          	ld	a5,0(a5)
    80001e3c:	03f78793          	addi	a5,a5,63
    80001e40:	fc07f793          	andi	a5,a5,-64
    80001e44:	00004717          	auipc	a4,0x4
    80001e48:	97c70713          	addi	a4,a4,-1668 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80001e4c:	00f73423          	sd	a5,8(a4)
    MemoryAllocator::endAddr = ((uint64)HEAP_END_ADDR / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80001e50:	00004697          	auipc	a3,0x4
    80001e54:	9206b683          	ld	a3,-1760(a3) # 80005770 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001e58:	0006b683          	ld	a3,0(a3)
    80001e5c:	fc06f693          	andi	a3,a3,-64
    80001e60:	00d73823          	sd	a3,16(a4)

    MemoryAllocator::free = (AVLTree*) MemoryAllocator::startAddr;
    80001e64:	00f73c23          	sd	a5,24(a4)
        resetAll();
        this->sz = sz;
    }

    void resetAll(RESET_FLAGS flags = NO_FLAG) {
        left = right = parent = next = prev = sameSize = nullptr; height = 0;
    80001e68:	0007bc23          	sd	zero,24(a5)
    80001e6c:	0207b423          	sd	zero,40(a5)
    80001e70:	0207b023          	sd	zero,32(a5)
    80001e74:	0007b823          	sd	zero,16(a5)
    80001e78:	0007b423          	sd	zero,8(a5)
    80001e7c:	0007b023          	sd	zero,0(a5)
    80001e80:	0207ac23          	sw	zero,56(a5)
    MemoryAllocator::free->resetAll();
    MemoryAllocator::free->isFree = true;
    80001e84:	01873683          	ld	a3,24(a4)
    80001e88:	00100613          	li	a2,1
    80001e8c:	02c68e23          	sb	a2,60(a3)
    MemoryAllocator::free->sz =
            (size_t) (MemoryAllocator::endAddr - MemoryAllocator::startAddr - MemoryAllocator::HEADER_SIZE);
    80001e90:	01073783          	ld	a5,16(a4)
    80001e94:	00873583          	ld	a1,8(a4)
    80001e98:	40b787b3          	sub	a5,a5,a1
    80001e9c:	fc078793          	addi	a5,a5,-64
    MemoryAllocator::free->sz =
    80001ea0:	02f6b823          	sd	a5,48(a3)
    MemoryAllocator::first = MemoryAllocator::free;
    80001ea4:	02d73023          	sd	a3,32(a4)
    MemoryAllocator::initialised = true;
    80001ea8:	00c70023          	sb	a2,0(a4)
}
    80001eac:	00813403          	ld	s0,8(sp)
    80001eb0:	01010113          	addi	sp,sp,16
    80001eb4:	00008067          	ret

0000000080001eb8 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    80001eb8:	fd010113          	addi	sp,sp,-48
    80001ebc:	02113423          	sd	ra,40(sp)
    80001ec0:	02813023          	sd	s0,32(sp)
    80001ec4:	00913c23          	sd	s1,24(sp)
    80001ec8:	01213823          	sd	s2,16(sp)
    80001ecc:	01313423          	sd	s3,8(sp)
    80001ed0:	03010413          	addi	s0,sp,48
    if (size <= 0) return nullptr;
    80001ed4:	12050863          	beqz	a0,80002004 <_ZN15MemoryAllocator9mem_allocEm+0x14c>
    80001ed8:	00050493          	mv	s1,a0
    if (!MemoryAllocator::initialised)
    80001edc:	00004797          	auipc	a5,0x4
    80001ee0:	8e47c783          	lbu	a5,-1820(a5) # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80001ee4:	08078e63          	beqz	a5,80001f80 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
        MemoryAllocator::initMem();

    size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80001ee8:	03f48493          	addi	s1,s1,63
    80001eec:	fc04f493          	andi	s1,s1,-64

    AVLTree* freeSeg = AVLTree::findFreeSeg(MemoryAllocator::free, size);
    80001ef0:	00048593          	mv	a1,s1
    80001ef4:	00004517          	auipc	a0,0x4
    80001ef8:	8e453503          	ld	a0,-1820(a0) # 800057d8 <_ZN15MemoryAllocator4freeE>
    80001efc:	fffff097          	auipc	ra,0xfffff
    80001f00:	4a8080e7          	jalr	1192(ra) # 800013a4 <_ZN7AVLTree11findFreeSegEPS_m>
    80001f04:	00050913          	mv	s2,a0
    if (!freeSeg) return nullptr;
    80001f08:	04050c63          	beqz	a0,80001f60 <_ZN15MemoryAllocator9mem_allocEm+0xa8>

    MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, freeSeg);
    80001f0c:	00004997          	auipc	s3,0x4
    80001f10:	8b498993          	addi	s3,s3,-1868 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80001f14:	00050593          	mv	a1,a0
    80001f18:	0189b503          	ld	a0,24(s3)
    80001f1c:	00000097          	auipc	ra,0x0
    80001f20:	948080e7          	jalr	-1720(ra) # 80001864 <_ZN7AVLTree6removeEPS_S0_>
    80001f24:	00a9bc23          	sd	a0,24(s3)

    if (size + MEM_BLOCK_SIZE + HEADER_SIZE <= freeSeg->sz
    80001f28:	08048793          	addi	a5,s1,128
    80001f2c:	03093703          	ld	a4,48(s2)
    80001f30:	00f76663          	bltu	a4,a5,80001f3c <_ZN15MemoryAllocator9mem_allocEm+0x84>
                && size + MEM_BLOCK_SIZE + HEADER_SIZE >= size) { //overflow check
    80001f34:	f7f00793          	li	a5,-129
    80001f38:	0497fa63          	bgeu	a5,s1,80001f8c <_ZN15MemoryAllocator9mem_allocEm+0xd4>
        freeSeg->sz = size;
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
        newFreeSeg->isFree = true;
    } else {
        MemoryAllocator::first = AVLTree::removeLL(freeSeg, MemoryAllocator::first);
    80001f3c:	00004497          	auipc	s1,0x4
    80001f40:	88448493          	addi	s1,s1,-1916 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80001f44:	0204b583          	ld	a1,32(s1)
    80001f48:	00090513          	mv	a0,s2
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	b9c080e7          	jalr	-1124(ra) # 80001ae8 <_ZN7AVLTree8removeLLEPS_S0_>
    80001f54:	02a4b023          	sd	a0,32(s1)
    }
    freeSeg->isFree = false;
    80001f58:	02090e23          	sb	zero,60(s2)
    return (void*) ((uint64)freeSeg + HEADER_SIZE);
    80001f5c:	04090913          	addi	s2,s2,64
}
    80001f60:	00090513          	mv	a0,s2
    80001f64:	02813083          	ld	ra,40(sp)
    80001f68:	02013403          	ld	s0,32(sp)
    80001f6c:	01813483          	ld	s1,24(sp)
    80001f70:	01013903          	ld	s2,16(sp)
    80001f74:	00813983          	ld	s3,8(sp)
    80001f78:	03010113          	addi	sp,sp,48
    80001f7c:	00008067          	ret
        MemoryAllocator::initMem();
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	e98080e7          	jalr	-360(ra) # 80001e18 <_ZN15MemoryAllocator7initMemEv>
    80001f88:	f61ff06f          	j	80001ee8 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        AVLTree* newFreeSeg = (AVLTree*) ((uint64)freeSeg + size + HEADER_SIZE);
    80001f8c:	009907b3          	add	a5,s2,s1
    80001f90:	04078993          	addi	s3,a5,64
    80001f94:	0407bc23          	sd	zero,88(a5)
    80001f98:	0607b423          	sd	zero,104(a5)
    80001f9c:	0607b023          	sd	zero,96(a5)
    80001fa0:	0407b823          	sd	zero,80(a5)
    80001fa4:	0407b423          	sd	zero,72(a5)
    80001fa8:	0407b023          	sd	zero,64(a5)
    80001fac:	0607ac23          	sw	zero,120(a5)
        newFreeSeg->sz = freeSeg->sz - size - HEADER_SIZE;
    80001fb0:	03093783          	ld	a5,48(s2)
    80001fb4:	409787b3          	sub	a5,a5,s1
    80001fb8:	fc078793          	addi	a5,a5,-64
    80001fbc:	02f9b823          	sd	a5,48(s3)
        freeSeg->sz = size;
    80001fc0:	02993823          	sd	s1,48(s2)
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
    80001fc4:	00003497          	auipc	s1,0x3
    80001fc8:	7fc48493          	addi	s1,s1,2044 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80001fcc:	00098593          	mv	a1,s3
    80001fd0:	0184b503          	ld	a0,24(s1)
    80001fd4:	fffff097          	auipc	ra,0xfffff
    80001fd8:	7fc080e7          	jalr	2044(ra) # 800017d0 <_ZN7AVLTree6insertEPS_S0_>
    80001fdc:	00a4bc23          	sd	a0,24(s1)
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
    80001fe0:	0204b603          	ld	a2,32(s1)
    80001fe4:	00098593          	mv	a1,s3
    80001fe8:	00090513          	mv	a0,s2
    80001fec:	00000097          	auipc	ra,0x0
    80001ff0:	a8c080e7          	jalr	-1396(ra) # 80001a78 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    80001ff4:	02a4b023          	sd	a0,32(s1)
        newFreeSeg->isFree = true;
    80001ff8:	00100793          	li	a5,1
    80001ffc:	02f98e23          	sb	a5,60(s3)
    80002000:	f59ff06f          	j	80001f58 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
    if (size <= 0) return nullptr;
    80002004:	00000913          	li	s2,0
    80002008:	f59ff06f          	j	80001f60 <_ZN15MemoryAllocator9mem_allocEm+0xa8>

000000008000200c <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *ptr) {

    if (!ptr) return -1;
    8000200c:	20050a63          	beqz	a0,80002220 <_ZN15MemoryAllocator8mem_freeEPv+0x214>
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesnt point to beginning of block (its faulty)
    80002010:	03f57713          	andi	a4,a0,63
    80002014:	20071a63          	bnez	a4,80002228 <_ZN15MemoryAllocator8mem_freeEPv+0x21c>
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    80002018:	00003717          	auipc	a4,0x3
    8000201c:	7b873703          	ld	a4,1976(a4) # 800057d0 <_ZN15MemoryAllocator7endAddrE>
    80002020:	20e57863          	bgeu	a0,a4,80002230 <_ZN15MemoryAllocator8mem_freeEPv+0x224>
    80002024:	00003717          	auipc	a4,0x3
    80002028:	7a473703          	ld	a4,1956(a4) # 800057c8 <_ZN15MemoryAllocator9startAddrE>
    8000202c:	20e56663          	bltu	a0,a4,80002238 <_ZN15MemoryAllocator8mem_freeEPv+0x22c>
int MemoryAllocator::mem_free(void *ptr) {
    80002030:	fc010113          	addi	sp,sp,-64
    80002034:	02113c23          	sd	ra,56(sp)
    80002038:	02813823          	sd	s0,48(sp)
    8000203c:	02913423          	sd	s1,40(sp)
    80002040:	03213023          	sd	s2,32(sp)
    80002044:	01313c23          	sd	s3,24(sp)
    80002048:	01413823          	sd	s4,16(sp)
    8000204c:	01513423          	sd	s5,8(sp)
    80002050:	04010413          	addi	s0,sp,64

    AVLTree* cur = (AVLTree*) ((uint64)ptr - HEADER_SIZE); cur->resetAll(AVLTree::SAVE_SZ); cur->isFree = true;
    80002054:	fc050913          	addi	s2,a0,-64
    80002058:	00090993          	mv	s3,s2
    8000205c:	00093c23          	sd	zero,24(s2)
    80002060:	02093423          	sd	zero,40(s2)
    80002064:	02093023          	sd	zero,32(s2)
    80002068:	00093823          	sd	zero,16(s2)
    8000206c:	00093423          	sd	zero,8(s2)
    80002070:	fc053023          	sd	zero,-64(a0)
    80002074:	02092c23          	sw	zero,56(s2)
    80002078:	00100793          	li	a5,1
    8000207c:	02f90e23          	sb	a5,60(s2)
    AVLTree* aft = ((uint64)cur + cur->sz + HEADER_SIZE >= MemoryAllocator::endAddr) ? nullptr :
    80002080:	03093483          	ld	s1,48(s2)
    80002084:	009904b3          	add	s1,s2,s1
    80002088:	04048493          	addi	s1,s1,64
    8000208c:	00003797          	auipc	a5,0x3
    80002090:	7447b783          	ld	a5,1860(a5) # 800057d0 <_ZN15MemoryAllocator7endAddrE>
    80002094:	04f4f863          	bgeu	s1,a5,800020e4 <_ZN15MemoryAllocator8mem_freeEPv+0xd8>
    80002098:	00048a13          	mv	s4,s1
            (AVLTree*) ((uint64)cur + cur->sz + HEADER_SIZE);
    AVLTree* toSwap = nullptr;

    if (aft && aft->isFree) {
    8000209c:	04048663          	beqz	s1,800020e8 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    800020a0:	03c4c783          	lbu	a5,60(s1)
    800020a4:	00079663          	bnez	a5,800020b0 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    AVLTree* toSwap = nullptr;
    800020a8:	00000a13          	li	s4,0
    800020ac:	03c0006f          	j	800020e8 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, aft);
    800020b0:	00003a97          	auipc	s5,0x3
    800020b4:	710a8a93          	addi	s5,s5,1808 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    800020b8:	00048593          	mv	a1,s1
    800020bc:	018ab503          	ld	a0,24(s5)
    800020c0:	fffff097          	auipc	ra,0xfffff
    800020c4:	7a4080e7          	jalr	1956(ra) # 80001864 <_ZN7AVLTree6removeEPS_S0_>
    800020c8:	00aabc23          	sd	a0,24(s5)
        cur->sz += aft->sz + HEADER_SIZE;
    800020cc:	0304b783          	ld	a5,48(s1)
    800020d0:	03093703          	ld	a4,48(s2)
    800020d4:	00e787b3          	add	a5,a5,a4
    800020d8:	04078793          	addi	a5,a5,64
    800020dc:	02f93823          	sd	a5,48(s2)
        toSwap = aft;
    800020e0:	0080006f          	j	800020e8 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    AVLTree* toSwap = nullptr;
    800020e4:	00000a13          	li	s4,0
    }

    AVLTree* prev = MemoryAllocator::first;
    800020e8:	00003497          	auipc	s1,0x3
    800020ec:	6f84b483          	ld	s1,1784(s1) # 800057e0 <_ZN15MemoryAllocator5firstE>
    800020f0:	0080006f          	j	800020f8 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    for(;prev && prev->next && ((uint64)prev->next + prev->next->sz + HEADER_SIZE < (uint64)cur); prev = prev->next);
    800020f4:	00070493          	mv	s1,a4
    800020f8:	00048e63          	beqz	s1,80002114 <_ZN15MemoryAllocator8mem_freeEPv+0x108>
    800020fc:	0204b703          	ld	a4,32(s1)
    80002100:	00070a63          	beqz	a4,80002114 <_ZN15MemoryAllocator8mem_freeEPv+0x108>
    80002104:	03073783          	ld	a5,48(a4)
    80002108:	00f707b3          	add	a5,a4,a5
    8000210c:	04078793          	addi	a5,a5,64
    80002110:	ff27e2e3          	bltu	a5,s2,800020f4 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>

    if (prev && (uint64)prev + prev->sz + HEADER_SIZE == (uint64)cur) {
    80002114:	00048a63          	beqz	s1,80002128 <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
    80002118:	0304b783          	ld	a5,48(s1)
    8000211c:	00f487b3          	add	a5,s1,a5
    80002120:	04078793          	addi	a5,a5,64
    80002124:	06f90663          	beq	s2,a5,80002190 <_ZN15MemoryAllocator8mem_freeEPv+0x184>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
        toSwap = (toSwap) ? toSwap : prev;
        cur = prev;
    }

    MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, cur);
    80002128:	00003497          	auipc	s1,0x3
    8000212c:	69848493          	addi	s1,s1,1688 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80002130:	00098593          	mv	a1,s3
    80002134:	0184b503          	ld	a0,24(s1)
    80002138:	fffff097          	auipc	ra,0xfffff
    8000213c:	698080e7          	jalr	1688(ra) # 800017d0 <_ZN7AVLTree6insertEPS_S0_>
    80002140:	00a4bc23          	sd	a0,24(s1)
    MemoryAllocator::first = (toSwap) ? AVLTree::swapLL(toSwap, cur, MemoryAllocator::first) :
    80002144:	0c0a0263          	beqz	s4,80002208 <_ZN15MemoryAllocator8mem_freeEPv+0x1fc>
    80002148:	00003617          	auipc	a2,0x3
    8000214c:	69863603          	ld	a2,1688(a2) # 800057e0 <_ZN15MemoryAllocator5firstE>
    80002150:	00098593          	mv	a1,s3
    80002154:	000a0513          	mv	a0,s4
    80002158:	00000097          	auipc	ra,0x0
    8000215c:	920080e7          	jalr	-1760(ra) # 80001a78 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    80002160:	00003797          	auipc	a5,0x3
    80002164:	68a7b023          	sd	a0,1664(a5) # 800057e0 <_ZN15MemoryAllocator5firstE>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    return 0;
    80002168:	00000513          	li	a0,0
}
    8000216c:	03813083          	ld	ra,56(sp)
    80002170:	03013403          	ld	s0,48(sp)
    80002174:	02813483          	ld	s1,40(sp)
    80002178:	02013903          	ld	s2,32(sp)
    8000217c:	01813983          	ld	s3,24(sp)
    80002180:	01013a03          	ld	s4,16(sp)
    80002184:	00813a83          	ld	s5,8(sp)
    80002188:	04010113          	addi	sp,sp,64
    8000218c:	00008067          	ret
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, prev);
    80002190:	00003997          	auipc	s3,0x3
    80002194:	63098993          	addi	s3,s3,1584 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    80002198:	00048593          	mv	a1,s1
    8000219c:	0189b503          	ld	a0,24(s3)
    800021a0:	fffff097          	auipc	ra,0xfffff
    800021a4:	6c4080e7          	jalr	1732(ra) # 80001864 <_ZN7AVLTree6removeEPS_S0_>
    800021a8:	00a9bc23          	sd	a0,24(s3)
        prev->sz += cur->sz + HEADER_SIZE;
    800021ac:	03093783          	ld	a5,48(s2)
    800021b0:	0304b703          	ld	a4,48(s1)
    800021b4:	00e787b3          	add	a5,a5,a4
    800021b8:	04078793          	addi	a5,a5,64
    800021bc:	02f4b823          	sd	a5,48(s1)
        prev->isFree = true;
    800021c0:	00100793          	li	a5,1
    800021c4:	02f48e23          	sb	a5,60(s1)
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    800021c8:	020a0663          	beqz	s4,800021f4 <_ZN15MemoryAllocator8mem_freeEPv+0x1e8>
    800021cc:	00048513          	mv	a0,s1
    800021d0:	00003917          	auipc	s2,0x3
    800021d4:	5f090913          	addi	s2,s2,1520 # 800057c0 <_ZN15MemoryAllocator11initialisedE>
    800021d8:	02093583          	ld	a1,32(s2)
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	90c080e7          	jalr	-1780(ra) # 80001ae8 <_ZN7AVLTree8removeLLEPS_S0_>
    800021e4:	02a93023          	sd	a0,32(s2)
        toSwap = (toSwap) ? toSwap : prev;
    800021e8:	000a0a63          	beqz	s4,800021fc <_ZN15MemoryAllocator8mem_freeEPv+0x1f0>
        cur = prev;
    800021ec:	00048993          	mv	s3,s1
    800021f0:	f39ff06f          	j	80002128 <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    800021f4:	000a0513          	mv	a0,s4
    800021f8:	fd9ff06f          	j	800021d0 <_ZN15MemoryAllocator8mem_freeEPv+0x1c4>
        toSwap = (toSwap) ? toSwap : prev;
    800021fc:	00048a13          	mv	s4,s1
        cur = prev;
    80002200:	00048993          	mv	s3,s1
    80002204:	f25ff06f          	j	80002128 <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    80002208:	00003597          	auipc	a1,0x3
    8000220c:	5d85b583          	ld	a1,1496(a1) # 800057e0 <_ZN15MemoryAllocator5firstE>
    80002210:	00098513          	mv	a0,s3
    80002214:	00000097          	auipc	ra,0x0
    80002218:	95c080e7          	jalr	-1700(ra) # 80001b70 <_ZN7AVLTree8insertLLEPS_S0_>
    8000221c:	f45ff06f          	j	80002160 <_ZN15MemoryAllocator8mem_freeEPv+0x154>
    if (!ptr) return -1;
    80002220:	fff00513          	li	a0,-1
    80002224:	00008067          	ret
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesnt point to beginning of block (its faulty)
    80002228:	ffe00513          	li	a0,-2
    8000222c:	00008067          	ret
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    80002230:	ffd00513          	li	a0,-3
    80002234:	00008067          	ret
    80002238:	ffd00513          	li	a0,-3
}
    8000223c:	00008067          	ret

0000000080002240 <start>:
    80002240:	ff010113          	addi	sp,sp,-16
    80002244:	00813423          	sd	s0,8(sp)
    80002248:	01010413          	addi	s0,sp,16
    8000224c:	300027f3          	csrr	a5,mstatus
    80002250:	ffffe737          	lui	a4,0xffffe
    80002254:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7daf>
    80002258:	00e7f7b3          	and	a5,a5,a4
    8000225c:	00001737          	lui	a4,0x1
    80002260:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002264:	00e7e7b3          	or	a5,a5,a4
    80002268:	30079073          	csrw	mstatus,a5
    8000226c:	00000797          	auipc	a5,0x0
    80002270:	16078793          	addi	a5,a5,352 # 800023cc <system_main>
    80002274:	34179073          	csrw	mepc,a5
    80002278:	00000793          	li	a5,0
    8000227c:	18079073          	csrw	satp,a5
    80002280:	000107b7          	lui	a5,0x10
    80002284:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002288:	30279073          	csrw	medeleg,a5
    8000228c:	30379073          	csrw	mideleg,a5
    80002290:	104027f3          	csrr	a5,sie
    80002294:	2227e793          	ori	a5,a5,546
    80002298:	10479073          	csrw	sie,a5
    8000229c:	fff00793          	li	a5,-1
    800022a0:	00a7d793          	srli	a5,a5,0xa
    800022a4:	3b079073          	csrw	pmpaddr0,a5
    800022a8:	00f00793          	li	a5,15
    800022ac:	3a079073          	csrw	pmpcfg0,a5
    800022b0:	f14027f3          	csrr	a5,mhartid
    800022b4:	0200c737          	lui	a4,0x200c
    800022b8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800022bc:	0007869b          	sext.w	a3,a5
    800022c0:	00269713          	slli	a4,a3,0x2
    800022c4:	000f4637          	lui	a2,0xf4
    800022c8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800022cc:	00d70733          	add	a4,a4,a3
    800022d0:	0037979b          	slliw	a5,a5,0x3
    800022d4:	020046b7          	lui	a3,0x2004
    800022d8:	00d787b3          	add	a5,a5,a3
    800022dc:	00c585b3          	add	a1,a1,a2
    800022e0:	00371693          	slli	a3,a4,0x3
    800022e4:	00003717          	auipc	a4,0x3
    800022e8:	50c70713          	addi	a4,a4,1292 # 800057f0 <timer_scratch>
    800022ec:	00b7b023          	sd	a1,0(a5)
    800022f0:	00d70733          	add	a4,a4,a3
    800022f4:	00f73c23          	sd	a5,24(a4)
    800022f8:	02c73023          	sd	a2,32(a4)
    800022fc:	34071073          	csrw	mscratch,a4
    80002300:	00000797          	auipc	a5,0x0
    80002304:	6e078793          	addi	a5,a5,1760 # 800029e0 <timervec>
    80002308:	30579073          	csrw	mtvec,a5
    8000230c:	300027f3          	csrr	a5,mstatus
    80002310:	0087e793          	ori	a5,a5,8
    80002314:	30079073          	csrw	mstatus,a5
    80002318:	304027f3          	csrr	a5,mie
    8000231c:	0807e793          	ori	a5,a5,128
    80002320:	30479073          	csrw	mie,a5
    80002324:	f14027f3          	csrr	a5,mhartid
    80002328:	0007879b          	sext.w	a5,a5
    8000232c:	00078213          	mv	tp,a5
    80002330:	30200073          	mret
    80002334:	00813403          	ld	s0,8(sp)
    80002338:	01010113          	addi	sp,sp,16
    8000233c:	00008067          	ret

0000000080002340 <timerinit>:
    80002340:	ff010113          	addi	sp,sp,-16
    80002344:	00813423          	sd	s0,8(sp)
    80002348:	01010413          	addi	s0,sp,16
    8000234c:	f14027f3          	csrr	a5,mhartid
    80002350:	0200c737          	lui	a4,0x200c
    80002354:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002358:	0007869b          	sext.w	a3,a5
    8000235c:	00269713          	slli	a4,a3,0x2
    80002360:	000f4637          	lui	a2,0xf4
    80002364:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002368:	00d70733          	add	a4,a4,a3
    8000236c:	0037979b          	slliw	a5,a5,0x3
    80002370:	020046b7          	lui	a3,0x2004
    80002374:	00d787b3          	add	a5,a5,a3
    80002378:	00c585b3          	add	a1,a1,a2
    8000237c:	00371693          	slli	a3,a4,0x3
    80002380:	00003717          	auipc	a4,0x3
    80002384:	47070713          	addi	a4,a4,1136 # 800057f0 <timer_scratch>
    80002388:	00b7b023          	sd	a1,0(a5)
    8000238c:	00d70733          	add	a4,a4,a3
    80002390:	00f73c23          	sd	a5,24(a4)
    80002394:	02c73023          	sd	a2,32(a4)
    80002398:	34071073          	csrw	mscratch,a4
    8000239c:	00000797          	auipc	a5,0x0
    800023a0:	64478793          	addi	a5,a5,1604 # 800029e0 <timervec>
    800023a4:	30579073          	csrw	mtvec,a5
    800023a8:	300027f3          	csrr	a5,mstatus
    800023ac:	0087e793          	ori	a5,a5,8
    800023b0:	30079073          	csrw	mstatus,a5
    800023b4:	304027f3          	csrr	a5,mie
    800023b8:	0807e793          	ori	a5,a5,128
    800023bc:	30479073          	csrw	mie,a5
    800023c0:	00813403          	ld	s0,8(sp)
    800023c4:	01010113          	addi	sp,sp,16
    800023c8:	00008067          	ret

00000000800023cc <system_main>:
    800023cc:	fe010113          	addi	sp,sp,-32
    800023d0:	00813823          	sd	s0,16(sp)
    800023d4:	00913423          	sd	s1,8(sp)
    800023d8:	00113c23          	sd	ra,24(sp)
    800023dc:	02010413          	addi	s0,sp,32
    800023e0:	00000097          	auipc	ra,0x0
    800023e4:	0c4080e7          	jalr	196(ra) # 800024a4 <cpuid>
    800023e8:	00003497          	auipc	s1,0x3
    800023ec:	3a848493          	addi	s1,s1,936 # 80005790 <started>
    800023f0:	02050263          	beqz	a0,80002414 <system_main+0x48>
    800023f4:	0004a783          	lw	a5,0(s1)
    800023f8:	0007879b          	sext.w	a5,a5
    800023fc:	fe078ce3          	beqz	a5,800023f4 <system_main+0x28>
    80002400:	0ff0000f          	fence
    80002404:	00003517          	auipc	a0,0x3
    80002408:	c5450513          	addi	a0,a0,-940 # 80005058 <_ZN15MemoryAllocator11HEADER_SIZEE+0x38>
    8000240c:	00001097          	auipc	ra,0x1
    80002410:	a70080e7          	jalr	-1424(ra) # 80002e7c <panic>
    80002414:	00001097          	auipc	ra,0x1
    80002418:	9c4080e7          	jalr	-1596(ra) # 80002dd8 <consoleinit>
    8000241c:	00001097          	auipc	ra,0x1
    80002420:	150080e7          	jalr	336(ra) # 8000356c <printfinit>
    80002424:	00003517          	auipc	a0,0x3
    80002428:	d1450513          	addi	a0,a0,-748 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    8000242c:	00001097          	auipc	ra,0x1
    80002430:	aac080e7          	jalr	-1364(ra) # 80002ed8 <__printf>
    80002434:	00003517          	auipc	a0,0x3
    80002438:	bf450513          	addi	a0,a0,-1036 # 80005028 <_ZN15MemoryAllocator11HEADER_SIZEE+0x8>
    8000243c:	00001097          	auipc	ra,0x1
    80002440:	a9c080e7          	jalr	-1380(ra) # 80002ed8 <__printf>
    80002444:	00003517          	auipc	a0,0x3
    80002448:	cf450513          	addi	a0,a0,-780 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    8000244c:	00001097          	auipc	ra,0x1
    80002450:	a8c080e7          	jalr	-1396(ra) # 80002ed8 <__printf>
    80002454:	00001097          	auipc	ra,0x1
    80002458:	4a4080e7          	jalr	1188(ra) # 800038f8 <kinit>
    8000245c:	00000097          	auipc	ra,0x0
    80002460:	148080e7          	jalr	328(ra) # 800025a4 <trapinit>
    80002464:	00000097          	auipc	ra,0x0
    80002468:	16c080e7          	jalr	364(ra) # 800025d0 <trapinithart>
    8000246c:	00000097          	auipc	ra,0x0
    80002470:	5b4080e7          	jalr	1460(ra) # 80002a20 <plicinit>
    80002474:	00000097          	auipc	ra,0x0
    80002478:	5d4080e7          	jalr	1492(ra) # 80002a48 <plicinithart>
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	078080e7          	jalr	120(ra) # 800024f4 <userinit>
    80002484:	0ff0000f          	fence
    80002488:	00100793          	li	a5,1
    8000248c:	00003517          	auipc	a0,0x3
    80002490:	bb450513          	addi	a0,a0,-1100 # 80005040 <_ZN15MemoryAllocator11HEADER_SIZEE+0x20>
    80002494:	00f4a023          	sw	a5,0(s1)
    80002498:	00001097          	auipc	ra,0x1
    8000249c:	a40080e7          	jalr	-1472(ra) # 80002ed8 <__printf>
    800024a0:	0000006f          	j	800024a0 <system_main+0xd4>

00000000800024a4 <cpuid>:
    800024a4:	ff010113          	addi	sp,sp,-16
    800024a8:	00813423          	sd	s0,8(sp)
    800024ac:	01010413          	addi	s0,sp,16
    800024b0:	00020513          	mv	a0,tp
    800024b4:	00813403          	ld	s0,8(sp)
    800024b8:	0005051b          	sext.w	a0,a0
    800024bc:	01010113          	addi	sp,sp,16
    800024c0:	00008067          	ret

00000000800024c4 <mycpu>:
    800024c4:	ff010113          	addi	sp,sp,-16
    800024c8:	00813423          	sd	s0,8(sp)
    800024cc:	01010413          	addi	s0,sp,16
    800024d0:	00020793          	mv	a5,tp
    800024d4:	00813403          	ld	s0,8(sp)
    800024d8:	0007879b          	sext.w	a5,a5
    800024dc:	00779793          	slli	a5,a5,0x7
    800024e0:	00004517          	auipc	a0,0x4
    800024e4:	34050513          	addi	a0,a0,832 # 80006820 <cpus>
    800024e8:	00f50533          	add	a0,a0,a5
    800024ec:	01010113          	addi	sp,sp,16
    800024f0:	00008067          	ret

00000000800024f4 <userinit>:
    800024f4:	ff010113          	addi	sp,sp,-16
    800024f8:	00813423          	sd	s0,8(sp)
    800024fc:	01010413          	addi	s0,sp,16
    80002500:	00813403          	ld	s0,8(sp)
    80002504:	01010113          	addi	sp,sp,16
    80002508:	fffff317          	auipc	t1,0xfffff
    8000250c:	6f430067          	jr	1780(t1) # 80001bfc <main>

0000000080002510 <either_copyout>:
    80002510:	ff010113          	addi	sp,sp,-16
    80002514:	00813023          	sd	s0,0(sp)
    80002518:	00113423          	sd	ra,8(sp)
    8000251c:	01010413          	addi	s0,sp,16
    80002520:	02051663          	bnez	a0,8000254c <either_copyout+0x3c>
    80002524:	00058513          	mv	a0,a1
    80002528:	00060593          	mv	a1,a2
    8000252c:	0006861b          	sext.w	a2,a3
    80002530:	00002097          	auipc	ra,0x2
    80002534:	c54080e7          	jalr	-940(ra) # 80004184 <__memmove>
    80002538:	00813083          	ld	ra,8(sp)
    8000253c:	00013403          	ld	s0,0(sp)
    80002540:	00000513          	li	a0,0
    80002544:	01010113          	addi	sp,sp,16
    80002548:	00008067          	ret
    8000254c:	00003517          	auipc	a0,0x3
    80002550:	b3450513          	addi	a0,a0,-1228 # 80005080 <_ZN15MemoryAllocator11HEADER_SIZEE+0x60>
    80002554:	00001097          	auipc	ra,0x1
    80002558:	928080e7          	jalr	-1752(ra) # 80002e7c <panic>

000000008000255c <either_copyin>:
    8000255c:	ff010113          	addi	sp,sp,-16
    80002560:	00813023          	sd	s0,0(sp)
    80002564:	00113423          	sd	ra,8(sp)
    80002568:	01010413          	addi	s0,sp,16
    8000256c:	02059463          	bnez	a1,80002594 <either_copyin+0x38>
    80002570:	00060593          	mv	a1,a2
    80002574:	0006861b          	sext.w	a2,a3
    80002578:	00002097          	auipc	ra,0x2
    8000257c:	c0c080e7          	jalr	-1012(ra) # 80004184 <__memmove>
    80002580:	00813083          	ld	ra,8(sp)
    80002584:	00013403          	ld	s0,0(sp)
    80002588:	00000513          	li	a0,0
    8000258c:	01010113          	addi	sp,sp,16
    80002590:	00008067          	ret
    80002594:	00003517          	auipc	a0,0x3
    80002598:	b1450513          	addi	a0,a0,-1260 # 800050a8 <_ZN15MemoryAllocator11HEADER_SIZEE+0x88>
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	8e0080e7          	jalr	-1824(ra) # 80002e7c <panic>

00000000800025a4 <trapinit>:
    800025a4:	ff010113          	addi	sp,sp,-16
    800025a8:	00813423          	sd	s0,8(sp)
    800025ac:	01010413          	addi	s0,sp,16
    800025b0:	00813403          	ld	s0,8(sp)
    800025b4:	00003597          	auipc	a1,0x3
    800025b8:	b1c58593          	addi	a1,a1,-1252 # 800050d0 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb0>
    800025bc:	00004517          	auipc	a0,0x4
    800025c0:	2e450513          	addi	a0,a0,740 # 800068a0 <tickslock>
    800025c4:	01010113          	addi	sp,sp,16
    800025c8:	00001317          	auipc	t1,0x1
    800025cc:	5c030067          	jr	1472(t1) # 80003b88 <initlock>

00000000800025d0 <trapinithart>:
    800025d0:	ff010113          	addi	sp,sp,-16
    800025d4:	00813423          	sd	s0,8(sp)
    800025d8:	01010413          	addi	s0,sp,16
    800025dc:	00000797          	auipc	a5,0x0
    800025e0:	2f478793          	addi	a5,a5,756 # 800028d0 <kernelvec>
    800025e4:	10579073          	csrw	stvec,a5
    800025e8:	00813403          	ld	s0,8(sp)
    800025ec:	01010113          	addi	sp,sp,16
    800025f0:	00008067          	ret

00000000800025f4 <usertrap>:
    800025f4:	ff010113          	addi	sp,sp,-16
    800025f8:	00813423          	sd	s0,8(sp)
    800025fc:	01010413          	addi	s0,sp,16
    80002600:	00813403          	ld	s0,8(sp)
    80002604:	01010113          	addi	sp,sp,16
    80002608:	00008067          	ret

000000008000260c <usertrapret>:
    8000260c:	ff010113          	addi	sp,sp,-16
    80002610:	00813423          	sd	s0,8(sp)
    80002614:	01010413          	addi	s0,sp,16
    80002618:	00813403          	ld	s0,8(sp)
    8000261c:	01010113          	addi	sp,sp,16
    80002620:	00008067          	ret

0000000080002624 <kerneltrap>:
    80002624:	fe010113          	addi	sp,sp,-32
    80002628:	00813823          	sd	s0,16(sp)
    8000262c:	00113c23          	sd	ra,24(sp)
    80002630:	00913423          	sd	s1,8(sp)
    80002634:	02010413          	addi	s0,sp,32
    80002638:	142025f3          	csrr	a1,scause
    8000263c:	100027f3          	csrr	a5,sstatus
    80002640:	0027f793          	andi	a5,a5,2
    80002644:	10079c63          	bnez	a5,8000275c <kerneltrap+0x138>
    80002648:	142027f3          	csrr	a5,scause
    8000264c:	0207ce63          	bltz	a5,80002688 <kerneltrap+0x64>
    80002650:	00003517          	auipc	a0,0x3
    80002654:	ac850513          	addi	a0,a0,-1336 # 80005118 <_ZN15MemoryAllocator11HEADER_SIZEE+0xf8>
    80002658:	00001097          	auipc	ra,0x1
    8000265c:	880080e7          	jalr	-1920(ra) # 80002ed8 <__printf>
    80002660:	141025f3          	csrr	a1,sepc
    80002664:	14302673          	csrr	a2,stval
    80002668:	00003517          	auipc	a0,0x3
    8000266c:	ac050513          	addi	a0,a0,-1344 # 80005128 <_ZN15MemoryAllocator11HEADER_SIZEE+0x108>
    80002670:	00001097          	auipc	ra,0x1
    80002674:	868080e7          	jalr	-1944(ra) # 80002ed8 <__printf>
    80002678:	00003517          	auipc	a0,0x3
    8000267c:	ac850513          	addi	a0,a0,-1336 # 80005140 <_ZN15MemoryAllocator11HEADER_SIZEE+0x120>
    80002680:	00000097          	auipc	ra,0x0
    80002684:	7fc080e7          	jalr	2044(ra) # 80002e7c <panic>
    80002688:	0ff7f713          	andi	a4,a5,255
    8000268c:	00900693          	li	a3,9
    80002690:	04d70063          	beq	a4,a3,800026d0 <kerneltrap+0xac>
    80002694:	fff00713          	li	a4,-1
    80002698:	03f71713          	slli	a4,a4,0x3f
    8000269c:	00170713          	addi	a4,a4,1
    800026a0:	fae798e3          	bne	a5,a4,80002650 <kerneltrap+0x2c>
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	e00080e7          	jalr	-512(ra) # 800024a4 <cpuid>
    800026ac:	06050663          	beqz	a0,80002718 <kerneltrap+0xf4>
    800026b0:	144027f3          	csrr	a5,sip
    800026b4:	ffd7f793          	andi	a5,a5,-3
    800026b8:	14479073          	csrw	sip,a5
    800026bc:	01813083          	ld	ra,24(sp)
    800026c0:	01013403          	ld	s0,16(sp)
    800026c4:	00813483          	ld	s1,8(sp)
    800026c8:	02010113          	addi	sp,sp,32
    800026cc:	00008067          	ret
    800026d0:	00000097          	auipc	ra,0x0
    800026d4:	3c4080e7          	jalr	964(ra) # 80002a94 <plic_claim>
    800026d8:	00a00793          	li	a5,10
    800026dc:	00050493          	mv	s1,a0
    800026e0:	06f50863          	beq	a0,a5,80002750 <kerneltrap+0x12c>
    800026e4:	fc050ce3          	beqz	a0,800026bc <kerneltrap+0x98>
    800026e8:	00050593          	mv	a1,a0
    800026ec:	00003517          	auipc	a0,0x3
    800026f0:	a0c50513          	addi	a0,a0,-1524 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    800026f4:	00000097          	auipc	ra,0x0
    800026f8:	7e4080e7          	jalr	2020(ra) # 80002ed8 <__printf>
    800026fc:	01013403          	ld	s0,16(sp)
    80002700:	01813083          	ld	ra,24(sp)
    80002704:	00048513          	mv	a0,s1
    80002708:	00813483          	ld	s1,8(sp)
    8000270c:	02010113          	addi	sp,sp,32
    80002710:	00000317          	auipc	t1,0x0
    80002714:	3bc30067          	jr	956(t1) # 80002acc <plic_complete>
    80002718:	00004517          	auipc	a0,0x4
    8000271c:	18850513          	addi	a0,a0,392 # 800068a0 <tickslock>
    80002720:	00001097          	auipc	ra,0x1
    80002724:	48c080e7          	jalr	1164(ra) # 80003bac <acquire>
    80002728:	00003717          	auipc	a4,0x3
    8000272c:	06c70713          	addi	a4,a4,108 # 80005794 <ticks>
    80002730:	00072783          	lw	a5,0(a4)
    80002734:	00004517          	auipc	a0,0x4
    80002738:	16c50513          	addi	a0,a0,364 # 800068a0 <tickslock>
    8000273c:	0017879b          	addiw	a5,a5,1
    80002740:	00f72023          	sw	a5,0(a4)
    80002744:	00001097          	auipc	ra,0x1
    80002748:	534080e7          	jalr	1332(ra) # 80003c78 <release>
    8000274c:	f65ff06f          	j	800026b0 <kerneltrap+0x8c>
    80002750:	00001097          	auipc	ra,0x1
    80002754:	090080e7          	jalr	144(ra) # 800037e0 <uartintr>
    80002758:	fa5ff06f          	j	800026fc <kerneltrap+0xd8>
    8000275c:	00003517          	auipc	a0,0x3
    80002760:	97c50513          	addi	a0,a0,-1668 # 800050d8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb8>
    80002764:	00000097          	auipc	ra,0x0
    80002768:	718080e7          	jalr	1816(ra) # 80002e7c <panic>

000000008000276c <clockintr>:
    8000276c:	fe010113          	addi	sp,sp,-32
    80002770:	00813823          	sd	s0,16(sp)
    80002774:	00913423          	sd	s1,8(sp)
    80002778:	00113c23          	sd	ra,24(sp)
    8000277c:	02010413          	addi	s0,sp,32
    80002780:	00004497          	auipc	s1,0x4
    80002784:	12048493          	addi	s1,s1,288 # 800068a0 <tickslock>
    80002788:	00048513          	mv	a0,s1
    8000278c:	00001097          	auipc	ra,0x1
    80002790:	420080e7          	jalr	1056(ra) # 80003bac <acquire>
    80002794:	00003717          	auipc	a4,0x3
    80002798:	00070713          	mv	a4,a4
    8000279c:	00072783          	lw	a5,0(a4) # 80005794 <ticks>
    800027a0:	01013403          	ld	s0,16(sp)
    800027a4:	01813083          	ld	ra,24(sp)
    800027a8:	00048513          	mv	a0,s1
    800027ac:	0017879b          	addiw	a5,a5,1
    800027b0:	00813483          	ld	s1,8(sp)
    800027b4:	00f72023          	sw	a5,0(a4)
    800027b8:	02010113          	addi	sp,sp,32
    800027bc:	00001317          	auipc	t1,0x1
    800027c0:	4bc30067          	jr	1212(t1) # 80003c78 <release>

00000000800027c4 <devintr>:
    800027c4:	142027f3          	csrr	a5,scause
    800027c8:	00000513          	li	a0,0
    800027cc:	0007c463          	bltz	a5,800027d4 <devintr+0x10>
    800027d0:	00008067          	ret
    800027d4:	fe010113          	addi	sp,sp,-32
    800027d8:	00813823          	sd	s0,16(sp)
    800027dc:	00113c23          	sd	ra,24(sp)
    800027e0:	00913423          	sd	s1,8(sp)
    800027e4:	02010413          	addi	s0,sp,32
    800027e8:	0ff7f713          	andi	a4,a5,255
    800027ec:	00900693          	li	a3,9
    800027f0:	04d70c63          	beq	a4,a3,80002848 <devintr+0x84>
    800027f4:	fff00713          	li	a4,-1
    800027f8:	03f71713          	slli	a4,a4,0x3f
    800027fc:	00170713          	addi	a4,a4,1
    80002800:	00e78c63          	beq	a5,a4,80002818 <devintr+0x54>
    80002804:	01813083          	ld	ra,24(sp)
    80002808:	01013403          	ld	s0,16(sp)
    8000280c:	00813483          	ld	s1,8(sp)
    80002810:	02010113          	addi	sp,sp,32
    80002814:	00008067          	ret
    80002818:	00000097          	auipc	ra,0x0
    8000281c:	c8c080e7          	jalr	-884(ra) # 800024a4 <cpuid>
    80002820:	06050663          	beqz	a0,8000288c <devintr+0xc8>
    80002824:	144027f3          	csrr	a5,sip
    80002828:	ffd7f793          	andi	a5,a5,-3
    8000282c:	14479073          	csrw	sip,a5
    80002830:	01813083          	ld	ra,24(sp)
    80002834:	01013403          	ld	s0,16(sp)
    80002838:	00813483          	ld	s1,8(sp)
    8000283c:	00200513          	li	a0,2
    80002840:	02010113          	addi	sp,sp,32
    80002844:	00008067          	ret
    80002848:	00000097          	auipc	ra,0x0
    8000284c:	24c080e7          	jalr	588(ra) # 80002a94 <plic_claim>
    80002850:	00a00793          	li	a5,10
    80002854:	00050493          	mv	s1,a0
    80002858:	06f50663          	beq	a0,a5,800028c4 <devintr+0x100>
    8000285c:	00100513          	li	a0,1
    80002860:	fa0482e3          	beqz	s1,80002804 <devintr+0x40>
    80002864:	00048593          	mv	a1,s1
    80002868:	00003517          	auipc	a0,0x3
    8000286c:	89050513          	addi	a0,a0,-1904 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    80002870:	00000097          	auipc	ra,0x0
    80002874:	668080e7          	jalr	1640(ra) # 80002ed8 <__printf>
    80002878:	00048513          	mv	a0,s1
    8000287c:	00000097          	auipc	ra,0x0
    80002880:	250080e7          	jalr	592(ra) # 80002acc <plic_complete>
    80002884:	00100513          	li	a0,1
    80002888:	f7dff06f          	j	80002804 <devintr+0x40>
    8000288c:	00004517          	auipc	a0,0x4
    80002890:	01450513          	addi	a0,a0,20 # 800068a0 <tickslock>
    80002894:	00001097          	auipc	ra,0x1
    80002898:	318080e7          	jalr	792(ra) # 80003bac <acquire>
    8000289c:	00003717          	auipc	a4,0x3
    800028a0:	ef870713          	addi	a4,a4,-264 # 80005794 <ticks>
    800028a4:	00072783          	lw	a5,0(a4)
    800028a8:	00004517          	auipc	a0,0x4
    800028ac:	ff850513          	addi	a0,a0,-8 # 800068a0 <tickslock>
    800028b0:	0017879b          	addiw	a5,a5,1
    800028b4:	00f72023          	sw	a5,0(a4)
    800028b8:	00001097          	auipc	ra,0x1
    800028bc:	3c0080e7          	jalr	960(ra) # 80003c78 <release>
    800028c0:	f65ff06f          	j	80002824 <devintr+0x60>
    800028c4:	00001097          	auipc	ra,0x1
    800028c8:	f1c080e7          	jalr	-228(ra) # 800037e0 <uartintr>
    800028cc:	fadff06f          	j	80002878 <devintr+0xb4>

00000000800028d0 <kernelvec>:
    800028d0:	f0010113          	addi	sp,sp,-256
    800028d4:	00113023          	sd	ra,0(sp)
    800028d8:	00213423          	sd	sp,8(sp)
    800028dc:	00313823          	sd	gp,16(sp)
    800028e0:	00413c23          	sd	tp,24(sp)
    800028e4:	02513023          	sd	t0,32(sp)
    800028e8:	02613423          	sd	t1,40(sp)
    800028ec:	02713823          	sd	t2,48(sp)
    800028f0:	02813c23          	sd	s0,56(sp)
    800028f4:	04913023          	sd	s1,64(sp)
    800028f8:	04a13423          	sd	a0,72(sp)
    800028fc:	04b13823          	sd	a1,80(sp)
    80002900:	04c13c23          	sd	a2,88(sp)
    80002904:	06d13023          	sd	a3,96(sp)
    80002908:	06e13423          	sd	a4,104(sp)
    8000290c:	06f13823          	sd	a5,112(sp)
    80002910:	07013c23          	sd	a6,120(sp)
    80002914:	09113023          	sd	a7,128(sp)
    80002918:	09213423          	sd	s2,136(sp)
    8000291c:	09313823          	sd	s3,144(sp)
    80002920:	09413c23          	sd	s4,152(sp)
    80002924:	0b513023          	sd	s5,160(sp)
    80002928:	0b613423          	sd	s6,168(sp)
    8000292c:	0b713823          	sd	s7,176(sp)
    80002930:	0b813c23          	sd	s8,184(sp)
    80002934:	0d913023          	sd	s9,192(sp)
    80002938:	0da13423          	sd	s10,200(sp)
    8000293c:	0db13823          	sd	s11,208(sp)
    80002940:	0dc13c23          	sd	t3,216(sp)
    80002944:	0fd13023          	sd	t4,224(sp)
    80002948:	0fe13423          	sd	t5,232(sp)
    8000294c:	0ff13823          	sd	t6,240(sp)
    80002950:	cd5ff0ef          	jal	ra,80002624 <kerneltrap>
    80002954:	00013083          	ld	ra,0(sp)
    80002958:	00813103          	ld	sp,8(sp)
    8000295c:	01013183          	ld	gp,16(sp)
    80002960:	02013283          	ld	t0,32(sp)
    80002964:	02813303          	ld	t1,40(sp)
    80002968:	03013383          	ld	t2,48(sp)
    8000296c:	03813403          	ld	s0,56(sp)
    80002970:	04013483          	ld	s1,64(sp)
    80002974:	04813503          	ld	a0,72(sp)
    80002978:	05013583          	ld	a1,80(sp)
    8000297c:	05813603          	ld	a2,88(sp)
    80002980:	06013683          	ld	a3,96(sp)
    80002984:	06813703          	ld	a4,104(sp)
    80002988:	07013783          	ld	a5,112(sp)
    8000298c:	07813803          	ld	a6,120(sp)
    80002990:	08013883          	ld	a7,128(sp)
    80002994:	08813903          	ld	s2,136(sp)
    80002998:	09013983          	ld	s3,144(sp)
    8000299c:	09813a03          	ld	s4,152(sp)
    800029a0:	0a013a83          	ld	s5,160(sp)
    800029a4:	0a813b03          	ld	s6,168(sp)
    800029a8:	0b013b83          	ld	s7,176(sp)
    800029ac:	0b813c03          	ld	s8,184(sp)
    800029b0:	0c013c83          	ld	s9,192(sp)
    800029b4:	0c813d03          	ld	s10,200(sp)
    800029b8:	0d013d83          	ld	s11,208(sp)
    800029bc:	0d813e03          	ld	t3,216(sp)
    800029c0:	0e013e83          	ld	t4,224(sp)
    800029c4:	0e813f03          	ld	t5,232(sp)
    800029c8:	0f013f83          	ld	t6,240(sp)
    800029cc:	10010113          	addi	sp,sp,256
    800029d0:	10200073          	sret
    800029d4:	00000013          	nop
    800029d8:	00000013          	nop
    800029dc:	00000013          	nop

00000000800029e0 <timervec>:
    800029e0:	34051573          	csrrw	a0,mscratch,a0
    800029e4:	00b53023          	sd	a1,0(a0)
    800029e8:	00c53423          	sd	a2,8(a0)
    800029ec:	00d53823          	sd	a3,16(a0)
    800029f0:	01853583          	ld	a1,24(a0)
    800029f4:	02053603          	ld	a2,32(a0)
    800029f8:	0005b683          	ld	a3,0(a1)
    800029fc:	00c686b3          	add	a3,a3,a2
    80002a00:	00d5b023          	sd	a3,0(a1)
    80002a04:	00200593          	li	a1,2
    80002a08:	14459073          	csrw	sip,a1
    80002a0c:	01053683          	ld	a3,16(a0)
    80002a10:	00853603          	ld	a2,8(a0)
    80002a14:	00053583          	ld	a1,0(a0)
    80002a18:	34051573          	csrrw	a0,mscratch,a0
    80002a1c:	30200073          	mret

0000000080002a20 <plicinit>:
    80002a20:	ff010113          	addi	sp,sp,-16
    80002a24:	00813423          	sd	s0,8(sp)
    80002a28:	01010413          	addi	s0,sp,16
    80002a2c:	00813403          	ld	s0,8(sp)
    80002a30:	0c0007b7          	lui	a5,0xc000
    80002a34:	00100713          	li	a4,1
    80002a38:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002a3c:	00e7a223          	sw	a4,4(a5)
    80002a40:	01010113          	addi	sp,sp,16
    80002a44:	00008067          	ret

0000000080002a48 <plicinithart>:
    80002a48:	ff010113          	addi	sp,sp,-16
    80002a4c:	00813023          	sd	s0,0(sp)
    80002a50:	00113423          	sd	ra,8(sp)
    80002a54:	01010413          	addi	s0,sp,16
    80002a58:	00000097          	auipc	ra,0x0
    80002a5c:	a4c080e7          	jalr	-1460(ra) # 800024a4 <cpuid>
    80002a60:	0085171b          	slliw	a4,a0,0x8
    80002a64:	0c0027b7          	lui	a5,0xc002
    80002a68:	00e787b3          	add	a5,a5,a4
    80002a6c:	40200713          	li	a4,1026
    80002a70:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002a74:	00813083          	ld	ra,8(sp)
    80002a78:	00013403          	ld	s0,0(sp)
    80002a7c:	00d5151b          	slliw	a0,a0,0xd
    80002a80:	0c2017b7          	lui	a5,0xc201
    80002a84:	00a78533          	add	a0,a5,a0
    80002a88:	00052023          	sw	zero,0(a0)
    80002a8c:	01010113          	addi	sp,sp,16
    80002a90:	00008067          	ret

0000000080002a94 <plic_claim>:
    80002a94:	ff010113          	addi	sp,sp,-16
    80002a98:	00813023          	sd	s0,0(sp)
    80002a9c:	00113423          	sd	ra,8(sp)
    80002aa0:	01010413          	addi	s0,sp,16
    80002aa4:	00000097          	auipc	ra,0x0
    80002aa8:	a00080e7          	jalr	-1536(ra) # 800024a4 <cpuid>
    80002aac:	00813083          	ld	ra,8(sp)
    80002ab0:	00013403          	ld	s0,0(sp)
    80002ab4:	00d5151b          	slliw	a0,a0,0xd
    80002ab8:	0c2017b7          	lui	a5,0xc201
    80002abc:	00a78533          	add	a0,a5,a0
    80002ac0:	00452503          	lw	a0,4(a0)
    80002ac4:	01010113          	addi	sp,sp,16
    80002ac8:	00008067          	ret

0000000080002acc <plic_complete>:
    80002acc:	fe010113          	addi	sp,sp,-32
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	00113c23          	sd	ra,24(sp)
    80002adc:	02010413          	addi	s0,sp,32
    80002ae0:	00050493          	mv	s1,a0
    80002ae4:	00000097          	auipc	ra,0x0
    80002ae8:	9c0080e7          	jalr	-1600(ra) # 800024a4 <cpuid>
    80002aec:	01813083          	ld	ra,24(sp)
    80002af0:	01013403          	ld	s0,16(sp)
    80002af4:	00d5179b          	slliw	a5,a0,0xd
    80002af8:	0c201737          	lui	a4,0xc201
    80002afc:	00f707b3          	add	a5,a4,a5
    80002b00:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002b04:	00813483          	ld	s1,8(sp)
    80002b08:	02010113          	addi	sp,sp,32
    80002b0c:	00008067          	ret

0000000080002b10 <consolewrite>:
    80002b10:	fb010113          	addi	sp,sp,-80
    80002b14:	04813023          	sd	s0,64(sp)
    80002b18:	04113423          	sd	ra,72(sp)
    80002b1c:	02913c23          	sd	s1,56(sp)
    80002b20:	03213823          	sd	s2,48(sp)
    80002b24:	03313423          	sd	s3,40(sp)
    80002b28:	03413023          	sd	s4,32(sp)
    80002b2c:	01513c23          	sd	s5,24(sp)
    80002b30:	05010413          	addi	s0,sp,80
    80002b34:	06c05c63          	blez	a2,80002bac <consolewrite+0x9c>
    80002b38:	00060993          	mv	s3,a2
    80002b3c:	00050a13          	mv	s4,a0
    80002b40:	00058493          	mv	s1,a1
    80002b44:	00000913          	li	s2,0
    80002b48:	fff00a93          	li	s5,-1
    80002b4c:	01c0006f          	j	80002b68 <consolewrite+0x58>
    80002b50:	fbf44503          	lbu	a0,-65(s0)
    80002b54:	0019091b          	addiw	s2,s2,1
    80002b58:	00148493          	addi	s1,s1,1
    80002b5c:	00001097          	auipc	ra,0x1
    80002b60:	a9c080e7          	jalr	-1380(ra) # 800035f8 <uartputc>
    80002b64:	03298063          	beq	s3,s2,80002b84 <consolewrite+0x74>
    80002b68:	00048613          	mv	a2,s1
    80002b6c:	00100693          	li	a3,1
    80002b70:	000a0593          	mv	a1,s4
    80002b74:	fbf40513          	addi	a0,s0,-65
    80002b78:	00000097          	auipc	ra,0x0
    80002b7c:	9e4080e7          	jalr	-1564(ra) # 8000255c <either_copyin>
    80002b80:	fd5518e3          	bne	a0,s5,80002b50 <consolewrite+0x40>
    80002b84:	04813083          	ld	ra,72(sp)
    80002b88:	04013403          	ld	s0,64(sp)
    80002b8c:	03813483          	ld	s1,56(sp)
    80002b90:	02813983          	ld	s3,40(sp)
    80002b94:	02013a03          	ld	s4,32(sp)
    80002b98:	01813a83          	ld	s5,24(sp)
    80002b9c:	00090513          	mv	a0,s2
    80002ba0:	03013903          	ld	s2,48(sp)
    80002ba4:	05010113          	addi	sp,sp,80
    80002ba8:	00008067          	ret
    80002bac:	00000913          	li	s2,0
    80002bb0:	fd5ff06f          	j	80002b84 <consolewrite+0x74>

0000000080002bb4 <consoleread>:
    80002bb4:	f9010113          	addi	sp,sp,-112
    80002bb8:	06813023          	sd	s0,96(sp)
    80002bbc:	04913c23          	sd	s1,88(sp)
    80002bc0:	05213823          	sd	s2,80(sp)
    80002bc4:	05313423          	sd	s3,72(sp)
    80002bc8:	05413023          	sd	s4,64(sp)
    80002bcc:	03513c23          	sd	s5,56(sp)
    80002bd0:	03613823          	sd	s6,48(sp)
    80002bd4:	03713423          	sd	s7,40(sp)
    80002bd8:	03813023          	sd	s8,32(sp)
    80002bdc:	06113423          	sd	ra,104(sp)
    80002be0:	01913c23          	sd	s9,24(sp)
    80002be4:	07010413          	addi	s0,sp,112
    80002be8:	00060b93          	mv	s7,a2
    80002bec:	00050913          	mv	s2,a0
    80002bf0:	00058c13          	mv	s8,a1
    80002bf4:	00060b1b          	sext.w	s6,a2
    80002bf8:	00004497          	auipc	s1,0x4
    80002bfc:	cd048493          	addi	s1,s1,-816 # 800068c8 <cons>
    80002c00:	00400993          	li	s3,4
    80002c04:	fff00a13          	li	s4,-1
    80002c08:	00a00a93          	li	s5,10
    80002c0c:	05705e63          	blez	s7,80002c68 <consoleread+0xb4>
    80002c10:	09c4a703          	lw	a4,156(s1)
    80002c14:	0984a783          	lw	a5,152(s1)
    80002c18:	0007071b          	sext.w	a4,a4
    80002c1c:	08e78463          	beq	a5,a4,80002ca4 <consoleread+0xf0>
    80002c20:	07f7f713          	andi	a4,a5,127
    80002c24:	00e48733          	add	a4,s1,a4
    80002c28:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002c2c:	0017869b          	addiw	a3,a5,1
    80002c30:	08d4ac23          	sw	a3,152(s1)
    80002c34:	00070c9b          	sext.w	s9,a4
    80002c38:	0b370663          	beq	a4,s3,80002ce4 <consoleread+0x130>
    80002c3c:	00100693          	li	a3,1
    80002c40:	f9f40613          	addi	a2,s0,-97
    80002c44:	000c0593          	mv	a1,s8
    80002c48:	00090513          	mv	a0,s2
    80002c4c:	f8e40fa3          	sb	a4,-97(s0)
    80002c50:	00000097          	auipc	ra,0x0
    80002c54:	8c0080e7          	jalr	-1856(ra) # 80002510 <either_copyout>
    80002c58:	01450863          	beq	a0,s4,80002c68 <consoleread+0xb4>
    80002c5c:	001c0c13          	addi	s8,s8,1
    80002c60:	fffb8b9b          	addiw	s7,s7,-1
    80002c64:	fb5c94e3          	bne	s9,s5,80002c0c <consoleread+0x58>
    80002c68:	000b851b          	sext.w	a0,s7
    80002c6c:	06813083          	ld	ra,104(sp)
    80002c70:	06013403          	ld	s0,96(sp)
    80002c74:	05813483          	ld	s1,88(sp)
    80002c78:	05013903          	ld	s2,80(sp)
    80002c7c:	04813983          	ld	s3,72(sp)
    80002c80:	04013a03          	ld	s4,64(sp)
    80002c84:	03813a83          	ld	s5,56(sp)
    80002c88:	02813b83          	ld	s7,40(sp)
    80002c8c:	02013c03          	ld	s8,32(sp)
    80002c90:	01813c83          	ld	s9,24(sp)
    80002c94:	40ab053b          	subw	a0,s6,a0
    80002c98:	03013b03          	ld	s6,48(sp)
    80002c9c:	07010113          	addi	sp,sp,112
    80002ca0:	00008067          	ret
    80002ca4:	00001097          	auipc	ra,0x1
    80002ca8:	1d8080e7          	jalr	472(ra) # 80003e7c <push_on>
    80002cac:	0984a703          	lw	a4,152(s1)
    80002cb0:	09c4a783          	lw	a5,156(s1)
    80002cb4:	0007879b          	sext.w	a5,a5
    80002cb8:	fef70ce3          	beq	a4,a5,80002cb0 <consoleread+0xfc>
    80002cbc:	00001097          	auipc	ra,0x1
    80002cc0:	234080e7          	jalr	564(ra) # 80003ef0 <pop_on>
    80002cc4:	0984a783          	lw	a5,152(s1)
    80002cc8:	07f7f713          	andi	a4,a5,127
    80002ccc:	00e48733          	add	a4,s1,a4
    80002cd0:	01874703          	lbu	a4,24(a4)
    80002cd4:	0017869b          	addiw	a3,a5,1
    80002cd8:	08d4ac23          	sw	a3,152(s1)
    80002cdc:	00070c9b          	sext.w	s9,a4
    80002ce0:	f5371ee3          	bne	a4,s3,80002c3c <consoleread+0x88>
    80002ce4:	000b851b          	sext.w	a0,s7
    80002ce8:	f96bf2e3          	bgeu	s7,s6,80002c6c <consoleread+0xb8>
    80002cec:	08f4ac23          	sw	a5,152(s1)
    80002cf0:	f7dff06f          	j	80002c6c <consoleread+0xb8>

0000000080002cf4 <consputc>:
    80002cf4:	10000793          	li	a5,256
    80002cf8:	00f50663          	beq	a0,a5,80002d04 <consputc+0x10>
    80002cfc:	00001317          	auipc	t1,0x1
    80002d00:	9f430067          	jr	-1548(t1) # 800036f0 <uartputc_sync>
    80002d04:	ff010113          	addi	sp,sp,-16
    80002d08:	00113423          	sd	ra,8(sp)
    80002d0c:	00813023          	sd	s0,0(sp)
    80002d10:	01010413          	addi	s0,sp,16
    80002d14:	00800513          	li	a0,8
    80002d18:	00001097          	auipc	ra,0x1
    80002d1c:	9d8080e7          	jalr	-1576(ra) # 800036f0 <uartputc_sync>
    80002d20:	02000513          	li	a0,32
    80002d24:	00001097          	auipc	ra,0x1
    80002d28:	9cc080e7          	jalr	-1588(ra) # 800036f0 <uartputc_sync>
    80002d2c:	00013403          	ld	s0,0(sp)
    80002d30:	00813083          	ld	ra,8(sp)
    80002d34:	00800513          	li	a0,8
    80002d38:	01010113          	addi	sp,sp,16
    80002d3c:	00001317          	auipc	t1,0x1
    80002d40:	9b430067          	jr	-1612(t1) # 800036f0 <uartputc_sync>

0000000080002d44 <consoleintr>:
    80002d44:	fe010113          	addi	sp,sp,-32
    80002d48:	00813823          	sd	s0,16(sp)
    80002d4c:	00913423          	sd	s1,8(sp)
    80002d50:	01213023          	sd	s2,0(sp)
    80002d54:	00113c23          	sd	ra,24(sp)
    80002d58:	02010413          	addi	s0,sp,32
    80002d5c:	00004917          	auipc	s2,0x4
    80002d60:	b6c90913          	addi	s2,s2,-1172 # 800068c8 <cons>
    80002d64:	00050493          	mv	s1,a0
    80002d68:	00090513          	mv	a0,s2
    80002d6c:	00001097          	auipc	ra,0x1
    80002d70:	e40080e7          	jalr	-448(ra) # 80003bac <acquire>
    80002d74:	02048c63          	beqz	s1,80002dac <consoleintr+0x68>
    80002d78:	0a092783          	lw	a5,160(s2)
    80002d7c:	09892703          	lw	a4,152(s2)
    80002d80:	07f00693          	li	a3,127
    80002d84:	40e7873b          	subw	a4,a5,a4
    80002d88:	02e6e263          	bltu	a3,a4,80002dac <consoleintr+0x68>
    80002d8c:	00d00713          	li	a4,13
    80002d90:	04e48063          	beq	s1,a4,80002dd0 <consoleintr+0x8c>
    80002d94:	07f7f713          	andi	a4,a5,127
    80002d98:	00e90733          	add	a4,s2,a4
    80002d9c:	0017879b          	addiw	a5,a5,1
    80002da0:	0af92023          	sw	a5,160(s2)
    80002da4:	00970c23          	sb	s1,24(a4)
    80002da8:	08f92e23          	sw	a5,156(s2)
    80002dac:	01013403          	ld	s0,16(sp)
    80002db0:	01813083          	ld	ra,24(sp)
    80002db4:	00813483          	ld	s1,8(sp)
    80002db8:	00013903          	ld	s2,0(sp)
    80002dbc:	00004517          	auipc	a0,0x4
    80002dc0:	b0c50513          	addi	a0,a0,-1268 # 800068c8 <cons>
    80002dc4:	02010113          	addi	sp,sp,32
    80002dc8:	00001317          	auipc	t1,0x1
    80002dcc:	eb030067          	jr	-336(t1) # 80003c78 <release>
    80002dd0:	00a00493          	li	s1,10
    80002dd4:	fc1ff06f          	j	80002d94 <consoleintr+0x50>

0000000080002dd8 <consoleinit>:
    80002dd8:	fe010113          	addi	sp,sp,-32
    80002ddc:	00113c23          	sd	ra,24(sp)
    80002de0:	00813823          	sd	s0,16(sp)
    80002de4:	00913423          	sd	s1,8(sp)
    80002de8:	02010413          	addi	s0,sp,32
    80002dec:	00004497          	auipc	s1,0x4
    80002df0:	adc48493          	addi	s1,s1,-1316 # 800068c8 <cons>
    80002df4:	00048513          	mv	a0,s1
    80002df8:	00002597          	auipc	a1,0x2
    80002dfc:	35858593          	addi	a1,a1,856 # 80005150 <_ZN15MemoryAllocator11HEADER_SIZEE+0x130>
    80002e00:	00001097          	auipc	ra,0x1
    80002e04:	d88080e7          	jalr	-632(ra) # 80003b88 <initlock>
    80002e08:	00000097          	auipc	ra,0x0
    80002e0c:	7ac080e7          	jalr	1964(ra) # 800035b4 <uartinit>
    80002e10:	01813083          	ld	ra,24(sp)
    80002e14:	01013403          	ld	s0,16(sp)
    80002e18:	00000797          	auipc	a5,0x0
    80002e1c:	d9c78793          	addi	a5,a5,-612 # 80002bb4 <consoleread>
    80002e20:	0af4bc23          	sd	a5,184(s1)
    80002e24:	00000797          	auipc	a5,0x0
    80002e28:	cec78793          	addi	a5,a5,-788 # 80002b10 <consolewrite>
    80002e2c:	0cf4b023          	sd	a5,192(s1)
    80002e30:	00813483          	ld	s1,8(sp)
    80002e34:	02010113          	addi	sp,sp,32
    80002e38:	00008067          	ret

0000000080002e3c <console_read>:
    80002e3c:	ff010113          	addi	sp,sp,-16
    80002e40:	00813423          	sd	s0,8(sp)
    80002e44:	01010413          	addi	s0,sp,16
    80002e48:	00813403          	ld	s0,8(sp)
    80002e4c:	00004317          	auipc	t1,0x4
    80002e50:	b3433303          	ld	t1,-1228(t1) # 80006980 <devsw+0x10>
    80002e54:	01010113          	addi	sp,sp,16
    80002e58:	00030067          	jr	t1

0000000080002e5c <console_write>:
    80002e5c:	ff010113          	addi	sp,sp,-16
    80002e60:	00813423          	sd	s0,8(sp)
    80002e64:	01010413          	addi	s0,sp,16
    80002e68:	00813403          	ld	s0,8(sp)
    80002e6c:	00004317          	auipc	t1,0x4
    80002e70:	b1c33303          	ld	t1,-1252(t1) # 80006988 <devsw+0x18>
    80002e74:	01010113          	addi	sp,sp,16
    80002e78:	00030067          	jr	t1

0000000080002e7c <panic>:
    80002e7c:	fe010113          	addi	sp,sp,-32
    80002e80:	00113c23          	sd	ra,24(sp)
    80002e84:	00813823          	sd	s0,16(sp)
    80002e88:	00913423          	sd	s1,8(sp)
    80002e8c:	02010413          	addi	s0,sp,32
    80002e90:	00050493          	mv	s1,a0
    80002e94:	00002517          	auipc	a0,0x2
    80002e98:	2c450513          	addi	a0,a0,708 # 80005158 <_ZN15MemoryAllocator11HEADER_SIZEE+0x138>
    80002e9c:	00004797          	auipc	a5,0x4
    80002ea0:	b807a623          	sw	zero,-1140(a5) # 80006a28 <pr+0x18>
    80002ea4:	00000097          	auipc	ra,0x0
    80002ea8:	034080e7          	jalr	52(ra) # 80002ed8 <__printf>
    80002eac:	00048513          	mv	a0,s1
    80002eb0:	00000097          	auipc	ra,0x0
    80002eb4:	028080e7          	jalr	40(ra) # 80002ed8 <__printf>
    80002eb8:	00002517          	auipc	a0,0x2
    80002ebc:	28050513          	addi	a0,a0,640 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	018080e7          	jalr	24(ra) # 80002ed8 <__printf>
    80002ec8:	00100793          	li	a5,1
    80002ecc:	00003717          	auipc	a4,0x3
    80002ed0:	8cf72623          	sw	a5,-1844(a4) # 80005798 <panicked>
    80002ed4:	0000006f          	j	80002ed4 <panic+0x58>

0000000080002ed8 <__printf>:
    80002ed8:	f3010113          	addi	sp,sp,-208
    80002edc:	08813023          	sd	s0,128(sp)
    80002ee0:	07313423          	sd	s3,104(sp)
    80002ee4:	09010413          	addi	s0,sp,144
    80002ee8:	05813023          	sd	s8,64(sp)
    80002eec:	08113423          	sd	ra,136(sp)
    80002ef0:	06913c23          	sd	s1,120(sp)
    80002ef4:	07213823          	sd	s2,112(sp)
    80002ef8:	07413023          	sd	s4,96(sp)
    80002efc:	05513c23          	sd	s5,88(sp)
    80002f00:	05613823          	sd	s6,80(sp)
    80002f04:	05713423          	sd	s7,72(sp)
    80002f08:	03913c23          	sd	s9,56(sp)
    80002f0c:	03a13823          	sd	s10,48(sp)
    80002f10:	03b13423          	sd	s11,40(sp)
    80002f14:	00004317          	auipc	t1,0x4
    80002f18:	afc30313          	addi	t1,t1,-1284 # 80006a10 <pr>
    80002f1c:	01832c03          	lw	s8,24(t1)
    80002f20:	00b43423          	sd	a1,8(s0)
    80002f24:	00c43823          	sd	a2,16(s0)
    80002f28:	00d43c23          	sd	a3,24(s0)
    80002f2c:	02e43023          	sd	a4,32(s0)
    80002f30:	02f43423          	sd	a5,40(s0)
    80002f34:	03043823          	sd	a6,48(s0)
    80002f38:	03143c23          	sd	a7,56(s0)
    80002f3c:	00050993          	mv	s3,a0
    80002f40:	4a0c1663          	bnez	s8,800033ec <__printf+0x514>
    80002f44:	60098c63          	beqz	s3,8000355c <__printf+0x684>
    80002f48:	0009c503          	lbu	a0,0(s3)
    80002f4c:	00840793          	addi	a5,s0,8
    80002f50:	f6f43c23          	sd	a5,-136(s0)
    80002f54:	00000493          	li	s1,0
    80002f58:	22050063          	beqz	a0,80003178 <__printf+0x2a0>
    80002f5c:	00002a37          	lui	s4,0x2
    80002f60:	00018ab7          	lui	s5,0x18
    80002f64:	000f4b37          	lui	s6,0xf4
    80002f68:	00989bb7          	lui	s7,0x989
    80002f6c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002f70:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002f74:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002f78:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002f7c:	00148c9b          	addiw	s9,s1,1
    80002f80:	02500793          	li	a5,37
    80002f84:	01998933          	add	s2,s3,s9
    80002f88:	38f51263          	bne	a0,a5,8000330c <__printf+0x434>
    80002f8c:	00094783          	lbu	a5,0(s2)
    80002f90:	00078c9b          	sext.w	s9,a5
    80002f94:	1e078263          	beqz	a5,80003178 <__printf+0x2a0>
    80002f98:	0024849b          	addiw	s1,s1,2
    80002f9c:	07000713          	li	a4,112
    80002fa0:	00998933          	add	s2,s3,s1
    80002fa4:	38e78a63          	beq	a5,a4,80003338 <__printf+0x460>
    80002fa8:	20f76863          	bltu	a4,a5,800031b8 <__printf+0x2e0>
    80002fac:	42a78863          	beq	a5,a0,800033dc <__printf+0x504>
    80002fb0:	06400713          	li	a4,100
    80002fb4:	40e79663          	bne	a5,a4,800033c0 <__printf+0x4e8>
    80002fb8:	f7843783          	ld	a5,-136(s0)
    80002fbc:	0007a603          	lw	a2,0(a5)
    80002fc0:	00878793          	addi	a5,a5,8
    80002fc4:	f6f43c23          	sd	a5,-136(s0)
    80002fc8:	42064a63          	bltz	a2,800033fc <__printf+0x524>
    80002fcc:	00a00713          	li	a4,10
    80002fd0:	02e677bb          	remuw	a5,a2,a4
    80002fd4:	00002d97          	auipc	s11,0x2
    80002fd8:	1acd8d93          	addi	s11,s11,428 # 80005180 <digits>
    80002fdc:	00900593          	li	a1,9
    80002fe0:	0006051b          	sext.w	a0,a2
    80002fe4:	00000c93          	li	s9,0
    80002fe8:	02079793          	slli	a5,a5,0x20
    80002fec:	0207d793          	srli	a5,a5,0x20
    80002ff0:	00fd87b3          	add	a5,s11,a5
    80002ff4:	0007c783          	lbu	a5,0(a5)
    80002ff8:	02e656bb          	divuw	a3,a2,a4
    80002ffc:	f8f40023          	sb	a5,-128(s0)
    80003000:	14c5d863          	bge	a1,a2,80003150 <__printf+0x278>
    80003004:	06300593          	li	a1,99
    80003008:	00100c93          	li	s9,1
    8000300c:	02e6f7bb          	remuw	a5,a3,a4
    80003010:	02079793          	slli	a5,a5,0x20
    80003014:	0207d793          	srli	a5,a5,0x20
    80003018:	00fd87b3          	add	a5,s11,a5
    8000301c:	0007c783          	lbu	a5,0(a5)
    80003020:	02e6d73b          	divuw	a4,a3,a4
    80003024:	f8f400a3          	sb	a5,-127(s0)
    80003028:	12a5f463          	bgeu	a1,a0,80003150 <__printf+0x278>
    8000302c:	00a00693          	li	a3,10
    80003030:	00900593          	li	a1,9
    80003034:	02d777bb          	remuw	a5,a4,a3
    80003038:	02079793          	slli	a5,a5,0x20
    8000303c:	0207d793          	srli	a5,a5,0x20
    80003040:	00fd87b3          	add	a5,s11,a5
    80003044:	0007c503          	lbu	a0,0(a5)
    80003048:	02d757bb          	divuw	a5,a4,a3
    8000304c:	f8a40123          	sb	a0,-126(s0)
    80003050:	48e5f263          	bgeu	a1,a4,800034d4 <__printf+0x5fc>
    80003054:	06300513          	li	a0,99
    80003058:	02d7f5bb          	remuw	a1,a5,a3
    8000305c:	02059593          	slli	a1,a1,0x20
    80003060:	0205d593          	srli	a1,a1,0x20
    80003064:	00bd85b3          	add	a1,s11,a1
    80003068:	0005c583          	lbu	a1,0(a1)
    8000306c:	02d7d7bb          	divuw	a5,a5,a3
    80003070:	f8b401a3          	sb	a1,-125(s0)
    80003074:	48e57263          	bgeu	a0,a4,800034f8 <__printf+0x620>
    80003078:	3e700513          	li	a0,999
    8000307c:	02d7f5bb          	remuw	a1,a5,a3
    80003080:	02059593          	slli	a1,a1,0x20
    80003084:	0205d593          	srli	a1,a1,0x20
    80003088:	00bd85b3          	add	a1,s11,a1
    8000308c:	0005c583          	lbu	a1,0(a1)
    80003090:	02d7d7bb          	divuw	a5,a5,a3
    80003094:	f8b40223          	sb	a1,-124(s0)
    80003098:	46e57663          	bgeu	a0,a4,80003504 <__printf+0x62c>
    8000309c:	02d7f5bb          	remuw	a1,a5,a3
    800030a0:	02059593          	slli	a1,a1,0x20
    800030a4:	0205d593          	srli	a1,a1,0x20
    800030a8:	00bd85b3          	add	a1,s11,a1
    800030ac:	0005c583          	lbu	a1,0(a1)
    800030b0:	02d7d7bb          	divuw	a5,a5,a3
    800030b4:	f8b402a3          	sb	a1,-123(s0)
    800030b8:	46ea7863          	bgeu	s4,a4,80003528 <__printf+0x650>
    800030bc:	02d7f5bb          	remuw	a1,a5,a3
    800030c0:	02059593          	slli	a1,a1,0x20
    800030c4:	0205d593          	srli	a1,a1,0x20
    800030c8:	00bd85b3          	add	a1,s11,a1
    800030cc:	0005c583          	lbu	a1,0(a1)
    800030d0:	02d7d7bb          	divuw	a5,a5,a3
    800030d4:	f8b40323          	sb	a1,-122(s0)
    800030d8:	3eeaf863          	bgeu	s5,a4,800034c8 <__printf+0x5f0>
    800030dc:	02d7f5bb          	remuw	a1,a5,a3
    800030e0:	02059593          	slli	a1,a1,0x20
    800030e4:	0205d593          	srli	a1,a1,0x20
    800030e8:	00bd85b3          	add	a1,s11,a1
    800030ec:	0005c583          	lbu	a1,0(a1)
    800030f0:	02d7d7bb          	divuw	a5,a5,a3
    800030f4:	f8b403a3          	sb	a1,-121(s0)
    800030f8:	42eb7e63          	bgeu	s6,a4,80003534 <__printf+0x65c>
    800030fc:	02d7f5bb          	remuw	a1,a5,a3
    80003100:	02059593          	slli	a1,a1,0x20
    80003104:	0205d593          	srli	a1,a1,0x20
    80003108:	00bd85b3          	add	a1,s11,a1
    8000310c:	0005c583          	lbu	a1,0(a1)
    80003110:	02d7d7bb          	divuw	a5,a5,a3
    80003114:	f8b40423          	sb	a1,-120(s0)
    80003118:	42ebfc63          	bgeu	s7,a4,80003550 <__printf+0x678>
    8000311c:	02079793          	slli	a5,a5,0x20
    80003120:	0207d793          	srli	a5,a5,0x20
    80003124:	00fd8db3          	add	s11,s11,a5
    80003128:	000dc703          	lbu	a4,0(s11)
    8000312c:	00a00793          	li	a5,10
    80003130:	00900c93          	li	s9,9
    80003134:	f8e404a3          	sb	a4,-119(s0)
    80003138:	00065c63          	bgez	a2,80003150 <__printf+0x278>
    8000313c:	f9040713          	addi	a4,s0,-112
    80003140:	00f70733          	add	a4,a4,a5
    80003144:	02d00693          	li	a3,45
    80003148:	fed70823          	sb	a3,-16(a4)
    8000314c:	00078c93          	mv	s9,a5
    80003150:	f8040793          	addi	a5,s0,-128
    80003154:	01978cb3          	add	s9,a5,s9
    80003158:	f7f40d13          	addi	s10,s0,-129
    8000315c:	000cc503          	lbu	a0,0(s9)
    80003160:	fffc8c93          	addi	s9,s9,-1
    80003164:	00000097          	auipc	ra,0x0
    80003168:	b90080e7          	jalr	-1136(ra) # 80002cf4 <consputc>
    8000316c:	ffac98e3          	bne	s9,s10,8000315c <__printf+0x284>
    80003170:	00094503          	lbu	a0,0(s2)
    80003174:	e00514e3          	bnez	a0,80002f7c <__printf+0xa4>
    80003178:	1a0c1663          	bnez	s8,80003324 <__printf+0x44c>
    8000317c:	08813083          	ld	ra,136(sp)
    80003180:	08013403          	ld	s0,128(sp)
    80003184:	07813483          	ld	s1,120(sp)
    80003188:	07013903          	ld	s2,112(sp)
    8000318c:	06813983          	ld	s3,104(sp)
    80003190:	06013a03          	ld	s4,96(sp)
    80003194:	05813a83          	ld	s5,88(sp)
    80003198:	05013b03          	ld	s6,80(sp)
    8000319c:	04813b83          	ld	s7,72(sp)
    800031a0:	04013c03          	ld	s8,64(sp)
    800031a4:	03813c83          	ld	s9,56(sp)
    800031a8:	03013d03          	ld	s10,48(sp)
    800031ac:	02813d83          	ld	s11,40(sp)
    800031b0:	0d010113          	addi	sp,sp,208
    800031b4:	00008067          	ret
    800031b8:	07300713          	li	a4,115
    800031bc:	1ce78a63          	beq	a5,a4,80003390 <__printf+0x4b8>
    800031c0:	07800713          	li	a4,120
    800031c4:	1ee79e63          	bne	a5,a4,800033c0 <__printf+0x4e8>
    800031c8:	f7843783          	ld	a5,-136(s0)
    800031cc:	0007a703          	lw	a4,0(a5)
    800031d0:	00878793          	addi	a5,a5,8
    800031d4:	f6f43c23          	sd	a5,-136(s0)
    800031d8:	28074263          	bltz	a4,8000345c <__printf+0x584>
    800031dc:	00002d97          	auipc	s11,0x2
    800031e0:	fa4d8d93          	addi	s11,s11,-92 # 80005180 <digits>
    800031e4:	00f77793          	andi	a5,a4,15
    800031e8:	00fd87b3          	add	a5,s11,a5
    800031ec:	0007c683          	lbu	a3,0(a5)
    800031f0:	00f00613          	li	a2,15
    800031f4:	0007079b          	sext.w	a5,a4
    800031f8:	f8d40023          	sb	a3,-128(s0)
    800031fc:	0047559b          	srliw	a1,a4,0x4
    80003200:	0047569b          	srliw	a3,a4,0x4
    80003204:	00000c93          	li	s9,0
    80003208:	0ee65063          	bge	a2,a4,800032e8 <__printf+0x410>
    8000320c:	00f6f693          	andi	a3,a3,15
    80003210:	00dd86b3          	add	a3,s11,a3
    80003214:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003218:	0087d79b          	srliw	a5,a5,0x8
    8000321c:	00100c93          	li	s9,1
    80003220:	f8d400a3          	sb	a3,-127(s0)
    80003224:	0cb67263          	bgeu	a2,a1,800032e8 <__printf+0x410>
    80003228:	00f7f693          	andi	a3,a5,15
    8000322c:	00dd86b3          	add	a3,s11,a3
    80003230:	0006c583          	lbu	a1,0(a3)
    80003234:	00f00613          	li	a2,15
    80003238:	0047d69b          	srliw	a3,a5,0x4
    8000323c:	f8b40123          	sb	a1,-126(s0)
    80003240:	0047d593          	srli	a1,a5,0x4
    80003244:	28f67e63          	bgeu	a2,a5,800034e0 <__printf+0x608>
    80003248:	00f6f693          	andi	a3,a3,15
    8000324c:	00dd86b3          	add	a3,s11,a3
    80003250:	0006c503          	lbu	a0,0(a3)
    80003254:	0087d813          	srli	a6,a5,0x8
    80003258:	0087d69b          	srliw	a3,a5,0x8
    8000325c:	f8a401a3          	sb	a0,-125(s0)
    80003260:	28b67663          	bgeu	a2,a1,800034ec <__printf+0x614>
    80003264:	00f6f693          	andi	a3,a3,15
    80003268:	00dd86b3          	add	a3,s11,a3
    8000326c:	0006c583          	lbu	a1,0(a3)
    80003270:	00c7d513          	srli	a0,a5,0xc
    80003274:	00c7d69b          	srliw	a3,a5,0xc
    80003278:	f8b40223          	sb	a1,-124(s0)
    8000327c:	29067a63          	bgeu	a2,a6,80003510 <__printf+0x638>
    80003280:	00f6f693          	andi	a3,a3,15
    80003284:	00dd86b3          	add	a3,s11,a3
    80003288:	0006c583          	lbu	a1,0(a3)
    8000328c:	0107d813          	srli	a6,a5,0x10
    80003290:	0107d69b          	srliw	a3,a5,0x10
    80003294:	f8b402a3          	sb	a1,-123(s0)
    80003298:	28a67263          	bgeu	a2,a0,8000351c <__printf+0x644>
    8000329c:	00f6f693          	andi	a3,a3,15
    800032a0:	00dd86b3          	add	a3,s11,a3
    800032a4:	0006c683          	lbu	a3,0(a3)
    800032a8:	0147d79b          	srliw	a5,a5,0x14
    800032ac:	f8d40323          	sb	a3,-122(s0)
    800032b0:	21067663          	bgeu	a2,a6,800034bc <__printf+0x5e4>
    800032b4:	02079793          	slli	a5,a5,0x20
    800032b8:	0207d793          	srli	a5,a5,0x20
    800032bc:	00fd8db3          	add	s11,s11,a5
    800032c0:	000dc683          	lbu	a3,0(s11)
    800032c4:	00800793          	li	a5,8
    800032c8:	00700c93          	li	s9,7
    800032cc:	f8d403a3          	sb	a3,-121(s0)
    800032d0:	00075c63          	bgez	a4,800032e8 <__printf+0x410>
    800032d4:	f9040713          	addi	a4,s0,-112
    800032d8:	00f70733          	add	a4,a4,a5
    800032dc:	02d00693          	li	a3,45
    800032e0:	fed70823          	sb	a3,-16(a4)
    800032e4:	00078c93          	mv	s9,a5
    800032e8:	f8040793          	addi	a5,s0,-128
    800032ec:	01978cb3          	add	s9,a5,s9
    800032f0:	f7f40d13          	addi	s10,s0,-129
    800032f4:	000cc503          	lbu	a0,0(s9)
    800032f8:	fffc8c93          	addi	s9,s9,-1
    800032fc:	00000097          	auipc	ra,0x0
    80003300:	9f8080e7          	jalr	-1544(ra) # 80002cf4 <consputc>
    80003304:	ff9d18e3          	bne	s10,s9,800032f4 <__printf+0x41c>
    80003308:	0100006f          	j	80003318 <__printf+0x440>
    8000330c:	00000097          	auipc	ra,0x0
    80003310:	9e8080e7          	jalr	-1560(ra) # 80002cf4 <consputc>
    80003314:	000c8493          	mv	s1,s9
    80003318:	00094503          	lbu	a0,0(s2)
    8000331c:	c60510e3          	bnez	a0,80002f7c <__printf+0xa4>
    80003320:	e40c0ee3          	beqz	s8,8000317c <__printf+0x2a4>
    80003324:	00003517          	auipc	a0,0x3
    80003328:	6ec50513          	addi	a0,a0,1772 # 80006a10 <pr>
    8000332c:	00001097          	auipc	ra,0x1
    80003330:	94c080e7          	jalr	-1716(ra) # 80003c78 <release>
    80003334:	e49ff06f          	j	8000317c <__printf+0x2a4>
    80003338:	f7843783          	ld	a5,-136(s0)
    8000333c:	03000513          	li	a0,48
    80003340:	01000d13          	li	s10,16
    80003344:	00878713          	addi	a4,a5,8
    80003348:	0007bc83          	ld	s9,0(a5)
    8000334c:	f6e43c23          	sd	a4,-136(s0)
    80003350:	00000097          	auipc	ra,0x0
    80003354:	9a4080e7          	jalr	-1628(ra) # 80002cf4 <consputc>
    80003358:	07800513          	li	a0,120
    8000335c:	00000097          	auipc	ra,0x0
    80003360:	998080e7          	jalr	-1640(ra) # 80002cf4 <consputc>
    80003364:	00002d97          	auipc	s11,0x2
    80003368:	e1cd8d93          	addi	s11,s11,-484 # 80005180 <digits>
    8000336c:	03ccd793          	srli	a5,s9,0x3c
    80003370:	00fd87b3          	add	a5,s11,a5
    80003374:	0007c503          	lbu	a0,0(a5)
    80003378:	fffd0d1b          	addiw	s10,s10,-1
    8000337c:	004c9c93          	slli	s9,s9,0x4
    80003380:	00000097          	auipc	ra,0x0
    80003384:	974080e7          	jalr	-1676(ra) # 80002cf4 <consputc>
    80003388:	fe0d12e3          	bnez	s10,8000336c <__printf+0x494>
    8000338c:	f8dff06f          	j	80003318 <__printf+0x440>
    80003390:	f7843783          	ld	a5,-136(s0)
    80003394:	0007bc83          	ld	s9,0(a5)
    80003398:	00878793          	addi	a5,a5,8
    8000339c:	f6f43c23          	sd	a5,-136(s0)
    800033a0:	000c9a63          	bnez	s9,800033b4 <__printf+0x4dc>
    800033a4:	1080006f          	j	800034ac <__printf+0x5d4>
    800033a8:	001c8c93          	addi	s9,s9,1
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	948080e7          	jalr	-1720(ra) # 80002cf4 <consputc>
    800033b4:	000cc503          	lbu	a0,0(s9)
    800033b8:	fe0518e3          	bnez	a0,800033a8 <__printf+0x4d0>
    800033bc:	f5dff06f          	j	80003318 <__printf+0x440>
    800033c0:	02500513          	li	a0,37
    800033c4:	00000097          	auipc	ra,0x0
    800033c8:	930080e7          	jalr	-1744(ra) # 80002cf4 <consputc>
    800033cc:	000c8513          	mv	a0,s9
    800033d0:	00000097          	auipc	ra,0x0
    800033d4:	924080e7          	jalr	-1756(ra) # 80002cf4 <consputc>
    800033d8:	f41ff06f          	j	80003318 <__printf+0x440>
    800033dc:	02500513          	li	a0,37
    800033e0:	00000097          	auipc	ra,0x0
    800033e4:	914080e7          	jalr	-1772(ra) # 80002cf4 <consputc>
    800033e8:	f31ff06f          	j	80003318 <__printf+0x440>
    800033ec:	00030513          	mv	a0,t1
    800033f0:	00000097          	auipc	ra,0x0
    800033f4:	7bc080e7          	jalr	1980(ra) # 80003bac <acquire>
    800033f8:	b4dff06f          	j	80002f44 <__printf+0x6c>
    800033fc:	40c0053b          	negw	a0,a2
    80003400:	00a00713          	li	a4,10
    80003404:	02e576bb          	remuw	a3,a0,a4
    80003408:	00002d97          	auipc	s11,0x2
    8000340c:	d78d8d93          	addi	s11,s11,-648 # 80005180 <digits>
    80003410:	ff700593          	li	a1,-9
    80003414:	02069693          	slli	a3,a3,0x20
    80003418:	0206d693          	srli	a3,a3,0x20
    8000341c:	00dd86b3          	add	a3,s11,a3
    80003420:	0006c683          	lbu	a3,0(a3)
    80003424:	02e557bb          	divuw	a5,a0,a4
    80003428:	f8d40023          	sb	a3,-128(s0)
    8000342c:	10b65e63          	bge	a2,a1,80003548 <__printf+0x670>
    80003430:	06300593          	li	a1,99
    80003434:	02e7f6bb          	remuw	a3,a5,a4
    80003438:	02069693          	slli	a3,a3,0x20
    8000343c:	0206d693          	srli	a3,a3,0x20
    80003440:	00dd86b3          	add	a3,s11,a3
    80003444:	0006c683          	lbu	a3,0(a3)
    80003448:	02e7d73b          	divuw	a4,a5,a4
    8000344c:	00200793          	li	a5,2
    80003450:	f8d400a3          	sb	a3,-127(s0)
    80003454:	bca5ece3          	bltu	a1,a0,8000302c <__printf+0x154>
    80003458:	ce5ff06f          	j	8000313c <__printf+0x264>
    8000345c:	40e007bb          	negw	a5,a4
    80003460:	00002d97          	auipc	s11,0x2
    80003464:	d20d8d93          	addi	s11,s11,-736 # 80005180 <digits>
    80003468:	00f7f693          	andi	a3,a5,15
    8000346c:	00dd86b3          	add	a3,s11,a3
    80003470:	0006c583          	lbu	a1,0(a3)
    80003474:	ff100613          	li	a2,-15
    80003478:	0047d69b          	srliw	a3,a5,0x4
    8000347c:	f8b40023          	sb	a1,-128(s0)
    80003480:	0047d59b          	srliw	a1,a5,0x4
    80003484:	0ac75e63          	bge	a4,a2,80003540 <__printf+0x668>
    80003488:	00f6f693          	andi	a3,a3,15
    8000348c:	00dd86b3          	add	a3,s11,a3
    80003490:	0006c603          	lbu	a2,0(a3)
    80003494:	00f00693          	li	a3,15
    80003498:	0087d79b          	srliw	a5,a5,0x8
    8000349c:	f8c400a3          	sb	a2,-127(s0)
    800034a0:	d8b6e4e3          	bltu	a3,a1,80003228 <__printf+0x350>
    800034a4:	00200793          	li	a5,2
    800034a8:	e2dff06f          	j	800032d4 <__printf+0x3fc>
    800034ac:	00002c97          	auipc	s9,0x2
    800034b0:	cb4c8c93          	addi	s9,s9,-844 # 80005160 <_ZN15MemoryAllocator11HEADER_SIZEE+0x140>
    800034b4:	02800513          	li	a0,40
    800034b8:	ef1ff06f          	j	800033a8 <__printf+0x4d0>
    800034bc:	00700793          	li	a5,7
    800034c0:	00600c93          	li	s9,6
    800034c4:	e0dff06f          	j	800032d0 <__printf+0x3f8>
    800034c8:	00700793          	li	a5,7
    800034cc:	00600c93          	li	s9,6
    800034d0:	c69ff06f          	j	80003138 <__printf+0x260>
    800034d4:	00300793          	li	a5,3
    800034d8:	00200c93          	li	s9,2
    800034dc:	c5dff06f          	j	80003138 <__printf+0x260>
    800034e0:	00300793          	li	a5,3
    800034e4:	00200c93          	li	s9,2
    800034e8:	de9ff06f          	j	800032d0 <__printf+0x3f8>
    800034ec:	00400793          	li	a5,4
    800034f0:	00300c93          	li	s9,3
    800034f4:	dddff06f          	j	800032d0 <__printf+0x3f8>
    800034f8:	00400793          	li	a5,4
    800034fc:	00300c93          	li	s9,3
    80003500:	c39ff06f          	j	80003138 <__printf+0x260>
    80003504:	00500793          	li	a5,5
    80003508:	00400c93          	li	s9,4
    8000350c:	c2dff06f          	j	80003138 <__printf+0x260>
    80003510:	00500793          	li	a5,5
    80003514:	00400c93          	li	s9,4
    80003518:	db9ff06f          	j	800032d0 <__printf+0x3f8>
    8000351c:	00600793          	li	a5,6
    80003520:	00500c93          	li	s9,5
    80003524:	dadff06f          	j	800032d0 <__printf+0x3f8>
    80003528:	00600793          	li	a5,6
    8000352c:	00500c93          	li	s9,5
    80003530:	c09ff06f          	j	80003138 <__printf+0x260>
    80003534:	00800793          	li	a5,8
    80003538:	00700c93          	li	s9,7
    8000353c:	bfdff06f          	j	80003138 <__printf+0x260>
    80003540:	00100793          	li	a5,1
    80003544:	d91ff06f          	j	800032d4 <__printf+0x3fc>
    80003548:	00100793          	li	a5,1
    8000354c:	bf1ff06f          	j	8000313c <__printf+0x264>
    80003550:	00900793          	li	a5,9
    80003554:	00800c93          	li	s9,8
    80003558:	be1ff06f          	j	80003138 <__printf+0x260>
    8000355c:	00002517          	auipc	a0,0x2
    80003560:	c0c50513          	addi	a0,a0,-1012 # 80005168 <_ZN15MemoryAllocator11HEADER_SIZEE+0x148>
    80003564:	00000097          	auipc	ra,0x0
    80003568:	918080e7          	jalr	-1768(ra) # 80002e7c <panic>

000000008000356c <printfinit>:
    8000356c:	fe010113          	addi	sp,sp,-32
    80003570:	00813823          	sd	s0,16(sp)
    80003574:	00913423          	sd	s1,8(sp)
    80003578:	00113c23          	sd	ra,24(sp)
    8000357c:	02010413          	addi	s0,sp,32
    80003580:	00003497          	auipc	s1,0x3
    80003584:	49048493          	addi	s1,s1,1168 # 80006a10 <pr>
    80003588:	00048513          	mv	a0,s1
    8000358c:	00002597          	auipc	a1,0x2
    80003590:	bec58593          	addi	a1,a1,-1044 # 80005178 <_ZN15MemoryAllocator11HEADER_SIZEE+0x158>
    80003594:	00000097          	auipc	ra,0x0
    80003598:	5f4080e7          	jalr	1524(ra) # 80003b88 <initlock>
    8000359c:	01813083          	ld	ra,24(sp)
    800035a0:	01013403          	ld	s0,16(sp)
    800035a4:	0004ac23          	sw	zero,24(s1)
    800035a8:	00813483          	ld	s1,8(sp)
    800035ac:	02010113          	addi	sp,sp,32
    800035b0:	00008067          	ret

00000000800035b4 <uartinit>:
    800035b4:	ff010113          	addi	sp,sp,-16
    800035b8:	00813423          	sd	s0,8(sp)
    800035bc:	01010413          	addi	s0,sp,16
    800035c0:	100007b7          	lui	a5,0x10000
    800035c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800035c8:	f8000713          	li	a4,-128
    800035cc:	00e781a3          	sb	a4,3(a5)
    800035d0:	00300713          	li	a4,3
    800035d4:	00e78023          	sb	a4,0(a5)
    800035d8:	000780a3          	sb	zero,1(a5)
    800035dc:	00e781a3          	sb	a4,3(a5)
    800035e0:	00700693          	li	a3,7
    800035e4:	00d78123          	sb	a3,2(a5)
    800035e8:	00e780a3          	sb	a4,1(a5)
    800035ec:	00813403          	ld	s0,8(sp)
    800035f0:	01010113          	addi	sp,sp,16
    800035f4:	00008067          	ret

00000000800035f8 <uartputc>:
    800035f8:	00002797          	auipc	a5,0x2
    800035fc:	1a07a783          	lw	a5,416(a5) # 80005798 <panicked>
    80003600:	00078463          	beqz	a5,80003608 <uartputc+0x10>
    80003604:	0000006f          	j	80003604 <uartputc+0xc>
    80003608:	fd010113          	addi	sp,sp,-48
    8000360c:	02813023          	sd	s0,32(sp)
    80003610:	00913c23          	sd	s1,24(sp)
    80003614:	01213823          	sd	s2,16(sp)
    80003618:	01313423          	sd	s3,8(sp)
    8000361c:	02113423          	sd	ra,40(sp)
    80003620:	03010413          	addi	s0,sp,48
    80003624:	00002917          	auipc	s2,0x2
    80003628:	17c90913          	addi	s2,s2,380 # 800057a0 <uart_tx_r>
    8000362c:	00093783          	ld	a5,0(s2)
    80003630:	00002497          	auipc	s1,0x2
    80003634:	17848493          	addi	s1,s1,376 # 800057a8 <uart_tx_w>
    80003638:	0004b703          	ld	a4,0(s1)
    8000363c:	02078693          	addi	a3,a5,32
    80003640:	00050993          	mv	s3,a0
    80003644:	02e69c63          	bne	a3,a4,8000367c <uartputc+0x84>
    80003648:	00001097          	auipc	ra,0x1
    8000364c:	834080e7          	jalr	-1996(ra) # 80003e7c <push_on>
    80003650:	00093783          	ld	a5,0(s2)
    80003654:	0004b703          	ld	a4,0(s1)
    80003658:	02078793          	addi	a5,a5,32
    8000365c:	00e79463          	bne	a5,a4,80003664 <uartputc+0x6c>
    80003660:	0000006f          	j	80003660 <uartputc+0x68>
    80003664:	00001097          	auipc	ra,0x1
    80003668:	88c080e7          	jalr	-1908(ra) # 80003ef0 <pop_on>
    8000366c:	00093783          	ld	a5,0(s2)
    80003670:	0004b703          	ld	a4,0(s1)
    80003674:	02078693          	addi	a3,a5,32
    80003678:	fce688e3          	beq	a3,a4,80003648 <uartputc+0x50>
    8000367c:	01f77693          	andi	a3,a4,31
    80003680:	00003597          	auipc	a1,0x3
    80003684:	3b058593          	addi	a1,a1,944 # 80006a30 <uart_tx_buf>
    80003688:	00d586b3          	add	a3,a1,a3
    8000368c:	00170713          	addi	a4,a4,1
    80003690:	01368023          	sb	s3,0(a3)
    80003694:	00e4b023          	sd	a4,0(s1)
    80003698:	10000637          	lui	a2,0x10000
    8000369c:	02f71063          	bne	a4,a5,800036bc <uartputc+0xc4>
    800036a0:	0340006f          	j	800036d4 <uartputc+0xdc>
    800036a4:	00074703          	lbu	a4,0(a4)
    800036a8:	00f93023          	sd	a5,0(s2)
    800036ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800036b0:	00093783          	ld	a5,0(s2)
    800036b4:	0004b703          	ld	a4,0(s1)
    800036b8:	00f70e63          	beq	a4,a5,800036d4 <uartputc+0xdc>
    800036bc:	00564683          	lbu	a3,5(a2)
    800036c0:	01f7f713          	andi	a4,a5,31
    800036c4:	00e58733          	add	a4,a1,a4
    800036c8:	0206f693          	andi	a3,a3,32
    800036cc:	00178793          	addi	a5,a5,1
    800036d0:	fc069ae3          	bnez	a3,800036a4 <uartputc+0xac>
    800036d4:	02813083          	ld	ra,40(sp)
    800036d8:	02013403          	ld	s0,32(sp)
    800036dc:	01813483          	ld	s1,24(sp)
    800036e0:	01013903          	ld	s2,16(sp)
    800036e4:	00813983          	ld	s3,8(sp)
    800036e8:	03010113          	addi	sp,sp,48
    800036ec:	00008067          	ret

00000000800036f0 <uartputc_sync>:
    800036f0:	ff010113          	addi	sp,sp,-16
    800036f4:	00813423          	sd	s0,8(sp)
    800036f8:	01010413          	addi	s0,sp,16
    800036fc:	00002717          	auipc	a4,0x2
    80003700:	09c72703          	lw	a4,156(a4) # 80005798 <panicked>
    80003704:	02071663          	bnez	a4,80003730 <uartputc_sync+0x40>
    80003708:	00050793          	mv	a5,a0
    8000370c:	100006b7          	lui	a3,0x10000
    80003710:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003714:	02077713          	andi	a4,a4,32
    80003718:	fe070ce3          	beqz	a4,80003710 <uartputc_sync+0x20>
    8000371c:	0ff7f793          	andi	a5,a5,255
    80003720:	00f68023          	sb	a5,0(a3)
    80003724:	00813403          	ld	s0,8(sp)
    80003728:	01010113          	addi	sp,sp,16
    8000372c:	00008067          	ret
    80003730:	0000006f          	j	80003730 <uartputc_sync+0x40>

0000000080003734 <uartstart>:
    80003734:	ff010113          	addi	sp,sp,-16
    80003738:	00813423          	sd	s0,8(sp)
    8000373c:	01010413          	addi	s0,sp,16
    80003740:	00002617          	auipc	a2,0x2
    80003744:	06060613          	addi	a2,a2,96 # 800057a0 <uart_tx_r>
    80003748:	00002517          	auipc	a0,0x2
    8000374c:	06050513          	addi	a0,a0,96 # 800057a8 <uart_tx_w>
    80003750:	00063783          	ld	a5,0(a2)
    80003754:	00053703          	ld	a4,0(a0)
    80003758:	04f70263          	beq	a4,a5,8000379c <uartstart+0x68>
    8000375c:	100005b7          	lui	a1,0x10000
    80003760:	00003817          	auipc	a6,0x3
    80003764:	2d080813          	addi	a6,a6,720 # 80006a30 <uart_tx_buf>
    80003768:	01c0006f          	j	80003784 <uartstart+0x50>
    8000376c:	0006c703          	lbu	a4,0(a3)
    80003770:	00f63023          	sd	a5,0(a2)
    80003774:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003778:	00063783          	ld	a5,0(a2)
    8000377c:	00053703          	ld	a4,0(a0)
    80003780:	00f70e63          	beq	a4,a5,8000379c <uartstart+0x68>
    80003784:	01f7f713          	andi	a4,a5,31
    80003788:	00e806b3          	add	a3,a6,a4
    8000378c:	0055c703          	lbu	a4,5(a1)
    80003790:	00178793          	addi	a5,a5,1
    80003794:	02077713          	andi	a4,a4,32
    80003798:	fc071ae3          	bnez	a4,8000376c <uartstart+0x38>
    8000379c:	00813403          	ld	s0,8(sp)
    800037a0:	01010113          	addi	sp,sp,16
    800037a4:	00008067          	ret

00000000800037a8 <uartgetc>:
    800037a8:	ff010113          	addi	sp,sp,-16
    800037ac:	00813423          	sd	s0,8(sp)
    800037b0:	01010413          	addi	s0,sp,16
    800037b4:	10000737          	lui	a4,0x10000
    800037b8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800037bc:	0017f793          	andi	a5,a5,1
    800037c0:	00078c63          	beqz	a5,800037d8 <uartgetc+0x30>
    800037c4:	00074503          	lbu	a0,0(a4)
    800037c8:	0ff57513          	andi	a0,a0,255
    800037cc:	00813403          	ld	s0,8(sp)
    800037d0:	01010113          	addi	sp,sp,16
    800037d4:	00008067          	ret
    800037d8:	fff00513          	li	a0,-1
    800037dc:	ff1ff06f          	j	800037cc <uartgetc+0x24>

00000000800037e0 <uartintr>:
    800037e0:	100007b7          	lui	a5,0x10000
    800037e4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800037e8:	0017f793          	andi	a5,a5,1
    800037ec:	0a078463          	beqz	a5,80003894 <uartintr+0xb4>
    800037f0:	fe010113          	addi	sp,sp,-32
    800037f4:	00813823          	sd	s0,16(sp)
    800037f8:	00913423          	sd	s1,8(sp)
    800037fc:	00113c23          	sd	ra,24(sp)
    80003800:	02010413          	addi	s0,sp,32
    80003804:	100004b7          	lui	s1,0x10000
    80003808:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000380c:	0ff57513          	andi	a0,a0,255
    80003810:	fffff097          	auipc	ra,0xfffff
    80003814:	534080e7          	jalr	1332(ra) # 80002d44 <consoleintr>
    80003818:	0054c783          	lbu	a5,5(s1)
    8000381c:	0017f793          	andi	a5,a5,1
    80003820:	fe0794e3          	bnez	a5,80003808 <uartintr+0x28>
    80003824:	00002617          	auipc	a2,0x2
    80003828:	f7c60613          	addi	a2,a2,-132 # 800057a0 <uart_tx_r>
    8000382c:	00002517          	auipc	a0,0x2
    80003830:	f7c50513          	addi	a0,a0,-132 # 800057a8 <uart_tx_w>
    80003834:	00063783          	ld	a5,0(a2)
    80003838:	00053703          	ld	a4,0(a0)
    8000383c:	04f70263          	beq	a4,a5,80003880 <uartintr+0xa0>
    80003840:	100005b7          	lui	a1,0x10000
    80003844:	00003817          	auipc	a6,0x3
    80003848:	1ec80813          	addi	a6,a6,492 # 80006a30 <uart_tx_buf>
    8000384c:	01c0006f          	j	80003868 <uartintr+0x88>
    80003850:	0006c703          	lbu	a4,0(a3)
    80003854:	00f63023          	sd	a5,0(a2)
    80003858:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000385c:	00063783          	ld	a5,0(a2)
    80003860:	00053703          	ld	a4,0(a0)
    80003864:	00f70e63          	beq	a4,a5,80003880 <uartintr+0xa0>
    80003868:	01f7f713          	andi	a4,a5,31
    8000386c:	00e806b3          	add	a3,a6,a4
    80003870:	0055c703          	lbu	a4,5(a1)
    80003874:	00178793          	addi	a5,a5,1
    80003878:	02077713          	andi	a4,a4,32
    8000387c:	fc071ae3          	bnez	a4,80003850 <uartintr+0x70>
    80003880:	01813083          	ld	ra,24(sp)
    80003884:	01013403          	ld	s0,16(sp)
    80003888:	00813483          	ld	s1,8(sp)
    8000388c:	02010113          	addi	sp,sp,32
    80003890:	00008067          	ret
    80003894:	00002617          	auipc	a2,0x2
    80003898:	f0c60613          	addi	a2,a2,-244 # 800057a0 <uart_tx_r>
    8000389c:	00002517          	auipc	a0,0x2
    800038a0:	f0c50513          	addi	a0,a0,-244 # 800057a8 <uart_tx_w>
    800038a4:	00063783          	ld	a5,0(a2)
    800038a8:	00053703          	ld	a4,0(a0)
    800038ac:	04f70263          	beq	a4,a5,800038f0 <uartintr+0x110>
    800038b0:	100005b7          	lui	a1,0x10000
    800038b4:	00003817          	auipc	a6,0x3
    800038b8:	17c80813          	addi	a6,a6,380 # 80006a30 <uart_tx_buf>
    800038bc:	01c0006f          	j	800038d8 <uartintr+0xf8>
    800038c0:	0006c703          	lbu	a4,0(a3)
    800038c4:	00f63023          	sd	a5,0(a2)
    800038c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800038cc:	00063783          	ld	a5,0(a2)
    800038d0:	00053703          	ld	a4,0(a0)
    800038d4:	02f70063          	beq	a4,a5,800038f4 <uartintr+0x114>
    800038d8:	01f7f713          	andi	a4,a5,31
    800038dc:	00e806b3          	add	a3,a6,a4
    800038e0:	0055c703          	lbu	a4,5(a1)
    800038e4:	00178793          	addi	a5,a5,1
    800038e8:	02077713          	andi	a4,a4,32
    800038ec:	fc071ae3          	bnez	a4,800038c0 <uartintr+0xe0>
    800038f0:	00008067          	ret
    800038f4:	00008067          	ret

00000000800038f8 <kinit>:
    800038f8:	fc010113          	addi	sp,sp,-64
    800038fc:	02913423          	sd	s1,40(sp)
    80003900:	fffff7b7          	lui	a5,0xfffff
    80003904:	00004497          	auipc	s1,0x4
    80003908:	14b48493          	addi	s1,s1,331 # 80007a4f <end+0xfff>
    8000390c:	02813823          	sd	s0,48(sp)
    80003910:	01313c23          	sd	s3,24(sp)
    80003914:	00f4f4b3          	and	s1,s1,a5
    80003918:	02113c23          	sd	ra,56(sp)
    8000391c:	03213023          	sd	s2,32(sp)
    80003920:	01413823          	sd	s4,16(sp)
    80003924:	01513423          	sd	s5,8(sp)
    80003928:	04010413          	addi	s0,sp,64
    8000392c:	000017b7          	lui	a5,0x1
    80003930:	01100993          	li	s3,17
    80003934:	00f487b3          	add	a5,s1,a5
    80003938:	01b99993          	slli	s3,s3,0x1b
    8000393c:	06f9e063          	bltu	s3,a5,8000399c <kinit+0xa4>
    80003940:	00003a97          	auipc	s5,0x3
    80003944:	110a8a93          	addi	s5,s5,272 # 80006a50 <end>
    80003948:	0754ec63          	bltu	s1,s5,800039c0 <kinit+0xc8>
    8000394c:	0734fa63          	bgeu	s1,s3,800039c0 <kinit+0xc8>
    80003950:	00088a37          	lui	s4,0x88
    80003954:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003958:	00002917          	auipc	s2,0x2
    8000395c:	e5890913          	addi	s2,s2,-424 # 800057b0 <kmem>
    80003960:	00ca1a13          	slli	s4,s4,0xc
    80003964:	0140006f          	j	80003978 <kinit+0x80>
    80003968:	000017b7          	lui	a5,0x1
    8000396c:	00f484b3          	add	s1,s1,a5
    80003970:	0554e863          	bltu	s1,s5,800039c0 <kinit+0xc8>
    80003974:	0534f663          	bgeu	s1,s3,800039c0 <kinit+0xc8>
    80003978:	00001637          	lui	a2,0x1
    8000397c:	00100593          	li	a1,1
    80003980:	00048513          	mv	a0,s1
    80003984:	00000097          	auipc	ra,0x0
    80003988:	5e4080e7          	jalr	1508(ra) # 80003f68 <__memset>
    8000398c:	00093783          	ld	a5,0(s2)
    80003990:	00f4b023          	sd	a5,0(s1)
    80003994:	00993023          	sd	s1,0(s2)
    80003998:	fd4498e3          	bne	s1,s4,80003968 <kinit+0x70>
    8000399c:	03813083          	ld	ra,56(sp)
    800039a0:	03013403          	ld	s0,48(sp)
    800039a4:	02813483          	ld	s1,40(sp)
    800039a8:	02013903          	ld	s2,32(sp)
    800039ac:	01813983          	ld	s3,24(sp)
    800039b0:	01013a03          	ld	s4,16(sp)
    800039b4:	00813a83          	ld	s5,8(sp)
    800039b8:	04010113          	addi	sp,sp,64
    800039bc:	00008067          	ret
    800039c0:	00001517          	auipc	a0,0x1
    800039c4:	7d850513          	addi	a0,a0,2008 # 80005198 <digits+0x18>
    800039c8:	fffff097          	auipc	ra,0xfffff
    800039cc:	4b4080e7          	jalr	1204(ra) # 80002e7c <panic>

00000000800039d0 <freerange>:
    800039d0:	fc010113          	addi	sp,sp,-64
    800039d4:	000017b7          	lui	a5,0x1
    800039d8:	02913423          	sd	s1,40(sp)
    800039dc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800039e0:	009504b3          	add	s1,a0,s1
    800039e4:	fffff537          	lui	a0,0xfffff
    800039e8:	02813823          	sd	s0,48(sp)
    800039ec:	02113c23          	sd	ra,56(sp)
    800039f0:	03213023          	sd	s2,32(sp)
    800039f4:	01313c23          	sd	s3,24(sp)
    800039f8:	01413823          	sd	s4,16(sp)
    800039fc:	01513423          	sd	s5,8(sp)
    80003a00:	01613023          	sd	s6,0(sp)
    80003a04:	04010413          	addi	s0,sp,64
    80003a08:	00a4f4b3          	and	s1,s1,a0
    80003a0c:	00f487b3          	add	a5,s1,a5
    80003a10:	06f5e463          	bltu	a1,a5,80003a78 <freerange+0xa8>
    80003a14:	00003a97          	auipc	s5,0x3
    80003a18:	03ca8a93          	addi	s5,s5,60 # 80006a50 <end>
    80003a1c:	0954e263          	bltu	s1,s5,80003aa0 <freerange+0xd0>
    80003a20:	01100993          	li	s3,17
    80003a24:	01b99993          	slli	s3,s3,0x1b
    80003a28:	0734fc63          	bgeu	s1,s3,80003aa0 <freerange+0xd0>
    80003a2c:	00058a13          	mv	s4,a1
    80003a30:	00002917          	auipc	s2,0x2
    80003a34:	d8090913          	addi	s2,s2,-640 # 800057b0 <kmem>
    80003a38:	00002b37          	lui	s6,0x2
    80003a3c:	0140006f          	j	80003a50 <freerange+0x80>
    80003a40:	000017b7          	lui	a5,0x1
    80003a44:	00f484b3          	add	s1,s1,a5
    80003a48:	0554ec63          	bltu	s1,s5,80003aa0 <freerange+0xd0>
    80003a4c:	0534fa63          	bgeu	s1,s3,80003aa0 <freerange+0xd0>
    80003a50:	00001637          	lui	a2,0x1
    80003a54:	00100593          	li	a1,1
    80003a58:	00048513          	mv	a0,s1
    80003a5c:	00000097          	auipc	ra,0x0
    80003a60:	50c080e7          	jalr	1292(ra) # 80003f68 <__memset>
    80003a64:	00093703          	ld	a4,0(s2)
    80003a68:	016487b3          	add	a5,s1,s6
    80003a6c:	00e4b023          	sd	a4,0(s1)
    80003a70:	00993023          	sd	s1,0(s2)
    80003a74:	fcfa76e3          	bgeu	s4,a5,80003a40 <freerange+0x70>
    80003a78:	03813083          	ld	ra,56(sp)
    80003a7c:	03013403          	ld	s0,48(sp)
    80003a80:	02813483          	ld	s1,40(sp)
    80003a84:	02013903          	ld	s2,32(sp)
    80003a88:	01813983          	ld	s3,24(sp)
    80003a8c:	01013a03          	ld	s4,16(sp)
    80003a90:	00813a83          	ld	s5,8(sp)
    80003a94:	00013b03          	ld	s6,0(sp)
    80003a98:	04010113          	addi	sp,sp,64
    80003a9c:	00008067          	ret
    80003aa0:	00001517          	auipc	a0,0x1
    80003aa4:	6f850513          	addi	a0,a0,1784 # 80005198 <digits+0x18>
    80003aa8:	fffff097          	auipc	ra,0xfffff
    80003aac:	3d4080e7          	jalr	980(ra) # 80002e7c <panic>

0000000080003ab0 <kfree>:
    80003ab0:	fe010113          	addi	sp,sp,-32
    80003ab4:	00813823          	sd	s0,16(sp)
    80003ab8:	00113c23          	sd	ra,24(sp)
    80003abc:	00913423          	sd	s1,8(sp)
    80003ac0:	02010413          	addi	s0,sp,32
    80003ac4:	03451793          	slli	a5,a0,0x34
    80003ac8:	04079c63          	bnez	a5,80003b20 <kfree+0x70>
    80003acc:	00003797          	auipc	a5,0x3
    80003ad0:	f8478793          	addi	a5,a5,-124 # 80006a50 <end>
    80003ad4:	00050493          	mv	s1,a0
    80003ad8:	04f56463          	bltu	a0,a5,80003b20 <kfree+0x70>
    80003adc:	01100793          	li	a5,17
    80003ae0:	01b79793          	slli	a5,a5,0x1b
    80003ae4:	02f57e63          	bgeu	a0,a5,80003b20 <kfree+0x70>
    80003ae8:	00001637          	lui	a2,0x1
    80003aec:	00100593          	li	a1,1
    80003af0:	00000097          	auipc	ra,0x0
    80003af4:	478080e7          	jalr	1144(ra) # 80003f68 <__memset>
    80003af8:	00002797          	auipc	a5,0x2
    80003afc:	cb878793          	addi	a5,a5,-840 # 800057b0 <kmem>
    80003b00:	0007b703          	ld	a4,0(a5)
    80003b04:	01813083          	ld	ra,24(sp)
    80003b08:	01013403          	ld	s0,16(sp)
    80003b0c:	00e4b023          	sd	a4,0(s1)
    80003b10:	0097b023          	sd	s1,0(a5)
    80003b14:	00813483          	ld	s1,8(sp)
    80003b18:	02010113          	addi	sp,sp,32
    80003b1c:	00008067          	ret
    80003b20:	00001517          	auipc	a0,0x1
    80003b24:	67850513          	addi	a0,a0,1656 # 80005198 <digits+0x18>
    80003b28:	fffff097          	auipc	ra,0xfffff
    80003b2c:	354080e7          	jalr	852(ra) # 80002e7c <panic>

0000000080003b30 <kalloc>:
    80003b30:	fe010113          	addi	sp,sp,-32
    80003b34:	00813823          	sd	s0,16(sp)
    80003b38:	00913423          	sd	s1,8(sp)
    80003b3c:	00113c23          	sd	ra,24(sp)
    80003b40:	02010413          	addi	s0,sp,32
    80003b44:	00002797          	auipc	a5,0x2
    80003b48:	c6c78793          	addi	a5,a5,-916 # 800057b0 <kmem>
    80003b4c:	0007b483          	ld	s1,0(a5)
    80003b50:	02048063          	beqz	s1,80003b70 <kalloc+0x40>
    80003b54:	0004b703          	ld	a4,0(s1)
    80003b58:	00001637          	lui	a2,0x1
    80003b5c:	00500593          	li	a1,5
    80003b60:	00048513          	mv	a0,s1
    80003b64:	00e7b023          	sd	a4,0(a5)
    80003b68:	00000097          	auipc	ra,0x0
    80003b6c:	400080e7          	jalr	1024(ra) # 80003f68 <__memset>
    80003b70:	01813083          	ld	ra,24(sp)
    80003b74:	01013403          	ld	s0,16(sp)
    80003b78:	00048513          	mv	a0,s1
    80003b7c:	00813483          	ld	s1,8(sp)
    80003b80:	02010113          	addi	sp,sp,32
    80003b84:	00008067          	ret

0000000080003b88 <initlock>:
    80003b88:	ff010113          	addi	sp,sp,-16
    80003b8c:	00813423          	sd	s0,8(sp)
    80003b90:	01010413          	addi	s0,sp,16
    80003b94:	00813403          	ld	s0,8(sp)
    80003b98:	00b53423          	sd	a1,8(a0)
    80003b9c:	00052023          	sw	zero,0(a0)
    80003ba0:	00053823          	sd	zero,16(a0)
    80003ba4:	01010113          	addi	sp,sp,16
    80003ba8:	00008067          	ret

0000000080003bac <acquire>:
    80003bac:	fe010113          	addi	sp,sp,-32
    80003bb0:	00813823          	sd	s0,16(sp)
    80003bb4:	00913423          	sd	s1,8(sp)
    80003bb8:	00113c23          	sd	ra,24(sp)
    80003bbc:	01213023          	sd	s2,0(sp)
    80003bc0:	02010413          	addi	s0,sp,32
    80003bc4:	00050493          	mv	s1,a0
    80003bc8:	10002973          	csrr	s2,sstatus
    80003bcc:	100027f3          	csrr	a5,sstatus
    80003bd0:	ffd7f793          	andi	a5,a5,-3
    80003bd4:	10079073          	csrw	sstatus,a5
    80003bd8:	fffff097          	auipc	ra,0xfffff
    80003bdc:	8ec080e7          	jalr	-1812(ra) # 800024c4 <mycpu>
    80003be0:	07852783          	lw	a5,120(a0)
    80003be4:	06078e63          	beqz	a5,80003c60 <acquire+0xb4>
    80003be8:	fffff097          	auipc	ra,0xfffff
    80003bec:	8dc080e7          	jalr	-1828(ra) # 800024c4 <mycpu>
    80003bf0:	07852783          	lw	a5,120(a0)
    80003bf4:	0004a703          	lw	a4,0(s1)
    80003bf8:	0017879b          	addiw	a5,a5,1
    80003bfc:	06f52c23          	sw	a5,120(a0)
    80003c00:	04071063          	bnez	a4,80003c40 <acquire+0x94>
    80003c04:	00100713          	li	a4,1
    80003c08:	00070793          	mv	a5,a4
    80003c0c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003c10:	0007879b          	sext.w	a5,a5
    80003c14:	fe079ae3          	bnez	a5,80003c08 <acquire+0x5c>
    80003c18:	0ff0000f          	fence
    80003c1c:	fffff097          	auipc	ra,0xfffff
    80003c20:	8a8080e7          	jalr	-1880(ra) # 800024c4 <mycpu>
    80003c24:	01813083          	ld	ra,24(sp)
    80003c28:	01013403          	ld	s0,16(sp)
    80003c2c:	00a4b823          	sd	a0,16(s1)
    80003c30:	00013903          	ld	s2,0(sp)
    80003c34:	00813483          	ld	s1,8(sp)
    80003c38:	02010113          	addi	sp,sp,32
    80003c3c:	00008067          	ret
    80003c40:	0104b903          	ld	s2,16(s1)
    80003c44:	fffff097          	auipc	ra,0xfffff
    80003c48:	880080e7          	jalr	-1920(ra) # 800024c4 <mycpu>
    80003c4c:	faa91ce3          	bne	s2,a0,80003c04 <acquire+0x58>
    80003c50:	00001517          	auipc	a0,0x1
    80003c54:	55050513          	addi	a0,a0,1360 # 800051a0 <digits+0x20>
    80003c58:	fffff097          	auipc	ra,0xfffff
    80003c5c:	224080e7          	jalr	548(ra) # 80002e7c <panic>
    80003c60:	00195913          	srli	s2,s2,0x1
    80003c64:	fffff097          	auipc	ra,0xfffff
    80003c68:	860080e7          	jalr	-1952(ra) # 800024c4 <mycpu>
    80003c6c:	00197913          	andi	s2,s2,1
    80003c70:	07252e23          	sw	s2,124(a0)
    80003c74:	f75ff06f          	j	80003be8 <acquire+0x3c>

0000000080003c78 <release>:
    80003c78:	fe010113          	addi	sp,sp,-32
    80003c7c:	00813823          	sd	s0,16(sp)
    80003c80:	00113c23          	sd	ra,24(sp)
    80003c84:	00913423          	sd	s1,8(sp)
    80003c88:	01213023          	sd	s2,0(sp)
    80003c8c:	02010413          	addi	s0,sp,32
    80003c90:	00052783          	lw	a5,0(a0)
    80003c94:	00079a63          	bnez	a5,80003ca8 <release+0x30>
    80003c98:	00001517          	auipc	a0,0x1
    80003c9c:	51050513          	addi	a0,a0,1296 # 800051a8 <digits+0x28>
    80003ca0:	fffff097          	auipc	ra,0xfffff
    80003ca4:	1dc080e7          	jalr	476(ra) # 80002e7c <panic>
    80003ca8:	01053903          	ld	s2,16(a0)
    80003cac:	00050493          	mv	s1,a0
    80003cb0:	fffff097          	auipc	ra,0xfffff
    80003cb4:	814080e7          	jalr	-2028(ra) # 800024c4 <mycpu>
    80003cb8:	fea910e3          	bne	s2,a0,80003c98 <release+0x20>
    80003cbc:	0004b823          	sd	zero,16(s1)
    80003cc0:	0ff0000f          	fence
    80003cc4:	0f50000f          	fence	iorw,ow
    80003cc8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003ccc:	ffffe097          	auipc	ra,0xffffe
    80003cd0:	7f8080e7          	jalr	2040(ra) # 800024c4 <mycpu>
    80003cd4:	100027f3          	csrr	a5,sstatus
    80003cd8:	0027f793          	andi	a5,a5,2
    80003cdc:	04079a63          	bnez	a5,80003d30 <release+0xb8>
    80003ce0:	07852783          	lw	a5,120(a0)
    80003ce4:	02f05e63          	blez	a5,80003d20 <release+0xa8>
    80003ce8:	fff7871b          	addiw	a4,a5,-1
    80003cec:	06e52c23          	sw	a4,120(a0)
    80003cf0:	00071c63          	bnez	a4,80003d08 <release+0x90>
    80003cf4:	07c52783          	lw	a5,124(a0)
    80003cf8:	00078863          	beqz	a5,80003d08 <release+0x90>
    80003cfc:	100027f3          	csrr	a5,sstatus
    80003d00:	0027e793          	ori	a5,a5,2
    80003d04:	10079073          	csrw	sstatus,a5
    80003d08:	01813083          	ld	ra,24(sp)
    80003d0c:	01013403          	ld	s0,16(sp)
    80003d10:	00813483          	ld	s1,8(sp)
    80003d14:	00013903          	ld	s2,0(sp)
    80003d18:	02010113          	addi	sp,sp,32
    80003d1c:	00008067          	ret
    80003d20:	00001517          	auipc	a0,0x1
    80003d24:	4a850513          	addi	a0,a0,1192 # 800051c8 <digits+0x48>
    80003d28:	fffff097          	auipc	ra,0xfffff
    80003d2c:	154080e7          	jalr	340(ra) # 80002e7c <panic>
    80003d30:	00001517          	auipc	a0,0x1
    80003d34:	48050513          	addi	a0,a0,1152 # 800051b0 <digits+0x30>
    80003d38:	fffff097          	auipc	ra,0xfffff
    80003d3c:	144080e7          	jalr	324(ra) # 80002e7c <panic>

0000000080003d40 <holding>:
    80003d40:	00052783          	lw	a5,0(a0)
    80003d44:	00079663          	bnez	a5,80003d50 <holding+0x10>
    80003d48:	00000513          	li	a0,0
    80003d4c:	00008067          	ret
    80003d50:	fe010113          	addi	sp,sp,-32
    80003d54:	00813823          	sd	s0,16(sp)
    80003d58:	00913423          	sd	s1,8(sp)
    80003d5c:	00113c23          	sd	ra,24(sp)
    80003d60:	02010413          	addi	s0,sp,32
    80003d64:	01053483          	ld	s1,16(a0)
    80003d68:	ffffe097          	auipc	ra,0xffffe
    80003d6c:	75c080e7          	jalr	1884(ra) # 800024c4 <mycpu>
    80003d70:	01813083          	ld	ra,24(sp)
    80003d74:	01013403          	ld	s0,16(sp)
    80003d78:	40a48533          	sub	a0,s1,a0
    80003d7c:	00153513          	seqz	a0,a0
    80003d80:	00813483          	ld	s1,8(sp)
    80003d84:	02010113          	addi	sp,sp,32
    80003d88:	00008067          	ret

0000000080003d8c <push_off>:
    80003d8c:	fe010113          	addi	sp,sp,-32
    80003d90:	00813823          	sd	s0,16(sp)
    80003d94:	00113c23          	sd	ra,24(sp)
    80003d98:	00913423          	sd	s1,8(sp)
    80003d9c:	02010413          	addi	s0,sp,32
    80003da0:	100024f3          	csrr	s1,sstatus
    80003da4:	100027f3          	csrr	a5,sstatus
    80003da8:	ffd7f793          	andi	a5,a5,-3
    80003dac:	10079073          	csrw	sstatus,a5
    80003db0:	ffffe097          	auipc	ra,0xffffe
    80003db4:	714080e7          	jalr	1812(ra) # 800024c4 <mycpu>
    80003db8:	07852783          	lw	a5,120(a0)
    80003dbc:	02078663          	beqz	a5,80003de8 <push_off+0x5c>
    80003dc0:	ffffe097          	auipc	ra,0xffffe
    80003dc4:	704080e7          	jalr	1796(ra) # 800024c4 <mycpu>
    80003dc8:	07852783          	lw	a5,120(a0)
    80003dcc:	01813083          	ld	ra,24(sp)
    80003dd0:	01013403          	ld	s0,16(sp)
    80003dd4:	0017879b          	addiw	a5,a5,1
    80003dd8:	06f52c23          	sw	a5,120(a0)
    80003ddc:	00813483          	ld	s1,8(sp)
    80003de0:	02010113          	addi	sp,sp,32
    80003de4:	00008067          	ret
    80003de8:	0014d493          	srli	s1,s1,0x1
    80003dec:	ffffe097          	auipc	ra,0xffffe
    80003df0:	6d8080e7          	jalr	1752(ra) # 800024c4 <mycpu>
    80003df4:	0014f493          	andi	s1,s1,1
    80003df8:	06952e23          	sw	s1,124(a0)
    80003dfc:	fc5ff06f          	j	80003dc0 <push_off+0x34>

0000000080003e00 <pop_off>:
    80003e00:	ff010113          	addi	sp,sp,-16
    80003e04:	00813023          	sd	s0,0(sp)
    80003e08:	00113423          	sd	ra,8(sp)
    80003e0c:	01010413          	addi	s0,sp,16
    80003e10:	ffffe097          	auipc	ra,0xffffe
    80003e14:	6b4080e7          	jalr	1716(ra) # 800024c4 <mycpu>
    80003e18:	100027f3          	csrr	a5,sstatus
    80003e1c:	0027f793          	andi	a5,a5,2
    80003e20:	04079663          	bnez	a5,80003e6c <pop_off+0x6c>
    80003e24:	07852783          	lw	a5,120(a0)
    80003e28:	02f05a63          	blez	a5,80003e5c <pop_off+0x5c>
    80003e2c:	fff7871b          	addiw	a4,a5,-1
    80003e30:	06e52c23          	sw	a4,120(a0)
    80003e34:	00071c63          	bnez	a4,80003e4c <pop_off+0x4c>
    80003e38:	07c52783          	lw	a5,124(a0)
    80003e3c:	00078863          	beqz	a5,80003e4c <pop_off+0x4c>
    80003e40:	100027f3          	csrr	a5,sstatus
    80003e44:	0027e793          	ori	a5,a5,2
    80003e48:	10079073          	csrw	sstatus,a5
    80003e4c:	00813083          	ld	ra,8(sp)
    80003e50:	00013403          	ld	s0,0(sp)
    80003e54:	01010113          	addi	sp,sp,16
    80003e58:	00008067          	ret
    80003e5c:	00001517          	auipc	a0,0x1
    80003e60:	36c50513          	addi	a0,a0,876 # 800051c8 <digits+0x48>
    80003e64:	fffff097          	auipc	ra,0xfffff
    80003e68:	018080e7          	jalr	24(ra) # 80002e7c <panic>
    80003e6c:	00001517          	auipc	a0,0x1
    80003e70:	34450513          	addi	a0,a0,836 # 800051b0 <digits+0x30>
    80003e74:	fffff097          	auipc	ra,0xfffff
    80003e78:	008080e7          	jalr	8(ra) # 80002e7c <panic>

0000000080003e7c <push_on>:
    80003e7c:	fe010113          	addi	sp,sp,-32
    80003e80:	00813823          	sd	s0,16(sp)
    80003e84:	00113c23          	sd	ra,24(sp)
    80003e88:	00913423          	sd	s1,8(sp)
    80003e8c:	02010413          	addi	s0,sp,32
    80003e90:	100024f3          	csrr	s1,sstatus
    80003e94:	100027f3          	csrr	a5,sstatus
    80003e98:	0027e793          	ori	a5,a5,2
    80003e9c:	10079073          	csrw	sstatus,a5
    80003ea0:	ffffe097          	auipc	ra,0xffffe
    80003ea4:	624080e7          	jalr	1572(ra) # 800024c4 <mycpu>
    80003ea8:	07852783          	lw	a5,120(a0)
    80003eac:	02078663          	beqz	a5,80003ed8 <push_on+0x5c>
    80003eb0:	ffffe097          	auipc	ra,0xffffe
    80003eb4:	614080e7          	jalr	1556(ra) # 800024c4 <mycpu>
    80003eb8:	07852783          	lw	a5,120(a0)
    80003ebc:	01813083          	ld	ra,24(sp)
    80003ec0:	01013403          	ld	s0,16(sp)
    80003ec4:	0017879b          	addiw	a5,a5,1
    80003ec8:	06f52c23          	sw	a5,120(a0)
    80003ecc:	00813483          	ld	s1,8(sp)
    80003ed0:	02010113          	addi	sp,sp,32
    80003ed4:	00008067          	ret
    80003ed8:	0014d493          	srli	s1,s1,0x1
    80003edc:	ffffe097          	auipc	ra,0xffffe
    80003ee0:	5e8080e7          	jalr	1512(ra) # 800024c4 <mycpu>
    80003ee4:	0014f493          	andi	s1,s1,1
    80003ee8:	06952e23          	sw	s1,124(a0)
    80003eec:	fc5ff06f          	j	80003eb0 <push_on+0x34>

0000000080003ef0 <pop_on>:
    80003ef0:	ff010113          	addi	sp,sp,-16
    80003ef4:	00813023          	sd	s0,0(sp)
    80003ef8:	00113423          	sd	ra,8(sp)
    80003efc:	01010413          	addi	s0,sp,16
    80003f00:	ffffe097          	auipc	ra,0xffffe
    80003f04:	5c4080e7          	jalr	1476(ra) # 800024c4 <mycpu>
    80003f08:	100027f3          	csrr	a5,sstatus
    80003f0c:	0027f793          	andi	a5,a5,2
    80003f10:	04078463          	beqz	a5,80003f58 <pop_on+0x68>
    80003f14:	07852783          	lw	a5,120(a0)
    80003f18:	02f05863          	blez	a5,80003f48 <pop_on+0x58>
    80003f1c:	fff7879b          	addiw	a5,a5,-1
    80003f20:	06f52c23          	sw	a5,120(a0)
    80003f24:	07853783          	ld	a5,120(a0)
    80003f28:	00079863          	bnez	a5,80003f38 <pop_on+0x48>
    80003f2c:	100027f3          	csrr	a5,sstatus
    80003f30:	ffd7f793          	andi	a5,a5,-3
    80003f34:	10079073          	csrw	sstatus,a5
    80003f38:	00813083          	ld	ra,8(sp)
    80003f3c:	00013403          	ld	s0,0(sp)
    80003f40:	01010113          	addi	sp,sp,16
    80003f44:	00008067          	ret
    80003f48:	00001517          	auipc	a0,0x1
    80003f4c:	2a850513          	addi	a0,a0,680 # 800051f0 <digits+0x70>
    80003f50:	fffff097          	auipc	ra,0xfffff
    80003f54:	f2c080e7          	jalr	-212(ra) # 80002e7c <panic>
    80003f58:	00001517          	auipc	a0,0x1
    80003f5c:	27850513          	addi	a0,a0,632 # 800051d0 <digits+0x50>
    80003f60:	fffff097          	auipc	ra,0xfffff
    80003f64:	f1c080e7          	jalr	-228(ra) # 80002e7c <panic>

0000000080003f68 <__memset>:
    80003f68:	ff010113          	addi	sp,sp,-16
    80003f6c:	00813423          	sd	s0,8(sp)
    80003f70:	01010413          	addi	s0,sp,16
    80003f74:	1a060e63          	beqz	a2,80004130 <__memset+0x1c8>
    80003f78:	40a007b3          	neg	a5,a0
    80003f7c:	0077f793          	andi	a5,a5,7
    80003f80:	00778693          	addi	a3,a5,7
    80003f84:	00b00813          	li	a6,11
    80003f88:	0ff5f593          	andi	a1,a1,255
    80003f8c:	fff6071b          	addiw	a4,a2,-1
    80003f90:	1b06e663          	bltu	a3,a6,8000413c <__memset+0x1d4>
    80003f94:	1cd76463          	bltu	a4,a3,8000415c <__memset+0x1f4>
    80003f98:	1a078e63          	beqz	a5,80004154 <__memset+0x1ec>
    80003f9c:	00b50023          	sb	a1,0(a0)
    80003fa0:	00100713          	li	a4,1
    80003fa4:	1ae78463          	beq	a5,a4,8000414c <__memset+0x1e4>
    80003fa8:	00b500a3          	sb	a1,1(a0)
    80003fac:	00200713          	li	a4,2
    80003fb0:	1ae78a63          	beq	a5,a4,80004164 <__memset+0x1fc>
    80003fb4:	00b50123          	sb	a1,2(a0)
    80003fb8:	00300713          	li	a4,3
    80003fbc:	18e78463          	beq	a5,a4,80004144 <__memset+0x1dc>
    80003fc0:	00b501a3          	sb	a1,3(a0)
    80003fc4:	00400713          	li	a4,4
    80003fc8:	1ae78263          	beq	a5,a4,8000416c <__memset+0x204>
    80003fcc:	00b50223          	sb	a1,4(a0)
    80003fd0:	00500713          	li	a4,5
    80003fd4:	1ae78063          	beq	a5,a4,80004174 <__memset+0x20c>
    80003fd8:	00b502a3          	sb	a1,5(a0)
    80003fdc:	00700713          	li	a4,7
    80003fe0:	18e79e63          	bne	a5,a4,8000417c <__memset+0x214>
    80003fe4:	00b50323          	sb	a1,6(a0)
    80003fe8:	00700e93          	li	t4,7
    80003fec:	00859713          	slli	a4,a1,0x8
    80003ff0:	00e5e733          	or	a4,a1,a4
    80003ff4:	01059e13          	slli	t3,a1,0x10
    80003ff8:	01c76e33          	or	t3,a4,t3
    80003ffc:	01859313          	slli	t1,a1,0x18
    80004000:	006e6333          	or	t1,t3,t1
    80004004:	02059893          	slli	a7,a1,0x20
    80004008:	40f60e3b          	subw	t3,a2,a5
    8000400c:	011368b3          	or	a7,t1,a7
    80004010:	02859813          	slli	a6,a1,0x28
    80004014:	0108e833          	or	a6,a7,a6
    80004018:	03059693          	slli	a3,a1,0x30
    8000401c:	003e589b          	srliw	a7,t3,0x3
    80004020:	00d866b3          	or	a3,a6,a3
    80004024:	03859713          	slli	a4,a1,0x38
    80004028:	00389813          	slli	a6,a7,0x3
    8000402c:	00f507b3          	add	a5,a0,a5
    80004030:	00e6e733          	or	a4,a3,a4
    80004034:	000e089b          	sext.w	a7,t3
    80004038:	00f806b3          	add	a3,a6,a5
    8000403c:	00e7b023          	sd	a4,0(a5)
    80004040:	00878793          	addi	a5,a5,8
    80004044:	fed79ce3          	bne	a5,a3,8000403c <__memset+0xd4>
    80004048:	ff8e7793          	andi	a5,t3,-8
    8000404c:	0007871b          	sext.w	a4,a5
    80004050:	01d787bb          	addw	a5,a5,t4
    80004054:	0ce88e63          	beq	a7,a4,80004130 <__memset+0x1c8>
    80004058:	00f50733          	add	a4,a0,a5
    8000405c:	00b70023          	sb	a1,0(a4)
    80004060:	0017871b          	addiw	a4,a5,1
    80004064:	0cc77663          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    80004068:	00e50733          	add	a4,a0,a4
    8000406c:	00b70023          	sb	a1,0(a4)
    80004070:	0027871b          	addiw	a4,a5,2
    80004074:	0ac77e63          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    80004078:	00e50733          	add	a4,a0,a4
    8000407c:	00b70023          	sb	a1,0(a4)
    80004080:	0037871b          	addiw	a4,a5,3
    80004084:	0ac77663          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    80004088:	00e50733          	add	a4,a0,a4
    8000408c:	00b70023          	sb	a1,0(a4)
    80004090:	0047871b          	addiw	a4,a5,4
    80004094:	08c77e63          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    80004098:	00e50733          	add	a4,a0,a4
    8000409c:	00b70023          	sb	a1,0(a4)
    800040a0:	0057871b          	addiw	a4,a5,5
    800040a4:	08c77663          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    800040a8:	00e50733          	add	a4,a0,a4
    800040ac:	00b70023          	sb	a1,0(a4)
    800040b0:	0067871b          	addiw	a4,a5,6
    800040b4:	06c77e63          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    800040b8:	00e50733          	add	a4,a0,a4
    800040bc:	00b70023          	sb	a1,0(a4)
    800040c0:	0077871b          	addiw	a4,a5,7
    800040c4:	06c77663          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    800040c8:	00e50733          	add	a4,a0,a4
    800040cc:	00b70023          	sb	a1,0(a4)
    800040d0:	0087871b          	addiw	a4,a5,8
    800040d4:	04c77e63          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    800040d8:	00e50733          	add	a4,a0,a4
    800040dc:	00b70023          	sb	a1,0(a4)
    800040e0:	0097871b          	addiw	a4,a5,9
    800040e4:	04c77663          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    800040e8:	00e50733          	add	a4,a0,a4
    800040ec:	00b70023          	sb	a1,0(a4)
    800040f0:	00a7871b          	addiw	a4,a5,10
    800040f4:	02c77e63          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    800040f8:	00e50733          	add	a4,a0,a4
    800040fc:	00b70023          	sb	a1,0(a4)
    80004100:	00b7871b          	addiw	a4,a5,11
    80004104:	02c77663          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    80004108:	00e50733          	add	a4,a0,a4
    8000410c:	00b70023          	sb	a1,0(a4)
    80004110:	00c7871b          	addiw	a4,a5,12
    80004114:	00c77e63          	bgeu	a4,a2,80004130 <__memset+0x1c8>
    80004118:	00e50733          	add	a4,a0,a4
    8000411c:	00b70023          	sb	a1,0(a4)
    80004120:	00d7879b          	addiw	a5,a5,13
    80004124:	00c7f663          	bgeu	a5,a2,80004130 <__memset+0x1c8>
    80004128:	00f507b3          	add	a5,a0,a5
    8000412c:	00b78023          	sb	a1,0(a5)
    80004130:	00813403          	ld	s0,8(sp)
    80004134:	01010113          	addi	sp,sp,16
    80004138:	00008067          	ret
    8000413c:	00b00693          	li	a3,11
    80004140:	e55ff06f          	j	80003f94 <__memset+0x2c>
    80004144:	00300e93          	li	t4,3
    80004148:	ea5ff06f          	j	80003fec <__memset+0x84>
    8000414c:	00100e93          	li	t4,1
    80004150:	e9dff06f          	j	80003fec <__memset+0x84>
    80004154:	00000e93          	li	t4,0
    80004158:	e95ff06f          	j	80003fec <__memset+0x84>
    8000415c:	00000793          	li	a5,0
    80004160:	ef9ff06f          	j	80004058 <__memset+0xf0>
    80004164:	00200e93          	li	t4,2
    80004168:	e85ff06f          	j	80003fec <__memset+0x84>
    8000416c:	00400e93          	li	t4,4
    80004170:	e7dff06f          	j	80003fec <__memset+0x84>
    80004174:	00500e93          	li	t4,5
    80004178:	e75ff06f          	j	80003fec <__memset+0x84>
    8000417c:	00600e93          	li	t4,6
    80004180:	e6dff06f          	j	80003fec <__memset+0x84>

0000000080004184 <__memmove>:
    80004184:	ff010113          	addi	sp,sp,-16
    80004188:	00813423          	sd	s0,8(sp)
    8000418c:	01010413          	addi	s0,sp,16
    80004190:	0e060863          	beqz	a2,80004280 <__memmove+0xfc>
    80004194:	fff6069b          	addiw	a3,a2,-1
    80004198:	0006881b          	sext.w	a6,a3
    8000419c:	0ea5e863          	bltu	a1,a0,8000428c <__memmove+0x108>
    800041a0:	00758713          	addi	a4,a1,7
    800041a4:	00a5e7b3          	or	a5,a1,a0
    800041a8:	40a70733          	sub	a4,a4,a0
    800041ac:	0077f793          	andi	a5,a5,7
    800041b0:	00f73713          	sltiu	a4,a4,15
    800041b4:	00174713          	xori	a4,a4,1
    800041b8:	0017b793          	seqz	a5,a5
    800041bc:	00e7f7b3          	and	a5,a5,a4
    800041c0:	10078863          	beqz	a5,800042d0 <__memmove+0x14c>
    800041c4:	00900793          	li	a5,9
    800041c8:	1107f463          	bgeu	a5,a6,800042d0 <__memmove+0x14c>
    800041cc:	0036581b          	srliw	a6,a2,0x3
    800041d0:	fff8081b          	addiw	a6,a6,-1
    800041d4:	02081813          	slli	a6,a6,0x20
    800041d8:	01d85893          	srli	a7,a6,0x1d
    800041dc:	00858813          	addi	a6,a1,8
    800041e0:	00058793          	mv	a5,a1
    800041e4:	00050713          	mv	a4,a0
    800041e8:	01088833          	add	a6,a7,a6
    800041ec:	0007b883          	ld	a7,0(a5)
    800041f0:	00878793          	addi	a5,a5,8
    800041f4:	00870713          	addi	a4,a4,8
    800041f8:	ff173c23          	sd	a7,-8(a4)
    800041fc:	ff0798e3          	bne	a5,a6,800041ec <__memmove+0x68>
    80004200:	ff867713          	andi	a4,a2,-8
    80004204:	02071793          	slli	a5,a4,0x20
    80004208:	0207d793          	srli	a5,a5,0x20
    8000420c:	00f585b3          	add	a1,a1,a5
    80004210:	40e686bb          	subw	a3,a3,a4
    80004214:	00f507b3          	add	a5,a0,a5
    80004218:	06e60463          	beq	a2,a4,80004280 <__memmove+0xfc>
    8000421c:	0005c703          	lbu	a4,0(a1)
    80004220:	00e78023          	sb	a4,0(a5)
    80004224:	04068e63          	beqz	a3,80004280 <__memmove+0xfc>
    80004228:	0015c603          	lbu	a2,1(a1)
    8000422c:	00100713          	li	a4,1
    80004230:	00c780a3          	sb	a2,1(a5)
    80004234:	04e68663          	beq	a3,a4,80004280 <__memmove+0xfc>
    80004238:	0025c603          	lbu	a2,2(a1)
    8000423c:	00200713          	li	a4,2
    80004240:	00c78123          	sb	a2,2(a5)
    80004244:	02e68e63          	beq	a3,a4,80004280 <__memmove+0xfc>
    80004248:	0035c603          	lbu	a2,3(a1)
    8000424c:	00300713          	li	a4,3
    80004250:	00c781a3          	sb	a2,3(a5)
    80004254:	02e68663          	beq	a3,a4,80004280 <__memmove+0xfc>
    80004258:	0045c603          	lbu	a2,4(a1)
    8000425c:	00400713          	li	a4,4
    80004260:	00c78223          	sb	a2,4(a5)
    80004264:	00e68e63          	beq	a3,a4,80004280 <__memmove+0xfc>
    80004268:	0055c603          	lbu	a2,5(a1)
    8000426c:	00500713          	li	a4,5
    80004270:	00c782a3          	sb	a2,5(a5)
    80004274:	00e68663          	beq	a3,a4,80004280 <__memmove+0xfc>
    80004278:	0065c703          	lbu	a4,6(a1)
    8000427c:	00e78323          	sb	a4,6(a5)
    80004280:	00813403          	ld	s0,8(sp)
    80004284:	01010113          	addi	sp,sp,16
    80004288:	00008067          	ret
    8000428c:	02061713          	slli	a4,a2,0x20
    80004290:	02075713          	srli	a4,a4,0x20
    80004294:	00e587b3          	add	a5,a1,a4
    80004298:	f0f574e3          	bgeu	a0,a5,800041a0 <__memmove+0x1c>
    8000429c:	02069613          	slli	a2,a3,0x20
    800042a0:	02065613          	srli	a2,a2,0x20
    800042a4:	fff64613          	not	a2,a2
    800042a8:	00e50733          	add	a4,a0,a4
    800042ac:	00c78633          	add	a2,a5,a2
    800042b0:	fff7c683          	lbu	a3,-1(a5)
    800042b4:	fff78793          	addi	a5,a5,-1
    800042b8:	fff70713          	addi	a4,a4,-1
    800042bc:	00d70023          	sb	a3,0(a4)
    800042c0:	fec798e3          	bne	a5,a2,800042b0 <__memmove+0x12c>
    800042c4:	00813403          	ld	s0,8(sp)
    800042c8:	01010113          	addi	sp,sp,16
    800042cc:	00008067          	ret
    800042d0:	02069713          	slli	a4,a3,0x20
    800042d4:	02075713          	srli	a4,a4,0x20
    800042d8:	00170713          	addi	a4,a4,1
    800042dc:	00e50733          	add	a4,a0,a4
    800042e0:	00050793          	mv	a5,a0
    800042e4:	0005c683          	lbu	a3,0(a1)
    800042e8:	00178793          	addi	a5,a5,1
    800042ec:	00158593          	addi	a1,a1,1
    800042f0:	fed78fa3          	sb	a3,-1(a5)
    800042f4:	fee798e3          	bne	a5,a4,800042e4 <__memmove+0x160>
    800042f8:	f89ff06f          	j	80004280 <__memmove+0xfc>

00000000800042fc <__putc>:
    800042fc:	fe010113          	addi	sp,sp,-32
    80004300:	00813823          	sd	s0,16(sp)
    80004304:	00113c23          	sd	ra,24(sp)
    80004308:	02010413          	addi	s0,sp,32
    8000430c:	00050793          	mv	a5,a0
    80004310:	fef40593          	addi	a1,s0,-17
    80004314:	00100613          	li	a2,1
    80004318:	00000513          	li	a0,0
    8000431c:	fef407a3          	sb	a5,-17(s0)
    80004320:	fffff097          	auipc	ra,0xfffff
    80004324:	b3c080e7          	jalr	-1220(ra) # 80002e5c <console_write>
    80004328:	01813083          	ld	ra,24(sp)
    8000432c:	01013403          	ld	s0,16(sp)
    80004330:	02010113          	addi	sp,sp,32
    80004334:	00008067          	ret

0000000080004338 <__getc>:
    80004338:	fe010113          	addi	sp,sp,-32
    8000433c:	00813823          	sd	s0,16(sp)
    80004340:	00113c23          	sd	ra,24(sp)
    80004344:	02010413          	addi	s0,sp,32
    80004348:	fe840593          	addi	a1,s0,-24
    8000434c:	00100613          	li	a2,1
    80004350:	00000513          	li	a0,0
    80004354:	fffff097          	auipc	ra,0xfffff
    80004358:	ae8080e7          	jalr	-1304(ra) # 80002e3c <console_read>
    8000435c:	fe844503          	lbu	a0,-24(s0)
    80004360:	01813083          	ld	ra,24(sp)
    80004364:	01013403          	ld	s0,16(sp)
    80004368:	02010113          	addi	sp,sp,32
    8000436c:	00008067          	ret

0000000080004370 <console_handler>:
    80004370:	fe010113          	addi	sp,sp,-32
    80004374:	00813823          	sd	s0,16(sp)
    80004378:	00113c23          	sd	ra,24(sp)
    8000437c:	00913423          	sd	s1,8(sp)
    80004380:	02010413          	addi	s0,sp,32
    80004384:	14202773          	csrr	a4,scause
    80004388:	100027f3          	csrr	a5,sstatus
    8000438c:	0027f793          	andi	a5,a5,2
    80004390:	06079e63          	bnez	a5,8000440c <console_handler+0x9c>
    80004394:	00074c63          	bltz	a4,800043ac <console_handler+0x3c>
    80004398:	01813083          	ld	ra,24(sp)
    8000439c:	01013403          	ld	s0,16(sp)
    800043a0:	00813483          	ld	s1,8(sp)
    800043a4:	02010113          	addi	sp,sp,32
    800043a8:	00008067          	ret
    800043ac:	0ff77713          	andi	a4,a4,255
    800043b0:	00900793          	li	a5,9
    800043b4:	fef712e3          	bne	a4,a5,80004398 <console_handler+0x28>
    800043b8:	ffffe097          	auipc	ra,0xffffe
    800043bc:	6dc080e7          	jalr	1756(ra) # 80002a94 <plic_claim>
    800043c0:	00a00793          	li	a5,10
    800043c4:	00050493          	mv	s1,a0
    800043c8:	02f50c63          	beq	a0,a5,80004400 <console_handler+0x90>
    800043cc:	fc0506e3          	beqz	a0,80004398 <console_handler+0x28>
    800043d0:	00050593          	mv	a1,a0
    800043d4:	00001517          	auipc	a0,0x1
    800043d8:	d2450513          	addi	a0,a0,-732 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    800043dc:	fffff097          	auipc	ra,0xfffff
    800043e0:	afc080e7          	jalr	-1284(ra) # 80002ed8 <__printf>
    800043e4:	01013403          	ld	s0,16(sp)
    800043e8:	01813083          	ld	ra,24(sp)
    800043ec:	00048513          	mv	a0,s1
    800043f0:	00813483          	ld	s1,8(sp)
    800043f4:	02010113          	addi	sp,sp,32
    800043f8:	ffffe317          	auipc	t1,0xffffe
    800043fc:	6d430067          	jr	1748(t1) # 80002acc <plic_complete>
    80004400:	fffff097          	auipc	ra,0xfffff
    80004404:	3e0080e7          	jalr	992(ra) # 800037e0 <uartintr>
    80004408:	fddff06f          	j	800043e4 <console_handler+0x74>
    8000440c:	00001517          	auipc	a0,0x1
    80004410:	dec50513          	addi	a0,a0,-532 # 800051f8 <digits+0x78>
    80004414:	fffff097          	auipc	ra,0xfffff
    80004418:	a68080e7          	jalr	-1432(ra) # 80002e7c <panic>
	...
