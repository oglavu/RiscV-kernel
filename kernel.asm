
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	87813103          	ld	sp,-1928(sp) # 80005878 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	5b8020ef          	jal	ra,800025d4 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5RiscV13setStvecTableEv>:

.global _ZN5RiscV13setStvecTableEv
.align 4
.type _ZN5RiscV13setStvecTableEv, @function
_ZN5RiscV13setStvecTableEv:
    j softwareInterrupt #offs 0*4
    80001000:	02c0006f          	j	8000102c <softwareInterrupt>
    j timerInterrupt    #offs 1*4
    80001004:	1380006f          	j	8000113c <timerInterrupt>
	...
    .skip 28
    j consoleInterrupt  #offs 9*4
    80001024:	2280006f          	j	8000124c <consoleInterrupt>
    sret
    80001028:	10200073          	sret

000000008000102c <softwareInterrupt>:


softwareInterrupt:
    PUSH_REGS
    8000102c:	f0010113          	addi	sp,sp,-256
    80001030:	00013023          	sd	zero,0(sp)
    80001034:	00113423          	sd	ra,8(sp)
    80001038:	00213823          	sd	sp,16(sp)
    8000103c:	00313c23          	sd	gp,24(sp)
    80001040:	02413023          	sd	tp,32(sp)
    80001044:	02513423          	sd	t0,40(sp)
    80001048:	02613823          	sd	t1,48(sp)
    8000104c:	02713c23          	sd	t2,56(sp)
    80001050:	04813023          	sd	s0,64(sp)
    80001054:	04913423          	sd	s1,72(sp)
    80001058:	04a13823          	sd	a0,80(sp)
    8000105c:	04b13c23          	sd	a1,88(sp)
    80001060:	06c13023          	sd	a2,96(sp)
    80001064:	06d13423          	sd	a3,104(sp)
    80001068:	06e13823          	sd	a4,112(sp)
    8000106c:	06f13c23          	sd	a5,120(sp)
    80001070:	09013023          	sd	a6,128(sp)
    80001074:	09113423          	sd	a7,136(sp)
    80001078:	09213823          	sd	s2,144(sp)
    8000107c:	09313c23          	sd	s3,152(sp)
    80001080:	0b413023          	sd	s4,160(sp)
    80001084:	0b513423          	sd	s5,168(sp)
    80001088:	0b613823          	sd	s6,176(sp)
    8000108c:	0b713c23          	sd	s7,184(sp)
    80001090:	0d813023          	sd	s8,192(sp)
    80001094:	0d913423          	sd	s9,200(sp)
    80001098:	0da13823          	sd	s10,208(sp)
    8000109c:	0db13c23          	sd	s11,216(sp)
    800010a0:	0fc13023          	sd	t3,224(sp)
    800010a4:	0fd13423          	sd	t4,232(sp)
    800010a8:	0fe13823          	sd	t5,240(sp)
    800010ac:	0ff13c23          	sd	t6,248(sp)
    call _ZN17interruptHandlers20handleSupervisorTrapEv
    800010b0:	7d5000ef          	jal	ra,80002084 <_ZN17interruptHandlers20handleSupervisorTrapEv>
    POP_REGS
    800010b4:	00013003          	ld	zero,0(sp)
    800010b8:	00813083          	ld	ra,8(sp)
    800010bc:	01013103          	ld	sp,16(sp)
    800010c0:	01813183          	ld	gp,24(sp)
    800010c4:	02013203          	ld	tp,32(sp)
    800010c8:	02813283          	ld	t0,40(sp)
    800010cc:	03013303          	ld	t1,48(sp)
    800010d0:	03813383          	ld	t2,56(sp)
    800010d4:	04013403          	ld	s0,64(sp)
    800010d8:	04813483          	ld	s1,72(sp)
    800010dc:	05013503          	ld	a0,80(sp)
    800010e0:	05813583          	ld	a1,88(sp)
    800010e4:	06013603          	ld	a2,96(sp)
    800010e8:	06813683          	ld	a3,104(sp)
    800010ec:	07013703          	ld	a4,112(sp)
    800010f0:	07813783          	ld	a5,120(sp)
    800010f4:	08013803          	ld	a6,128(sp)
    800010f8:	08813883          	ld	a7,136(sp)
    800010fc:	09013903          	ld	s2,144(sp)
    80001100:	09813983          	ld	s3,152(sp)
    80001104:	0a013a03          	ld	s4,160(sp)
    80001108:	0a813a83          	ld	s5,168(sp)
    8000110c:	0b013b03          	ld	s6,176(sp)
    80001110:	0b813b83          	ld	s7,184(sp)
    80001114:	0c013c03          	ld	s8,192(sp)
    80001118:	0c813c83          	ld	s9,200(sp)
    8000111c:	0d013d03          	ld	s10,208(sp)
    80001120:	0d813d83          	ld	s11,216(sp)
    80001124:	0e013e03          	ld	t3,224(sp)
    80001128:	0e813e83          	ld	t4,232(sp)
    8000112c:	0f013f03          	ld	t5,240(sp)
    80001130:	0f813f83          	ld	t6,248(sp)
    80001134:	10010113          	addi	sp,sp,256
    sret
    80001138:	10200073          	sret

000000008000113c <timerInterrupt>:


timerInterrupt:
    PUSH_REGS
    8000113c:	f0010113          	addi	sp,sp,-256
    80001140:	00013023          	sd	zero,0(sp)
    80001144:	00113423          	sd	ra,8(sp)
    80001148:	00213823          	sd	sp,16(sp)
    8000114c:	00313c23          	sd	gp,24(sp)
    80001150:	02413023          	sd	tp,32(sp)
    80001154:	02513423          	sd	t0,40(sp)
    80001158:	02613823          	sd	t1,48(sp)
    8000115c:	02713c23          	sd	t2,56(sp)
    80001160:	04813023          	sd	s0,64(sp)
    80001164:	04913423          	sd	s1,72(sp)
    80001168:	04a13823          	sd	a0,80(sp)
    8000116c:	04b13c23          	sd	a1,88(sp)
    80001170:	06c13023          	sd	a2,96(sp)
    80001174:	06d13423          	sd	a3,104(sp)
    80001178:	06e13823          	sd	a4,112(sp)
    8000117c:	06f13c23          	sd	a5,120(sp)
    80001180:	09013023          	sd	a6,128(sp)
    80001184:	09113423          	sd	a7,136(sp)
    80001188:	09213823          	sd	s2,144(sp)
    8000118c:	09313c23          	sd	s3,152(sp)
    80001190:	0b413023          	sd	s4,160(sp)
    80001194:	0b513423          	sd	s5,168(sp)
    80001198:	0b613823          	sd	s6,176(sp)
    8000119c:	0b713c23          	sd	s7,184(sp)
    800011a0:	0d813023          	sd	s8,192(sp)
    800011a4:	0d913423          	sd	s9,200(sp)
    800011a8:	0da13823          	sd	s10,208(sp)
    800011ac:	0db13c23          	sd	s11,216(sp)
    800011b0:	0fc13023          	sd	t3,224(sp)
    800011b4:	0fd13423          	sd	t4,232(sp)
    800011b8:	0fe13823          	sd	t5,240(sp)
    800011bc:	0ff13c23          	sd	t6,248(sp)
    call _ZN17interruptHandlers20handleTimerInterruptEv
    800011c0:	7a1000ef          	jal	ra,80002160 <_ZN17interruptHandlers20handleTimerInterruptEv>
    POP_REGS
    800011c4:	00013003          	ld	zero,0(sp)
    800011c8:	00813083          	ld	ra,8(sp)
    800011cc:	01013103          	ld	sp,16(sp)
    800011d0:	01813183          	ld	gp,24(sp)
    800011d4:	02013203          	ld	tp,32(sp)
    800011d8:	02813283          	ld	t0,40(sp)
    800011dc:	03013303          	ld	t1,48(sp)
    800011e0:	03813383          	ld	t2,56(sp)
    800011e4:	04013403          	ld	s0,64(sp)
    800011e8:	04813483          	ld	s1,72(sp)
    800011ec:	05013503          	ld	a0,80(sp)
    800011f0:	05813583          	ld	a1,88(sp)
    800011f4:	06013603          	ld	a2,96(sp)
    800011f8:	06813683          	ld	a3,104(sp)
    800011fc:	07013703          	ld	a4,112(sp)
    80001200:	07813783          	ld	a5,120(sp)
    80001204:	08013803          	ld	a6,128(sp)
    80001208:	08813883          	ld	a7,136(sp)
    8000120c:	09013903          	ld	s2,144(sp)
    80001210:	09813983          	ld	s3,152(sp)
    80001214:	0a013a03          	ld	s4,160(sp)
    80001218:	0a813a83          	ld	s5,168(sp)
    8000121c:	0b013b03          	ld	s6,176(sp)
    80001220:	0b813b83          	ld	s7,184(sp)
    80001224:	0c013c03          	ld	s8,192(sp)
    80001228:	0c813c83          	ld	s9,200(sp)
    8000122c:	0d013d03          	ld	s10,208(sp)
    80001230:	0d813d83          	ld	s11,216(sp)
    80001234:	0e013e03          	ld	t3,224(sp)
    80001238:	0e813e83          	ld	t4,232(sp)
    8000123c:	0f013f03          	ld	t5,240(sp)
    80001240:	0f813f83          	ld	t6,248(sp)
    80001244:	10010113          	addi	sp,sp,256
    sret
    80001248:	10200073          	sret

000000008000124c <consoleInterrupt>:


consoleInterrupt:
    PUSH_REGS
    8000124c:	f0010113          	addi	sp,sp,-256
    80001250:	00013023          	sd	zero,0(sp)
    80001254:	00113423          	sd	ra,8(sp)
    80001258:	00213823          	sd	sp,16(sp)
    8000125c:	00313c23          	sd	gp,24(sp)
    80001260:	02413023          	sd	tp,32(sp)
    80001264:	02513423          	sd	t0,40(sp)
    80001268:	02613823          	sd	t1,48(sp)
    8000126c:	02713c23          	sd	t2,56(sp)
    80001270:	04813023          	sd	s0,64(sp)
    80001274:	04913423          	sd	s1,72(sp)
    80001278:	04a13823          	sd	a0,80(sp)
    8000127c:	04b13c23          	sd	a1,88(sp)
    80001280:	06c13023          	sd	a2,96(sp)
    80001284:	06d13423          	sd	a3,104(sp)
    80001288:	06e13823          	sd	a4,112(sp)
    8000128c:	06f13c23          	sd	a5,120(sp)
    80001290:	09013023          	sd	a6,128(sp)
    80001294:	09113423          	sd	a7,136(sp)
    80001298:	09213823          	sd	s2,144(sp)
    8000129c:	09313c23          	sd	s3,152(sp)
    800012a0:	0b413023          	sd	s4,160(sp)
    800012a4:	0b513423          	sd	s5,168(sp)
    800012a8:	0b613823          	sd	s6,176(sp)
    800012ac:	0b713c23          	sd	s7,184(sp)
    800012b0:	0d813023          	sd	s8,192(sp)
    800012b4:	0d913423          	sd	s9,200(sp)
    800012b8:	0da13823          	sd	s10,208(sp)
    800012bc:	0db13c23          	sd	s11,216(sp)
    800012c0:	0fc13023          	sd	t3,224(sp)
    800012c4:	0fd13423          	sd	t4,232(sp)
    800012c8:	0fe13823          	sd	t5,240(sp)
    800012cc:	0ff13c23          	sd	t6,248(sp)
    call _ZN17interruptHandlers22handleConsoleInterruptEv
    800012d0:	669000ef          	jal	ra,80002138 <_ZN17interruptHandlers22handleConsoleInterruptEv>
    POP_REGS
    800012d4:	00013003          	ld	zero,0(sp)
    800012d8:	00813083          	ld	ra,8(sp)
    800012dc:	01013103          	ld	sp,16(sp)
    800012e0:	01813183          	ld	gp,24(sp)
    800012e4:	02013203          	ld	tp,32(sp)
    800012e8:	02813283          	ld	t0,40(sp)
    800012ec:	03013303          	ld	t1,48(sp)
    800012f0:	03813383          	ld	t2,56(sp)
    800012f4:	04013403          	ld	s0,64(sp)
    800012f8:	04813483          	ld	s1,72(sp)
    800012fc:	05013503          	ld	a0,80(sp)
    80001300:	05813583          	ld	a1,88(sp)
    80001304:	06013603          	ld	a2,96(sp)
    80001308:	06813683          	ld	a3,104(sp)
    8000130c:	07013703          	ld	a4,112(sp)
    80001310:	07813783          	ld	a5,120(sp)
    80001314:	08013803          	ld	a6,128(sp)
    80001318:	08813883          	ld	a7,136(sp)
    8000131c:	09013903          	ld	s2,144(sp)
    80001320:	09813983          	ld	s3,152(sp)
    80001324:	0a013a03          	ld	s4,160(sp)
    80001328:	0a813a83          	ld	s5,168(sp)
    8000132c:	0b013b03          	ld	s6,176(sp)
    80001330:	0b813b83          	ld	s7,184(sp)
    80001334:	0c013c03          	ld	s8,192(sp)
    80001338:	0c813c83          	ld	s9,200(sp)
    8000133c:	0d013d03          	ld	s10,208(sp)
    80001340:	0d813d83          	ld	s11,216(sp)
    80001344:	0e013e03          	ld	t3,224(sp)
    80001348:	0e813e83          	ld	t4,232(sp)
    8000134c:	0f013f03          	ld	t5,240(sp)
    80001350:	0f813f83          	ld	t6,248(sp)
    80001354:	10010113          	addi	sp,sp,256
    sret
    80001358:	10200073          	sret
	...

0000000080001368 <_Z9mem_allocm>:
//

#include "../h/syscall_c.h"


void* mem_alloc(size_t size) {
    80001368:	fe010113          	addi	sp,sp,-32
    8000136c:	00813c23          	sd	s0,24(sp)
    80001370:	02010413          	addi	s0,sp,32
    __asm__ volatile ("mv %0, a1" : "=r"(a1));
    return a1;
}

inline void RiscV::a1W(uint64 val) {
    __asm__ volatile ("mv a1, %0" : : "r"(val));
    80001374:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(val));
    80001378:	00100793          	li	a5,1
    8000137c:	00078513          	mv	a0,a5
    RiscV::a1W(size);
    RiscV::a0W(RiscV::CodeOps::MEM_ALOC);

    __asm__ volatile ("ecall");
    80001380:	00000073          	ecall

    uint64 volatile retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    80001384:	00050793          	mv	a5,a0
    80001388:	fef43423          	sd	a5,-24(s0)
    return (void*) retVal;
    8000138c:	fe843503          	ld	a0,-24(s0)
}
    80001390:	01813403          	ld	s0,24(sp)
    80001394:	02010113          	addi	sp,sp,32
    80001398:	00008067          	ret

000000008000139c <_Z8mem_freePv>:


int mem_free(void* ptr){
    8000139c:	ff010113          	addi	sp,sp,-16
    800013a0:	00813423          	sd	s0,8(sp)
    800013a4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(val));
    800013a8:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(val));
    800013ac:	00200793          	li	a5,2
    800013b0:	00078513          	mv	a0,a5
    RiscV::a1W((uint64)ptr);
    RiscV::a0W(RiscV::CodeOps::MEM_FREE);

    __asm__ volatile ("ecall");
    800013b4:	00000073          	ecall

    uint64 retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    800013b8:	00050513          	mv	a0,a0
    return (int) retVal;
    800013bc:	0005051b          	sext.w	a0,a0
    800013c0:	00813403          	ld	s0,8(sp)
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <_ZN7AVLTree11findFreeSegEPS_m>:
// Created by os on 5/1/24.
//

#include "../h/AVLTree.h"

AVLTree* AVLTree::findFreeSeg(AVLTree* root, size_t size) {
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00813423          	sd	s0,8(sp)
    800013d4:	01010413          	addi	s0,sp,16
    800013d8:	00050793          	mv	a5,a0
    AVLTree* cur = root, *BestFit = nullptr;
    800013dc:	00000513          	li	a0,0
    800013e0:	0080006f          	j	800013e8 <_ZN7AVLTree11findFreeSegEPS_m+0x1c>
        if (cur->sz == size)
            return cur;
        if (cur->sz > size) {
            BestFit = cur; cur = cur->left;
        } else
            cur = cur->right;
    800013e4:	0087b783          	ld	a5,8(a5)
    while(cur) {
    800013e8:	02078063          	beqz	a5,80001408 <_ZN7AVLTree11findFreeSegEPS_m+0x3c>
        if (cur->sz == size)
    800013ec:	0387b703          	ld	a4,56(a5)
    800013f0:	00b70a63          	beq	a4,a1,80001404 <_ZN7AVLTree11findFreeSegEPS_m+0x38>
        if (cur->sz > size) {
    800013f4:	fee5f8e3          	bgeu	a1,a4,800013e4 <_ZN7AVLTree11findFreeSegEPS_m+0x18>
            BestFit = cur; cur = cur->left;
    800013f8:	00078513          	mv	a0,a5
    800013fc:	0007b783          	ld	a5,0(a5)
    80001400:	fe9ff06f          	j	800013e8 <_ZN7AVLTree11findFreeSegEPS_m+0x1c>
            return cur;
    80001404:	00078513          	mv	a0,a5
    }
    return BestFit;
}
    80001408:	00813403          	ld	s0,8(sp)
    8000140c:	01010113          	addi	sp,sp,16
    80001410:	00008067          	ret

0000000080001414 <_ZN7AVLTree3maxEPKS_S1_>:

inline int AVLTree::getBalance(AVLTree *node) {
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
}

int AVLTree::max(const AVLTree *n1, const AVLTree *n2) {
    80001414:	ff010113          	addi	sp,sp,-16
    80001418:	00813423          	sd	s0,8(sp)
    8000141c:	01010413          	addi	s0,sp,16
    if (!n1 && !n2)
    80001420:	02050663          	beqz	a0,8000144c <_ZN7AVLTree3maxEPKS_S1_+0x38>
        return -1;
    if (!n1 && n2)
    80001424:	02050a63          	beqz	a0,80001458 <_ZN7AVLTree3maxEPKS_S1_+0x44>
        return n2->height;
    if (n1 && !n2)
    80001428:	00050463          	beqz	a0,80001430 <_ZN7AVLTree3maxEPKS_S1_+0x1c>
    8000142c:	02058c63          	beqz	a1,80001464 <_ZN7AVLTree3maxEPKS_S1_+0x50>
        return n1->height;
    return (n1->height > n2->height) ? n1->height : n2->height;
    80001430:	04052783          	lw	a5,64(a0) # 1040 <_entry-0x7fffefc0>
    80001434:	0405a503          	lw	a0,64(a1)
    80001438:	00f55463          	bge	a0,a5,80001440 <_ZN7AVLTree3maxEPKS_S1_+0x2c>
    8000143c:	00078513          	mv	a0,a5
}
    80001440:	00813403          	ld	s0,8(sp)
    80001444:	01010113          	addi	sp,sp,16
    80001448:	00008067          	ret
    if (!n1 && !n2)
    8000144c:	fc059ce3          	bnez	a1,80001424 <_ZN7AVLTree3maxEPKS_S1_+0x10>
        return -1;
    80001450:	fff00513          	li	a0,-1
    80001454:	fedff06f          	j	80001440 <_ZN7AVLTree3maxEPKS_S1_+0x2c>
    if (!n1 && n2)
    80001458:	fc0588e3          	beqz	a1,80001428 <_ZN7AVLTree3maxEPKS_S1_+0x14>
        return n2->height;
    8000145c:	0405a503          	lw	a0,64(a1)
    80001460:	fe1ff06f          	j	80001440 <_ZN7AVLTree3maxEPKS_S1_+0x2c>
        return n1->height;
    80001464:	04052503          	lw	a0,64(a0)
    80001468:	fd9ff06f          	j	80001440 <_ZN7AVLTree3maxEPKS_S1_+0x2c>

000000008000146c <_ZN7AVLTree13findSuccessorEPS_>:

inline bool AVLTree::isRightSon(const AVLTree* node) {
    return (node->parent && node->parent->right == node);
}

AVLTree* AVLTree::findSuccessor(AVLTree* node){
    8000146c:	ff010113          	addi	sp,sp,-16
    80001470:	00813423          	sd	s0,8(sp)
    80001474:	01010413          	addi	s0,sp,16
    if (!node || !node->right) return nullptr;
    80001478:	00050c63          	beqz	a0,80001490 <_ZN7AVLTree13findSuccessorEPS_+0x24>
    8000147c:	00853783          	ld	a5,8(a0)
    80001480:	00078e63          	beqz	a5,8000149c <_ZN7AVLTree13findSuccessorEPS_+0x30>
    node = node->right;
    while(node->left)
    80001484:	00078513          	mv	a0,a5
    80001488:	0007b783          	ld	a5,0(a5)
    8000148c:	fe079ce3          	bnez	a5,80001484 <_ZN7AVLTree13findSuccessorEPS_+0x18>
        node = node->left;
    return node;
}
    80001490:	00813403          	ld	s0,8(sp)
    80001494:	01010113          	addi	sp,sp,16
    80001498:	00008067          	ret
    if (!node || !node->right) return nullptr;
    8000149c:	00078513          	mv	a0,a5
    800014a0:	ff1ff06f          	j	80001490 <_ZN7AVLTree13findSuccessorEPS_+0x24>

00000000800014a4 <_ZN7AVLTree13rightRotationEPS_>:

AVLTree* AVLTree::rightRotation(AVLTree *y) {
    800014a4:	fe010113          	addi	sp,sp,-32
    800014a8:	00113c23          	sd	ra,24(sp)
    800014ac:	00813823          	sd	s0,16(sp)
    800014b0:	00913423          	sd	s1,8(sp)
    800014b4:	01213023          	sd	s2,0(sp)
    800014b8:	02010413          	addi	s0,sp,32
    800014bc:	00050493          	mv	s1,a0
    AVLTree* x = y->left;
    800014c0:	00053903          	ld	s2,0(a0)
    AVLTree* t2 = x->right;
    800014c4:	00893783          	ld	a5,8(s2)

    x->right = y;
    800014c8:	00a93423          	sd	a0,8(s2)
    y->left = t2;
    800014cc:	00f53023          	sd	a5,0(a0)

    x->parent = y->parent;
    800014d0:	01053703          	ld	a4,16(a0)
    800014d4:	00e93823          	sd	a4,16(s2)
    y->parent = x;
    800014d8:	01253823          	sd	s2,16(a0)
    if (t2) t2->parent = y;
    800014dc:	00078463          	beqz	a5,800014e4 <_ZN7AVLTree13rightRotationEPS_+0x40>
    800014e0:	00a7b823          	sd	a0,16(a5)

    y->height = 1+max(y->left, y->right);
    800014e4:	0084b583          	ld	a1,8(s1)
    800014e8:	0004b503          	ld	a0,0(s1)
    800014ec:	00000097          	auipc	ra,0x0
    800014f0:	f28080e7          	jalr	-216(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    800014f4:	0015051b          	addiw	a0,a0,1
    800014f8:	04a4a023          	sw	a0,64(s1)
    x->height = 1+max(x->left, x->right);
    800014fc:	00893583          	ld	a1,8(s2)
    80001500:	00093503          	ld	a0,0(s2)
    80001504:	00000097          	auipc	ra,0x0
    80001508:	f10080e7          	jalr	-240(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    8000150c:	0015051b          	addiw	a0,a0,1
    80001510:	04a92023          	sw	a0,64(s2)
    return x;

}
    80001514:	00090513          	mv	a0,s2
    80001518:	01813083          	ld	ra,24(sp)
    8000151c:	01013403          	ld	s0,16(sp)
    80001520:	00813483          	ld	s1,8(sp)
    80001524:	00013903          	ld	s2,0(sp)
    80001528:	02010113          	addi	sp,sp,32
    8000152c:	00008067          	ret

0000000080001530 <_ZN7AVLTree12leftRotationEPS_>:
       /  \    RightRot     /  \
      x   t3   ------->   t1    y
     / \       <-------        / \
    t1  t2      LeftRot       t2  t3
*/
AVLTree* AVLTree::leftRotation(AVLTree *x) {
    80001530:	fe010113          	addi	sp,sp,-32
    80001534:	00113c23          	sd	ra,24(sp)
    80001538:	00813823          	sd	s0,16(sp)
    8000153c:	00913423          	sd	s1,8(sp)
    80001540:	01213023          	sd	s2,0(sp)
    80001544:	02010413          	addi	s0,sp,32
    80001548:	00050493          	mv	s1,a0
    AVLTree* y = x->right;
    8000154c:	00853903          	ld	s2,8(a0)
    AVLTree* t2 = y->left;
    80001550:	00093783          	ld	a5,0(s2)

    y->left = x;
    80001554:	00a93023          	sd	a0,0(s2)
    x->right = t2;
    80001558:	00f53423          	sd	a5,8(a0)

    y->parent = x->parent;
    8000155c:	01053703          	ld	a4,16(a0)
    80001560:	00e93823          	sd	a4,16(s2)
    x->parent = y;
    80001564:	01253823          	sd	s2,16(a0)
    if (t2) t2->parent = x;
    80001568:	00078463          	beqz	a5,80001570 <_ZN7AVLTree12leftRotationEPS_+0x40>
    8000156c:	00a7b823          	sd	a0,16(a5)

    x->height = 1+max(x->left, x->right);
    80001570:	0084b583          	ld	a1,8(s1)
    80001574:	0004b503          	ld	a0,0(s1)
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	e9c080e7          	jalr	-356(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    80001580:	0015051b          	addiw	a0,a0,1
    80001584:	04a4a023          	sw	a0,64(s1)
    y->height = 1+max(y->left, y->right);
    80001588:	00893583          	ld	a1,8(s2)
    8000158c:	00093503          	ld	a0,0(s2)
    80001590:	00000097          	auipc	ra,0x0
    80001594:	e84080e7          	jalr	-380(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    80001598:	0015051b          	addiw	a0,a0,1
    8000159c:	04a92023          	sw	a0,64(s2)


    return y;
}
    800015a0:	00090513          	mv	a0,s2
    800015a4:	01813083          	ld	ra,24(sp)
    800015a8:	01013403          	ld	s0,16(sp)
    800015ac:	00813483          	ld	s1,8(sp)
    800015b0:	00013903          	ld	s2,0(sp)
    800015b4:	02010113          	addi	sp,sp,32
    800015b8:	00008067          	ret

00000000800015bc <_ZN7AVLTree8containsEPKS_S1_>:

    // Perform balancing
    return AVLTree::balance(updateFrom);
}

bool AVLTree::contains(const AVLTree* root, const AVLTree* node) {
    800015bc:	ff010113          	addi	sp,sp,-16
    800015c0:	00813423          	sd	s0,8(sp)
    800015c4:	01010413          	addi	s0,sp,16
    800015c8:	0080006f          	j	800015d0 <_ZN7AVLTree8containsEPKS_S1_+0x14>
    while(cur) {
        if (cur == node)
            return true;

        if (cur->sz == node->sz)
            cur = cur->sameSizeNext;
    800015cc:	01853503          	ld	a0,24(a0)
    while(cur) {
    800015d0:	02050463          	beqz	a0,800015f8 <_ZN7AVLTree8containsEPKS_S1_+0x3c>
        if (cur == node)
    800015d4:	02b50a63          	beq	a0,a1,80001608 <_ZN7AVLTree8containsEPKS_S1_+0x4c>
        if (cur->sz == node->sz)
    800015d8:	03853703          	ld	a4,56(a0)
    800015dc:	0385b783          	ld	a5,56(a1)
    800015e0:	fef706e3          	beq	a4,a5,800015cc <_ZN7AVLTree8containsEPKS_S1_+0x10>
        else if (cur->sz < node->sz)
    800015e4:	00f77663          	bgeu	a4,a5,800015f0 <_ZN7AVLTree8containsEPKS_S1_+0x34>
            cur = cur->right;
    800015e8:	00853503          	ld	a0,8(a0)
    800015ec:	fe5ff06f          	j	800015d0 <_ZN7AVLTree8containsEPKS_S1_+0x14>
        else
            cur = cur->left;
    800015f0:	00053503          	ld	a0,0(a0)
    800015f4:	fddff06f          	j	800015d0 <_ZN7AVLTree8containsEPKS_S1_+0x14>
    }

    return false;
    800015f8:	00000513          	li	a0,0
}
    800015fc:	00813403          	ld	s0,8(sp)
    80001600:	01010113          	addi	sp,sp,16
    80001604:	00008067          	ret
            return true;
    80001608:	00100513          	li	a0,1
    8000160c:	ff1ff06f          	j	800015fc <_ZN7AVLTree8containsEPKS_S1_+0x40>

0000000080001610 <_ZN7AVLTree7balanceEPS_>:

AVLTree* AVLTree::balance(AVLTree* cur) {
    80001610:	fc010113          	addi	sp,sp,-64
    80001614:	02113c23          	sd	ra,56(sp)
    80001618:	02813823          	sd	s0,48(sp)
    8000161c:	02913423          	sd	s1,40(sp)
    80001620:	03213023          	sd	s2,32(sp)
    80001624:	01313c23          	sd	s3,24(sp)
    80001628:	01413823          	sd	s4,16(sp)
    8000162c:	01513423          	sd	s5,8(sp)
    80001630:	01613023          	sd	s6,0(sp)
    80001634:	04010413          	addi	s0,sp,64
    80001638:	00050493          	mv	s1,a0
    AVLTree* prev = nullptr;
    8000163c:	00000913          	li	s2,0
    80001640:	0e00006f          	j	80001720 <_ZN7AVLTree7balanceEPS_+0x110>
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
    80001644:	00000993          	li	s3,0
    80001648:	1080006f          	j	80001750 <_ZN7AVLTree7balanceEPS_+0x140>
    8000164c:	00000793          	li	a5,0
    80001650:	10c0006f          	j	8000175c <_ZN7AVLTree7balanceEPS_+0x14c>
    80001654:	00000a13          	li	s4,0
    80001658:	1200006f          	j	80001778 <_ZN7AVLTree7balanceEPS_+0x168>
    8000165c:	00000a13          	li	s4,0
    80001660:	1180006f          	j	80001778 <_ZN7AVLTree7balanceEPS_+0x168>
    80001664:	00000793          	li	a5,0
    80001668:	1240006f          	j	8000178c <_ZN7AVLTree7balanceEPS_+0x17c>
    8000166c:	00000793          	li	a5,0
    80001670:	11c0006f          	j	8000178c <_ZN7AVLTree7balanceEPS_+0x17c>
        int curBalance = AVLTree::getBalance(cur);
        int prevBalance = AVLTree::getBalance(prev);

        AVLTree* oldCurParent = cur->parent;

        if (curBalance < -1 && prevBalance * curBalance < 0) {
    80001674:	033a07bb          	mulw	a5,s4,s3
    80001678:	1207d263          	bgez	a5,8000179c <_ZN7AVLTree7balanceEPS_+0x18c>
            prev = AVLTree::leftRotation(prev);
    8000167c:	00090513          	mv	a0,s2
    80001680:	00000097          	auipc	ra,0x0
    80001684:	eb0080e7          	jalr	-336(ra) # 80001530 <_ZN7AVLTree12leftRotationEPS_>
    80001688:	00050913          	mv	s2,a0
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    8000168c:	0384b703          	ld	a4,56(s1)
    80001690:	03853783          	ld	a5,56(a0)
    80001694:	00f77e63          	bgeu	a4,a5,800016b0 <_ZN7AVLTree7balanceEPS_+0xa0>
    80001698:	00a4b423          	sd	a0,8(s1)
            cur = AVLTree::rightRotation(cur);
    8000169c:	00048513          	mv	a0,s1
    800016a0:	00000097          	auipc	ra,0x0
    800016a4:	e04080e7          	jalr	-508(ra) # 800014a4 <_ZN7AVLTree13rightRotationEPS_>
    800016a8:	00050493          	mv	s1,a0
    800016ac:	0f80006f          	j	800017a4 <_ZN7AVLTree7balanceEPS_+0x194>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016b0:	00a4b023          	sd	a0,0(s1)
    800016b4:	fe9ff06f          	j	8000169c <_ZN7AVLTree7balanceEPS_+0x8c>
        }else if (curBalance < -1) {
            cur = AVLTree::rightRotation(cur);
    800016b8:	00048513          	mv	a0,s1
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	de8080e7          	jalr	-536(ra) # 800014a4 <_ZN7AVLTree13rightRotationEPS_>
    800016c4:	00050493          	mv	s1,a0
    800016c8:	0dc0006f          	j	800017a4 <_ZN7AVLTree7balanceEPS_+0x194>
        }
        if (curBalance > 1 && prevBalance * curBalance < 0) {
            prev = AVLTree::rightRotation(prev);
    800016cc:	00090513          	mv	a0,s2
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	dd4080e7          	jalr	-556(ra) # 800014a4 <_ZN7AVLTree13rightRotationEPS_>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016d8:	0384b703          	ld	a4,56(s1)
    800016dc:	03853783          	ld	a5,56(a0)
    800016e0:	00f77e63          	bgeu	a4,a5,800016fc <_ZN7AVLTree7balanceEPS_+0xec>
    800016e4:	00a4b423          	sd	a0,8(s1)
            cur = AVLTree::leftRotation(cur);
    800016e8:	00048513          	mv	a0,s1
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	e44080e7          	jalr	-444(ra) # 80001530 <_ZN7AVLTree12leftRotationEPS_>
    800016f4:	00050913          	mv	s2,a0
    800016f8:	0c80006f          	j	800017c0 <_ZN7AVLTree7balanceEPS_+0x1b0>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016fc:	00a4b023          	sd	a0,0(s1)
    80001700:	fe9ff06f          	j	800016e8 <_ZN7AVLTree7balanceEPS_+0xd8>
        }else if (curBalance > 1) {
            cur = AVLTree::leftRotation(cur);
    80001704:	00048513          	mv	a0,s1
    80001708:	00000097          	auipc	ra,0x0
    8000170c:	e28080e7          	jalr	-472(ra) # 80001530 <_ZN7AVLTree12leftRotationEPS_>
    80001710:	00050913          	mv	s2,a0
    80001714:	0ac0006f          	j	800017c0 <_ZN7AVLTree7balanceEPS_+0x1b0>
        }

        if (oldCurParent) ((oldCurParent->sz < cur->sz) ? oldCurParent->right : oldCurParent->left) = cur;
    80001718:	012b3023          	sd	s2,0(s6)

        prev = cur;
        cur = cur->parent;
    8000171c:	01093483          	ld	s1,16(s2)
    while(cur) {
    80001720:	0a048c63          	beqz	s1,800017d8 <_ZN7AVLTree7balanceEPS_+0x1c8>
        cur->height = 1 + max(cur->left, cur->right);
    80001724:	0004ba03          	ld	s4,0(s1)
    80001728:	0084b983          	ld	s3,8(s1)
    8000172c:	00098593          	mv	a1,s3
    80001730:	000a0513          	mv	a0,s4
    80001734:	00000097          	auipc	ra,0x0
    80001738:	ce0080e7          	jalr	-800(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    8000173c:	0015051b          	addiw	a0,a0,1
    80001740:	04a4a023          	sw	a0,64(s1)
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
    80001744:	f00980e3          	beqz	s3,80001644 <_ZN7AVLTree7balanceEPS_+0x34>
    80001748:	0409a983          	lw	s3,64(s3)
    8000174c:	0019899b          	addiw	s3,s3,1
    80001750:	ee0a0ee3          	beqz	s4,8000164c <_ZN7AVLTree7balanceEPS_+0x3c>
    80001754:	040a2783          	lw	a5,64(s4)
    80001758:	0017879b          	addiw	a5,a5,1
    8000175c:	40f989bb          	subw	s3,s3,a5
    80001760:	00098a9b          	sext.w	s5,s3
    80001764:	ee0908e3          	beqz	s2,80001654 <_ZN7AVLTree7balanceEPS_+0x44>
    80001768:	00893783          	ld	a5,8(s2)
    8000176c:	ee0788e3          	beqz	a5,8000165c <_ZN7AVLTree7balanceEPS_+0x4c>
    80001770:	0407aa03          	lw	s4,64(a5)
    80001774:	001a0a1b          	addiw	s4,s4,1
    80001778:	ee0906e3          	beqz	s2,80001664 <_ZN7AVLTree7balanceEPS_+0x54>
    8000177c:	00093783          	ld	a5,0(s2)
    80001780:	ee0786e3          	beqz	a5,8000166c <_ZN7AVLTree7balanceEPS_+0x5c>
    80001784:	0407a783          	lw	a5,64(a5)
    80001788:	0017879b          	addiw	a5,a5,1
    8000178c:	40fa0a3b          	subw	s4,s4,a5
        AVLTree* oldCurParent = cur->parent;
    80001790:	0104bb03          	ld	s6,16(s1)
        if (curBalance < -1 && prevBalance * curBalance < 0) {
    80001794:	fff00793          	li	a5,-1
    80001798:	ecfacee3          	blt	s5,a5,80001674 <_ZN7AVLTree7balanceEPS_+0x64>
        }else if (curBalance < -1) {
    8000179c:	fff00793          	li	a5,-1
    800017a0:	f0facce3          	blt	s5,a5,800016b8 <_ZN7AVLTree7balanceEPS_+0xa8>
        if (curBalance > 1 && prevBalance * curBalance < 0) {
    800017a4:	00100793          	li	a5,1
    800017a8:	0157d663          	bge	a5,s5,800017b4 <_ZN7AVLTree7balanceEPS_+0x1a4>
    800017ac:	033a09bb          	mulw	s3,s4,s3
    800017b0:	f009cee3          	bltz	s3,800016cc <_ZN7AVLTree7balanceEPS_+0xbc>
        }else if (curBalance > 1) {
    800017b4:	00100793          	li	a5,1
    800017b8:	f557c6e3          	blt	a5,s5,80001704 <_ZN7AVLTree7balanceEPS_+0xf4>
    800017bc:	00048913          	mv	s2,s1
        if (oldCurParent) ((oldCurParent->sz < cur->sz) ? oldCurParent->right : oldCurParent->left) = cur;
    800017c0:	f40b0ee3          	beqz	s6,8000171c <_ZN7AVLTree7balanceEPS_+0x10c>
    800017c4:	038b3703          	ld	a4,56(s6)
    800017c8:	03893783          	ld	a5,56(s2)
    800017cc:	f4f776e3          	bgeu	a4,a5,80001718 <_ZN7AVLTree7balanceEPS_+0x108>
    800017d0:	012b3423          	sd	s2,8(s6)
    800017d4:	f49ff06f          	j	8000171c <_ZN7AVLTree7balanceEPS_+0x10c>
    }
    return prev;
}
    800017d8:	00090513          	mv	a0,s2
    800017dc:	03813083          	ld	ra,56(sp)
    800017e0:	03013403          	ld	s0,48(sp)
    800017e4:	02813483          	ld	s1,40(sp)
    800017e8:	02013903          	ld	s2,32(sp)
    800017ec:	01813983          	ld	s3,24(sp)
    800017f0:	01013a03          	ld	s4,16(sp)
    800017f4:	00813a83          	ld	s5,8(sp)
    800017f8:	00013b03          	ld	s6,0(sp)
    800017fc:	04010113          	addi	sp,sp,64
    80001800:	00008067          	ret

0000000080001804 <_ZN7AVLTree6insertEPS_S0_>:
    if (!root) {
    80001804:	0a050263          	beqz	a0,800018a8 <_ZN7AVLTree6insertEPS_S0_+0xa4>
    80001808:	00050613          	mv	a2,a0
    AVLTree* cur = root, *prev = nullptr;
    8000180c:	00050793          	mv	a5,a0
    80001810:	00000513          	li	a0,0
    80001814:	0340006f          	j	80001848 <_ZN7AVLTree6insertEPS_S0_+0x44>
            if (cur->sameSizeNext) cur->sameSizeNext->sameSizePrev = node;
    80001818:	0187b703          	ld	a4,24(a5)
    8000181c:	00070463          	beqz	a4,80001824 <_ZN7AVLTree6insertEPS_S0_+0x20>
    80001820:	02b73023          	sd	a1,32(a4)
            node->sameSizeNext = cur->sameSizeNext;
    80001824:	0187b703          	ld	a4,24(a5)
    80001828:	00e5bc23          	sd	a4,24(a1)
            cur->sameSizeNext = node;
    8000182c:	00b7bc23          	sd	a1,24(a5)
            node->sameSizePrev = cur;
    80001830:	02f5b023          	sd	a5,32(a1)
            return root;
    80001834:	00060513          	mv	a0,a2
    80001838:	00008067          	ret
            cur = cur->left;
    8000183c:	0007b703          	ld	a4,0(a5)
AVLTree* AVLTree::insert(AVLTree *root, AVLTree *node) {
    80001840:	00078513          	mv	a0,a5
    80001844:	00070793          	mv	a5,a4
    while(cur) {
    80001848:	00078e63          	beqz	a5,80001864 <_ZN7AVLTree6insertEPS_S0_+0x60>
        if (node->sz == cur->sz) {
    8000184c:	0385b683          	ld	a3,56(a1)
    80001850:	0387b703          	ld	a4,56(a5)
    80001854:	fce682e3          	beq	a3,a4,80001818 <_ZN7AVLTree6insertEPS_S0_+0x14>
        if (node->sz > cur->sz)
    80001858:	fed772e3          	bgeu	a4,a3,8000183c <_ZN7AVLTree6insertEPS_S0_+0x38>
            cur = cur->right;
    8000185c:	0087b703          	ld	a4,8(a5)
    80001860:	fe1ff06f          	j	80001840 <_ZN7AVLTree6insertEPS_S0_+0x3c>
AVLTree* AVLTree::insert(AVLTree *root, AVLTree *node) {
    80001864:	ff010113          	addi	sp,sp,-16
    80001868:	00113423          	sd	ra,8(sp)
    8000186c:	00813023          	sd	s0,0(sp)
    80001870:	01010413          	addi	s0,sp,16
    (node->sz > prev->sz ? prev->right : prev->left) = node;
    80001874:	0385b703          	ld	a4,56(a1)
    80001878:	03853783          	ld	a5,56(a0)
    8000187c:	02e7f263          	bgeu	a5,a4,800018a0 <_ZN7AVLTree6insertEPS_S0_+0x9c>
    80001880:	00b53423          	sd	a1,8(a0)
    node->parent = prev;
    80001884:	00a5b823          	sd	a0,16(a1)
    return AVLTree::balance(cur);
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	d88080e7          	jalr	-632(ra) # 80001610 <_ZN7AVLTree7balanceEPS_>
}
    80001890:	00813083          	ld	ra,8(sp)
    80001894:	00013403          	ld	s0,0(sp)
    80001898:	01010113          	addi	sp,sp,16
    8000189c:	00008067          	ret
    (node->sz > prev->sz ? prev->right : prev->left) = node;
    800018a0:	00b53023          	sd	a1,0(a0)
    800018a4:	fe1ff06f          	j	80001884 <_ZN7AVLTree6insertEPS_S0_+0x80>
        return node;
    800018a8:	00058513          	mv	a0,a1
}
    800018ac:	00008067          	ret

00000000800018b0 <_ZN7AVLTree6removeEPS_S0_>:
AVLTree* AVLTree::remove(AVLTree* root, AVLTree* node) {
    800018b0:	fd010113          	addi	sp,sp,-48
    800018b4:	02113423          	sd	ra,40(sp)
    800018b8:	02813023          	sd	s0,32(sp)
    800018bc:	00913c23          	sd	s1,24(sp)
    800018c0:	01213823          	sd	s2,16(sp)
    800018c4:	01313423          	sd	s3,8(sp)
    800018c8:	03010413          	addi	s0,sp,48
    800018cc:	00050913          	mv	s2,a0
    if (!root) return nullptr;
    800018d0:	06050a63          	beqz	a0,80001944 <_ZN7AVLTree6removeEPS_S0_+0x94>
    800018d4:	00058493          	mv	s1,a1
    if (!node || !contains(root, node)) return root;
    800018d8:	06058663          	beqz	a1,80001944 <_ZN7AVLTree6removeEPS_S0_+0x94>
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	ce0080e7          	jalr	-800(ra) # 800015bc <_ZN7AVLTree8containsEPKS_S1_>
    800018e4:	06050063          	beqz	a0,80001944 <_ZN7AVLTree6removeEPS_S0_+0x94>
    if (node->sameSizeNext) {
    800018e8:	0184b783          	ld	a5,24(s1)
    800018ec:	08078463          	beqz	a5,80001974 <_ZN7AVLTree6removeEPS_S0_+0xc4>
        AVLTree* p = node->parent, *l = node->left,
    800018f0:	0104b703          	ld	a4,16(s1)
    800018f4:	0004b683          	ld	a3,0(s1)
                *r = node->right, *sn = node->sameSizeNext, *sp = node->sameSizePrev;
    800018f8:	0084b603          	ld	a2,8(s1)
    800018fc:	0204b583          	ld	a1,32(s1)
        if (sp) sp->sameSizeNext = sn;
    80001900:	00058463          	beqz	a1,80001908 <_ZN7AVLTree6removeEPS_S0_+0x58>
    80001904:	00f5bc23          	sd	a5,24(a1)
        if (p) (isRightSon(node) ? p->right : p->left) = sn;
    80001908:	00070c63          	beqz	a4,80001920 <_ZN7AVLTree6removeEPS_S0_+0x70>
    return (node->parent && node->parent->right == node);
    8000190c:	0104b503          	ld	a0,16(s1)
    80001910:	00050663          	beqz	a0,8000191c <_ZN7AVLTree6removeEPS_S0_+0x6c>
    80001914:	00853503          	ld	a0,8(a0)
    80001918:	04a48663          	beq	s1,a0,80001964 <_ZN7AVLTree6removeEPS_S0_+0xb4>
        if (p) (isRightSon(node) ? p->right : p->left) = sn;
    8000191c:	00f73023          	sd	a5,0(a4)
        if (r) r->parent = sn;
    80001920:	00060463          	beqz	a2,80001928 <_ZN7AVLTree6removeEPS_S0_+0x78>
    80001924:	00f63823          	sd	a5,16(a2)
        if (l) l->parent = sn;
    80001928:	00068463          	beqz	a3,80001930 <_ZN7AVLTree6removeEPS_S0_+0x80>
    8000192c:	00f6b823          	sd	a5,16(a3)
        sn->sameSizePrev = sp;
    80001930:	02b7b023          	sd	a1,32(a5)
        sn->right = r;
    80001934:	00c7b423          	sd	a2,8(a5)
        sn->left = l;
    80001938:	00d7b023          	sd	a3,0(a5)
        sn->parent = p;
    8000193c:	00e7b823          	sd	a4,16(a5)
        return (p) ? root : sn;
    80001940:	02070663          	beqz	a4,8000196c <_ZN7AVLTree6removeEPS_S0_+0xbc>
}
    80001944:	00090513          	mv	a0,s2
    80001948:	02813083          	ld	ra,40(sp)
    8000194c:	02013403          	ld	s0,32(sp)
    80001950:	01813483          	ld	s1,24(sp)
    80001954:	01013903          	ld	s2,16(sp)
    80001958:	00813983          	ld	s3,8(sp)
    8000195c:	03010113          	addi	sp,sp,48
    80001960:	00008067          	ret
        if (p) (isRightSon(node) ? p->right : p->left) = sn;
    80001964:	00f73423          	sd	a5,8(a4)
    80001968:	fb9ff06f          	j	80001920 <_ZN7AVLTree6removeEPS_S0_+0x70>
        return (p) ? root : sn;
    8000196c:	00078913          	mv	s2,a5
    80001970:	fd5ff06f          	j	80001944 <_ZN7AVLTree6removeEPS_S0_+0x94>
    if (node->sameSizePrev) {
    80001974:	0204b783          	ld	a5,32(s1)
    80001978:	00078663          	beqz	a5,80001984 <_ZN7AVLTree6removeEPS_S0_+0xd4>
        node->sameSizePrev->sameSizeNext = nullptr;
    8000197c:	0007bc23          	sd	zero,24(a5)
        return root;
    80001980:	fc5ff06f          	j	80001944 <_ZN7AVLTree6removeEPS_S0_+0x94>
    if (!node->left && !node->right) { // no children
    80001984:	0004b783          	ld	a5,0(s1)
    80001988:	08078263          	beqz	a5,80001a0c <_ZN7AVLTree6removeEPS_S0_+0x15c>
    } else if (!node->left || !node->right) { // one child
    8000198c:	0a078663          	beqz	a5,80001a38 <_ZN7AVLTree6removeEPS_S0_+0x188>
    80001990:	0084b983          	ld	s3,8(s1)
    80001994:	0a098263          	beqz	s3,80001a38 <_ZN7AVLTree6removeEPS_S0_+0x188>
        AVLTree* swap = findSuccessor(node);
    80001998:	00048513          	mv	a0,s1
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	ad0080e7          	jalr	-1328(ra) # 8000146c <_ZN7AVLTree13findSuccessorEPS_>
    800019a4:	00050793          	mv	a5,a0
        if (swap == node->right) {
    800019a8:	10a98063          	beq	s3,a0,80001aa8 <_ZN7AVLTree6removeEPS_S0_+0x1f8>
            updateFrom = swap->parent; // updating starts from swapped node
    800019ac:	01053503          	ld	a0,16(a0)
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    800019b0:	00990c63          	beq	s2,s1,800019c8 <_ZN7AVLTree6removeEPS_S0_+0x118>
    return (node->parent && node->parent->right == node);
    800019b4:	0104b703          	ld	a4,16(s1)
    800019b8:	00070663          	beqz	a4,800019c4 <_ZN7AVLTree6removeEPS_S0_+0x114>
    800019bc:	00873683          	ld	a3,8(a4)
    800019c0:	12d48863          	beq	s1,a3,80001af0 <_ZN7AVLTree6removeEPS_S0_+0x240>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    800019c4:	00f73023          	sd	a5,0(a4)
            node->left->parent = swap;
    800019c8:	0004b703          	ld	a4,0(s1)
    800019cc:	00f73823          	sd	a5,16(a4)
            node->right->parent = swap;
    800019d0:	0084b703          	ld	a4,8(s1)
    800019d4:	00f73823          	sd	a5,16(a4)
            swap->parent->left = swap->right;
    800019d8:	0107b683          	ld	a3,16(a5)
    800019dc:	0087b703          	ld	a4,8(a5)
    800019e0:	00e6b023          	sd	a4,0(a3)
            if (swap->right) swap->right->parent = swap->parent;
    800019e4:	00070663          	beqz	a4,800019f0 <_ZN7AVLTree6removeEPS_S0_+0x140>
    800019e8:	0107b683          	ld	a3,16(a5)
    800019ec:	00d73823          	sd	a3,16(a4)
            swap->left = node->left;
    800019f0:	0004b703          	ld	a4,0(s1)
    800019f4:	00e7b023          	sd	a4,0(a5)
            swap->right = node->right;
    800019f8:	0084b703          	ld	a4,8(s1)
    800019fc:	00e7b423          	sd	a4,8(a5)
            swap->parent = node->parent;
    80001a00:	0104b703          	ld	a4,16(s1)
    80001a04:	00e7b823          	sd	a4,16(a5)
    80001a08:	0580006f          	j	80001a60 <_ZN7AVLTree6removeEPS_S0_+0x1b0>
    if (!node->left && !node->right) { // no children
    80001a0c:	0084b703          	ld	a4,8(s1)
    80001a10:	f6071ee3          	bnez	a4,8000198c <_ZN7AVLTree6removeEPS_S0_+0xdc>
        updateFrom = node->parent;
    80001a14:	0104b503          	ld	a0,16(s1)
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = nullptr;
    80001a18:	04990463          	beq	s2,s1,80001a60 <_ZN7AVLTree6removeEPS_S0_+0x1b0>
    return (node->parent && node->parent->right == node);
    80001a1c:	00050663          	beqz	a0,80001a28 <_ZN7AVLTree6removeEPS_S0_+0x178>
    80001a20:	00853783          	ld	a5,8(a0)
    80001a24:	00f48663          	beq	s1,a5,80001a30 <_ZN7AVLTree6removeEPS_S0_+0x180>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = nullptr;
    80001a28:	00053023          	sd	zero,0(a0)
    80001a2c:	0340006f          	j	80001a60 <_ZN7AVLTree6removeEPS_S0_+0x1b0>
    80001a30:	00053423          	sd	zero,8(a0)
    80001a34:	02c0006f          	j	80001a60 <_ZN7AVLTree6removeEPS_S0_+0x1b0>
        updateFrom = node->parent;
    80001a38:	0104b503          	ld	a0,16(s1)
        if (node == root) {updateFrom = (node->left) ? node->left : node->right; updateFrom->parent = nullptr;}
    80001a3c:	02990a63          	beq	s2,s1,80001a70 <_ZN7AVLTree6removeEPS_S0_+0x1c0>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    80001a40:	02990063          	beq	s2,s1,80001a60 <_ZN7AVLTree6removeEPS_S0_+0x1b0>
    return (node->parent && node->parent->right == node);
    80001a44:	0104b783          	ld	a5,16(s1)
    80001a48:	00078663          	beqz	a5,80001a54 <_ZN7AVLTree6removeEPS_S0_+0x1a4>
    80001a4c:	0087b703          	ld	a4,8(a5)
    80001a50:	02e48c63          	beq	s1,a4,80001a88 <_ZN7AVLTree6removeEPS_S0_+0x1d8>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    80001a54:	0084b703          	ld	a4,8(s1)
    80001a58:	04070463          	beqz	a4,80001aa0 <_ZN7AVLTree6removeEPS_S0_+0x1f0>
    80001a5c:	00e7b023          	sd	a4,0(a5)
    return AVLTree::balance(updateFrom);
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	bb0080e7          	jalr	-1104(ra) # 80001610 <_ZN7AVLTree7balanceEPS_>
    80001a68:	00050913          	mv	s2,a0
    80001a6c:	ed9ff06f          	j	80001944 <_ZN7AVLTree6removeEPS_S0_+0x94>
        if (node == root) {updateFrom = (node->left) ? node->left : node->right; updateFrom->parent = nullptr;}
    80001a70:	00078863          	beqz	a5,80001a80 <_ZN7AVLTree6removeEPS_S0_+0x1d0>
    80001a74:	0007b823          	sd	zero,16(a5)
    80001a78:	00078513          	mv	a0,a5
    80001a7c:	fc5ff06f          	j	80001a40 <_ZN7AVLTree6removeEPS_S0_+0x190>
    80001a80:	0084b783          	ld	a5,8(s1)
    80001a84:	ff1ff06f          	j	80001a74 <_ZN7AVLTree6removeEPS_S0_+0x1c4>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    80001a88:	0084b703          	ld	a4,8(s1)
    80001a8c:	00070663          	beqz	a4,80001a98 <_ZN7AVLTree6removeEPS_S0_+0x1e8>
    80001a90:	00e7b423          	sd	a4,8(a5)
    80001a94:	fcdff06f          	j	80001a60 <_ZN7AVLTree6removeEPS_S0_+0x1b0>
    80001a98:	0004b703          	ld	a4,0(s1)
    80001a9c:	ff5ff06f          	j	80001a90 <_ZN7AVLTree6removeEPS_S0_+0x1e0>
    80001aa0:	0004b703          	ld	a4,0(s1)
    80001aa4:	fb9ff06f          	j	80001a5c <_ZN7AVLTree6removeEPS_S0_+0x1ac>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001aa8:	00990c63          	beq	s2,s1,80001ac0 <_ZN7AVLTree6removeEPS_S0_+0x210>
    return (node->parent && node->parent->right == node);
    80001aac:	0104b703          	ld	a4,16(s1)
    80001ab0:	00070663          	beqz	a4,80001abc <_ZN7AVLTree6removeEPS_S0_+0x20c>
    80001ab4:	00873683          	ld	a3,8(a4)
    80001ab8:	02d48863          	beq	s1,a3,80001ae8 <_ZN7AVLTree6removeEPS_S0_+0x238>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001abc:	00f73023          	sd	a5,0(a4)
            node->right->parent = nullptr;
    80001ac0:	0084b703          	ld	a4,8(s1)
    80001ac4:	00073823          	sd	zero,16(a4)
            node->left->parent = swap;
    80001ac8:	0004b703          	ld	a4,0(s1)
    80001acc:	00f73823          	sd	a5,16(a4)
            swap->left = node->left;
    80001ad0:	0004b703          	ld	a4,0(s1)
    80001ad4:	00e7b023          	sd	a4,0(a5)
            swap->parent = node->parent;
    80001ad8:	0104b703          	ld	a4,16(s1)
    80001adc:	00e7b823          	sd	a4,16(a5)
            updateFrom = swap;
    80001ae0:	00078513          	mv	a0,a5
    80001ae4:	f7dff06f          	j	80001a60 <_ZN7AVLTree6removeEPS_S0_+0x1b0>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001ae8:	00a73423          	sd	a0,8(a4)
    80001aec:	fd5ff06f          	j	80001ac0 <_ZN7AVLTree6removeEPS_S0_+0x210>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001af0:	00f73423          	sd	a5,8(a4)
    80001af4:	ed5ff06f          	j	800019c8 <_ZN7AVLTree6removeEPS_S0_+0x118>

0000000080001af8 <_ZN7AVLTree6swapLLEPS_S0_S0_>:

AVLTree *AVLTree::swapLL(AVLTree *toSwap, AVLTree *swap, AVLTree* root) {
    80001af8:	ff010113          	addi	sp,sp,-16
    80001afc:	00813423          	sd	s0,8(sp)
    80001b00:	01010413          	addi	s0,sp,16
    80001b04:	00050793          	mv	a5,a0
    80001b08:	00060513          	mv	a0,a2
    if (!toSwap || !swap || !root || toSwap == swap)
    80001b0c:	02078863          	beqz	a5,80001b3c <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001b10:	02058663          	beqz	a1,80001b3c <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001b14:	02060463          	beqz	a2,80001b3c <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001b18:	02b78263          	beq	a5,a1,80001b3c <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
        return root;

    if (toSwap == root) {
    80001b1c:	02c78663          	beq	a5,a2,80001b48 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x50>
        swap->prev = nullptr;
        if (root->next) root->next->prev = swap;
        return swap;
    }

    AVLTree* prevNode = toSwap->prev;
    80001b20:	0307b703          	ld	a4,48(a5)
    AVLTree* nextNode = toSwap->next;
    80001b24:	0287b783          	ld	a5,40(a5)
    prevNode->next = swap;
    80001b28:	02b73423          	sd	a1,40(a4)
    swap->prev = prevNode;
    80001b2c:	02e5b823          	sd	a4,48(a1)
    if (nextNode) nextNode->prev = swap;
    80001b30:	00078463          	beqz	a5,80001b38 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x40>
    80001b34:	02b7b823          	sd	a1,48(a5)
    swap->next = nextNode;
    80001b38:	02f5b423          	sd	a5,40(a1)

    return root;

}
    80001b3c:	00813403          	ld	s0,8(sp)
    80001b40:	01010113          	addi	sp,sp,16
    80001b44:	00008067          	ret
        swap->next = root->next;
    80001b48:	02863783          	ld	a5,40(a2)
    80001b4c:	02f5b423          	sd	a5,40(a1)
        swap->prev = nullptr;
    80001b50:	0205b823          	sd	zero,48(a1)
        if (root->next) root->next->prev = swap;
    80001b54:	02863783          	ld	a5,40(a2)
    80001b58:	00078463          	beqz	a5,80001b60 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x68>
    80001b5c:	02b7b823          	sd	a1,48(a5)
        return swap;
    80001b60:	00058513          	mv	a0,a1
    80001b64:	fd9ff06f          	j	80001b3c <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>

0000000080001b68 <_ZN7AVLTree8removeLLEPS_S0_>:

AVLTree *AVLTree::removeLL(AVLTree *toRem, AVLTree *root) {
    80001b68:	ff010113          	addi	sp,sp,-16
    80001b6c:	00813423          	sd	s0,8(sp)
    80001b70:	01010413          	addi	s0,sp,16
    80001b74:	00050793          	mv	a5,a0
    if (!root) return toRem;
    80001b78:	02058263          	beqz	a1,80001b9c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    80001b7c:	00058513          	mv	a0,a1
    if (!toRem) return root;
    80001b80:	00078e63          	beqz	a5,80001b9c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    if (root == toRem) {
    80001b84:	02f58263          	beq	a1,a5,80001ba8 <_ZN7AVLTree8removeLLEPS_S0_+0x40>
        root = root->next;
        if (root) root->prev = nullptr;
        return root;
    }
    AVLTree* prevNode = toRem->prev;
    80001b88:	0307b703          	ld	a4,48(a5)
    AVLTree* nextNode = toRem->next;
    80001b8c:	0287b783          	ld	a5,40(a5)
    prevNode->next = nextNode;
    80001b90:	02f73423          	sd	a5,40(a4)
    if (nextNode)
    80001b94:	00078463          	beqz	a5,80001b9c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
        nextNode->prev = prevNode;
    80001b98:	02e7b823          	sd	a4,48(a5)

    return root;
}
    80001b9c:	00813403          	ld	s0,8(sp)
    80001ba0:	01010113          	addi	sp,sp,16
    80001ba4:	00008067          	ret
        root = root->next;
    80001ba8:	0285b503          	ld	a0,40(a1)
        if (root) root->prev = nullptr;
    80001bac:	fe0508e3          	beqz	a0,80001b9c <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    80001bb0:	02053823          	sd	zero,48(a0)
        return root;
    80001bb4:	fe9ff06f          	j	80001b9c <_ZN7AVLTree8removeLLEPS_S0_+0x34>

0000000080001bb8 <_ZN7AVLTree8insertLLEPS_S0_>:

AVLTree *AVLTree::insertLL(AVLTree *toInsert, AVLTree *root) {
    80001bb8:	ff010113          	addi	sp,sp,-16
    80001bbc:	00813423          	sd	s0,8(sp)
    80001bc0:	01010413          	addi	s0,sp,16
    if (!toInsert) return root;
    80001bc4:	04050c63          	beqz	a0,80001c1c <_ZN7AVLTree8insertLLEPS_S0_+0x64>
    if (!root || toInsert < root) {
    80001bc8:	04058063          	beqz	a1,80001c08 <_ZN7AVLTree8insertLLEPS_S0_+0x50>
    80001bcc:	02b56e63          	bltu	a0,a1,80001c08 <_ZN7AVLTree8insertLLEPS_S0_+0x50>
        toInsert->prev = nullptr;
        if (root) root->prev = toInsert;
        return toInsert;
    }

    AVLTree* cur = root;
    80001bd0:	00058793          	mv	a5,a1
    for (; cur->next && (cur->next < toInsert); cur = cur->next);
    80001bd4:	00078713          	mv	a4,a5
    80001bd8:	0287b783          	ld	a5,40(a5)
    80001bdc:	00078463          	beqz	a5,80001be4 <_ZN7AVLTree8insertLLEPS_S0_+0x2c>
    80001be0:	fea7eae3          	bltu	a5,a0,80001bd4 <_ZN7AVLTree8insertLLEPS_S0_+0x1c>

    toInsert->next = cur->next;
    80001be4:	02f53423          	sd	a5,40(a0)
    if(cur->next) cur->next->prev = toInsert;
    80001be8:	00078463          	beqz	a5,80001bf0 <_ZN7AVLTree8insertLLEPS_S0_+0x38>
    80001bec:	02a7b823          	sd	a0,48(a5)
    cur->next = toInsert;
    80001bf0:	02a73423          	sd	a0,40(a4)
    toInsert->prev = cur;
    80001bf4:	02e53823          	sd	a4,48(a0)

    return root;
    80001bf8:	00058513          	mv	a0,a1
}
    80001bfc:	00813403          	ld	s0,8(sp)
    80001c00:	01010113          	addi	sp,sp,16
    80001c04:	00008067          	ret
        toInsert->next = root;
    80001c08:	02b53423          	sd	a1,40(a0)
        toInsert->prev = nullptr;
    80001c0c:	02053823          	sd	zero,48(a0)
        if (root) root->prev = toInsert;
    80001c10:	fe0586e3          	beqz	a1,80001bfc <_ZN7AVLTree8insertLLEPS_S0_+0x44>
    80001c14:	02a5b823          	sd	a0,48(a1)
        return toInsert;
    80001c18:	fe5ff06f          	j	80001bfc <_ZN7AVLTree8insertLLEPS_S0_+0x44>
    if (!toInsert) return root;
    80001c1c:	00058513          	mv	a0,a1
    80001c20:	fddff06f          	j	80001bfc <_ZN7AVLTree8insertLLEPS_S0_+0x44>

0000000080001c24 <_ZN5RiscV10popSppSpieEv>:
//

#include "../h/RiscV.h"


void RiscV::popSppSpie() {
    80001c24:	ff010113          	addi	sp,sp,-16
    80001c28:	00813423          	sd	s0,8(sp)
    80001c2c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80001c30:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80001c34:	10200073          	sret
}
    80001c38:	00813403          	ld	s0,8(sp)
    80001c3c:	01010113          	addi	sp,sp,16
    80001c40:	00008067          	ret

0000000080001c44 <_ZN9Scheduler4initEv>:
        Scheduler::init();
    Queue<TCB>::push(Scheduler::readyQueue, data);
}

void Scheduler::init() {
    if (Scheduler::initialised) return;
    80001c44:	00004797          	auipc	a5,0x4
    80001c48:	c8c7c783          	lbu	a5,-884(a5) # 800058d0 <_ZN9Scheduler11initialisedE>
    80001c4c:	00078463          	beqz	a5,80001c54 <_ZN9Scheduler4initEv+0x10>
    80001c50:	00008067          	ret
void Scheduler::init() {
    80001c54:	ff010113          	addi	sp,sp,-16
    80001c58:	00113423          	sd	ra,8(sp)
    80001c5c:	00813023          	sd	s0,0(sp)
    80001c60:	01010413          	addi	s0,sp,16
    Scheduler::readyQueue =
            (Queue<TCB>*)mem_alloc(sizeof(Queue<TCB>));
    80001c64:	01800513          	li	a0,24
    80001c68:	fffff097          	auipc	ra,0xfffff
    80001c6c:	700080e7          	jalr	1792(ra) # 80001368 <_Z9mem_allocm>
    Scheduler::readyQueue =
    80001c70:	00004797          	auipc	a5,0x4
    80001c74:	c6078793          	addi	a5,a5,-928 # 800058d0 <_ZN9Scheduler11initialisedE>
    80001c78:	00a7b423          	sd	a0,8(a5)
    Scheduler::initialised = true;
    80001c7c:	00100713          	li	a4,1
    80001c80:	00e78023          	sb	a4,0(a5)
}
    80001c84:	00813083          	ld	ra,8(sp)
    80001c88:	00013403          	ld	s0,0(sp)
    80001c8c:	01010113          	addi	sp,sp,16
    80001c90:	00008067          	ret

0000000080001c94 <_ZN9Scheduler3getEv>:
    return (Scheduler::initialised) ?
    80001c94:	00004797          	auipc	a5,0x4
    80001c98:	c3c7c783          	lbu	a5,-964(a5) # 800058d0 <_ZN9Scheduler11initialisedE>
    80001c9c:	02078a63          	beqz	a5,80001cd0 <_ZN9Scheduler3getEv+0x3c>
TCB *Scheduler::get() {
    80001ca0:	ff010113          	addi	sp,sp,-16
    80001ca4:	00113423          	sd	ra,8(sp)
    80001ca8:	00813023          	sd	s0,0(sp)
    80001cac:	01010413          	addi	s0,sp,16
        Queue<TCB>::pop(Scheduler::readyQueue) : nullptr;
    80001cb0:	00004517          	auipc	a0,0x4
    80001cb4:	c2853503          	ld	a0,-984(a0) # 800058d8 <_ZN9Scheduler10readyQueueE>
    80001cb8:	00000097          	auipc	ra,0x0
    80001cbc:	0a0080e7          	jalr	160(ra) # 80001d58 <_ZN5QueueI3TCBE3popEPS1_>
}
    80001cc0:	00813083          	ld	ra,8(sp)
    80001cc4:	00013403          	ld	s0,0(sp)
    80001cc8:	01010113          	addi	sp,sp,16
    80001ccc:	00008067          	ret
    return (Scheduler::initialised) ?
    80001cd0:	00000513          	li	a0,0
}
    80001cd4:	00008067          	ret

0000000080001cd8 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB * data) {
    80001cd8:	fe010113          	addi	sp,sp,-32
    80001cdc:	00113c23          	sd	ra,24(sp)
    80001ce0:	00813823          	sd	s0,16(sp)
    80001ce4:	00913423          	sd	s1,8(sp)
    80001ce8:	02010413          	addi	s0,sp,32
    80001cec:	00050493          	mv	s1,a0
    if (!Scheduler::initialised)
    80001cf0:	00004797          	auipc	a5,0x4
    80001cf4:	be07c783          	lbu	a5,-1056(a5) # 800058d0 <_ZN9Scheduler11initialisedE>
    80001cf8:	02078663          	beqz	a5,80001d24 <_ZN9Scheduler3putEP3TCB+0x4c>
    Queue<TCB>::push(Scheduler::readyQueue, data);
    80001cfc:	00048593          	mv	a1,s1
    80001d00:	00004517          	auipc	a0,0x4
    80001d04:	bd853503          	ld	a0,-1064(a0) # 800058d8 <_ZN9Scheduler10readyQueueE>
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	13c080e7          	jalr	316(ra) # 80001e44 <_ZN5QueueI3TCBE4pushEPS1_PS0_>
}
    80001d10:	01813083          	ld	ra,24(sp)
    80001d14:	01013403          	ld	s0,16(sp)
    80001d18:	00813483          	ld	s1,8(sp)
    80001d1c:	02010113          	addi	sp,sp,32
    80001d20:	00008067          	ret
        Scheduler::init();
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	f20080e7          	jalr	-224(ra) # 80001c44 <_ZN9Scheduler4initEv>
    80001d2c:	fd1ff06f          	j	80001cfc <_ZN9Scheduler3putEP3TCB+0x24>

0000000080001d30 <_ZN5QueueI3TCBE4NodedlEPv>:
    p->lastNodeAddr -= (uint64)sizeof(Node);
    return (void*)p->lastNodeAddr;
}

template<typename T>
void Queue<T>::Node::operator delete(void* p) {
    80001d30:	ff010113          	addi	sp,sp,-16
    80001d34:	00113423          	sd	ra,8(sp)
    80001d38:	00813023          	sd	s0,0(sp)
    80001d3c:	01010413          	addi	s0,sp,16
    // page won't be freed if pointer doesn't point to its beginning
    mem_free(p);
    80001d40:	fffff097          	auipc	ra,0xfffff
    80001d44:	65c080e7          	jalr	1628(ra) # 8000139c <_Z8mem_freePv>
}
    80001d48:	00813083          	ld	ra,8(sp)
    80001d4c:	00013403          	ld	s0,0(sp)
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00008067          	ret

0000000080001d58 <_ZN5QueueI3TCBE3popEPS1_>:
T *Queue<T>::pop(Queue<T>* self) {
    80001d58:	fe010113          	addi	sp,sp,-32
    80001d5c:	00113c23          	sd	ra,24(sp)
    80001d60:	00813823          	sd	s0,16(sp)
    80001d64:	00913423          	sd	s1,8(sp)
    80001d68:	01213023          	sd	s2,0(sp)
    80001d6c:	02010413          	addi	s0,sp,32
    80001d70:	00050493          	mv	s1,a0
    if(!self->head) return nullptr;
    80001d74:	00853503          	ld	a0,8(a0)
    80001d78:	04050a63          	beqz	a0,80001dcc <_ZN5QueueI3TCBE3popEPS1_+0x74>
    T* data = toPop->data;
    80001d7c:	00853903          	ld	s2,8(a0)
    self->head = self->head->next;
    80001d80:	00053783          	ld	a5,0(a0)
    80001d84:	00f4b423          	sd	a5,8(s1)
    if (toPop == self->last) {
    80001d88:	0104b783          	ld	a5,16(s1)
    80001d8c:	02f50463          	beq	a0,a5,80001db4 <_ZN5QueueI3TCBE3popEPS1_+0x5c>
        delete toPop;
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	fa0080e7          	jalr	-96(ra) # 80001d30 <_ZN5QueueI3TCBE4NodedlEPv>
}
    80001d98:	00090513          	mv	a0,s2
    80001d9c:	01813083          	ld	ra,24(sp)
    80001da0:	01013403          	ld	s0,16(sp)
    80001da4:	00813483          	ld	s1,8(sp)
    80001da8:	00013903          	ld	s2,0(sp)
    80001dac:	02010113          	addi	sp,sp,32
    80001db0:	00008067          	ret
        self->last = nullptr;
    80001db4:	0004b823          	sd	zero,16(s1)
        mem_free(p);
    80001db8:	fc057513          	andi	a0,a0,-64
    80001dbc:	fffff097          	auipc	ra,0xfffff
    80001dc0:	5e0080e7          	jalr	1504(ra) # 8000139c <_Z8mem_freePv>
        self->lastNodeAddr = 0;
    80001dc4:	0004b023          	sd	zero,0(s1)
    80001dc8:	fd1ff06f          	j	80001d98 <_ZN5QueueI3TCBE3popEPS1_+0x40>
    if(!self->head) return nullptr;
    80001dcc:	00050913          	mv	s2,a0
    80001dd0:	fc9ff06f          	j	80001d98 <_ZN5QueueI3TCBE3popEPS1_+0x40>

0000000080001dd4 <_ZN5QueueI3TCBE4NodenwEmPS1_>:
void *Queue<T>::Node::operator new(size_t sz, Queue<T>* p) {
    80001dd4:	fe010113          	addi	sp,sp,-32
    80001dd8:	00113c23          	sd	ra,24(sp)
    80001ddc:	00813823          	sd	s0,16(sp)
    80001de0:	00913423          	sd	s1,8(sp)
    80001de4:	02010413          	addi	s0,sp,32
    if (sz > MEM_BLOCK_SIZE)
    80001de8:	04000793          	li	a5,64
    80001dec:	02a7ea63          	bltu	a5,a0,80001e20 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x4c>
    80001df0:	00058493          	mv	s1,a1
    if (p->lastNodeAddr % MEM_BLOCK_SIZE == 0) {
    80001df4:	0005b783          	ld	a5,0(a1)
    80001df8:	03f7f793          	andi	a5,a5,63
    80001dfc:	02078863          	beqz	a5,80001e2c <_ZN5QueueI3TCBE4NodenwEmPS1_+0x58>
    p->lastNodeAddr -= (uint64)sizeof(Node);
    80001e00:	0004b503          	ld	a0,0(s1)
    80001e04:	ff050513          	addi	a0,a0,-16
    80001e08:	00a4b023          	sd	a0,0(s1)
}
    80001e0c:	01813083          	ld	ra,24(sp)
    80001e10:	01013403          	ld	s0,16(sp)
    80001e14:	00813483          	ld	s1,8(sp)
    80001e18:	02010113          	addi	sp,sp,32
    80001e1c:	00008067          	ret
        return mem_alloc(sz);
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	548080e7          	jalr	1352(ra) # 80001368 <_Z9mem_allocm>
    80001e28:	fe5ff06f          	j	80001e0c <_ZN5QueueI3TCBE4NodenwEmPS1_+0x38>
        void* ptr = mem_alloc(MEM_BLOCK_SIZE);
    80001e2c:	04000513          	li	a0,64
    80001e30:	fffff097          	auipc	ra,0xfffff
    80001e34:	538080e7          	jalr	1336(ra) # 80001368 <_Z9mem_allocm>
        p->lastNodeAddr = (uint64) ptr + MEM_BLOCK_SIZE;
    80001e38:	04050513          	addi	a0,a0,64
    80001e3c:	00a4b023          	sd	a0,0(s1)
    80001e40:	fc1ff06f          	j	80001e00 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x2c>

0000000080001e44 <_ZN5QueueI3TCBE4pushEPS1_PS0_>:
void Queue<T>::push(Queue<T>*self ,T *data) {
    80001e44:	fe010113          	addi	sp,sp,-32
    80001e48:	00113c23          	sd	ra,24(sp)
    80001e4c:	00813823          	sd	s0,16(sp)
    80001e50:	00913423          	sd	s1,8(sp)
    80001e54:	01213023          	sd	s2,0(sp)
    80001e58:	02010413          	addi	s0,sp,32
    80001e5c:	00050493          	mv	s1,a0
    80001e60:	00058913          	mv	s2,a1
    Node* node = new(self) Node();
    80001e64:	00050593          	mv	a1,a0
    80001e68:	01000513          	li	a0,16
    80001e6c:	00000097          	auipc	ra,0x0
    80001e70:	f68080e7          	jalr	-152(ra) # 80001dd4 <_ZN5QueueI3TCBE4NodenwEmPS1_>
    80001e74:	00053023          	sd	zero,0(a0)
    node->data = data;
    80001e78:	01253423          	sd	s2,8(a0)
    if (!self->head) {
    80001e7c:	0084b783          	ld	a5,8(s1)
    80001e80:	02078463          	beqz	a5,80001ea8 <_ZN5QueueI3TCBE4pushEPS1_PS0_+0x64>
    self->last->next = node;
    80001e84:	0104b783          	ld	a5,16(s1)
    80001e88:	00a7b023          	sd	a0,0(a5)
    self->last = node;
    80001e8c:	00a4b823          	sd	a0,16(s1)
}
    80001e90:	01813083          	ld	ra,24(sp)
    80001e94:	01013403          	ld	s0,16(sp)
    80001e98:	00813483          	ld	s1,8(sp)
    80001e9c:	00013903          	ld	s2,0(sp)
    80001ea0:	02010113          	addi	sp,sp,32
    80001ea4:	00008067          	ret
        self->head = self->last = node;
    80001ea8:	00a4b823          	sd	a0,16(s1)
    80001eac:	00a4b423          	sd	a0,8(s1)
        return;
    80001eb0:	fe1ff06f          	j	80001e90 <_ZN5QueueI3TCBE4pushEPS1_PS0_+0x4c>

0000000080001eb4 <main>:
    uint64 a = 0;
    explicit TCB(int k) : i(k) {}
};


int main() {
    80001eb4:	fe010113          	addi	sp,sp,-32
    80001eb8:	00113c23          	sd	ra,24(sp)
    80001ebc:	00813823          	sd	s0,16(sp)
    80001ec0:	00913423          	sd	s1,8(sp)
    80001ec4:	01213023          	sd	s2,0(sp)
    80001ec8:	02010413          	addi	s0,sp,32
    __putc(((char)sizeof(AVLTree) + (char)0));
    80001ecc:	04800513          	li	a0,72
    80001ed0:	00002097          	auipc	ra,0x2
    80001ed4:	7cc080e7          	jalr	1996(ra) # 8000469c <__putc>

    RiscV::stvecW((uint64)&RiscV::setStvecTable | 0x01);
    80001ed8:	fffff797          	auipc	a5,0xfffff
    80001edc:	12878793          	addi	a5,a5,296 # 80001000 <_ZN5RiscV13setStvecTableEv>
    80001ee0:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001ee4:	10579073          	csrw	stvec,a5



    TCB* th1 = new TCB(55);
    80001ee8:	01800513          	li	a0,24
    80001eec:	00000097          	auipc	ra,0x0
    80001ef0:	0f8080e7          	jalr	248(ra) # 80001fe4 <_Znwm>
    80001ef4:	00050913          	mv	s2,a0
    explicit TCB(int k) : i(k) {}
    80001ef8:	03700793          	li	a5,55
    80001efc:	00f53023          	sd	a5,0(a0)
    80001f00:	00053423          	sd	zero,8(a0)
    80001f04:	00053823          	sd	zero,16(a0)
    TCB* th2 = new TCB(2);
    80001f08:	01800513          	li	a0,24
    80001f0c:	00000097          	auipc	ra,0x0
    80001f10:	0d8080e7          	jalr	216(ra) # 80001fe4 <_Znwm>
    80001f14:	00050493          	mv	s1,a0
    explicit TCB(int k) : i(k) {}
    80001f18:	00200793          	li	a5,2
    80001f1c:	00f53023          	sd	a5,0(a0)
    80001f20:	00053423          	sd	zero,8(a0)
    80001f24:	00053823          	sd	zero,16(a0)

    Scheduler::put(th1);
    80001f28:	00090513          	mv	a0,s2
    80001f2c:	00000097          	auipc	ra,0x0
    80001f30:	dac080e7          	jalr	-596(ra) # 80001cd8 <_ZN9Scheduler3putEP3TCB>
    Scheduler::put(th2);
    80001f34:	00048513          	mv	a0,s1
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	da0080e7          	jalr	-608(ra) # 80001cd8 <_ZN9Scheduler3putEP3TCB>

    __putc((char)(Scheduler::get()->i + '0')); __putc('\n');
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	d54080e7          	jalr	-684(ra) # 80001c94 <_ZN9Scheduler3getEv>
    80001f48:	00053503          	ld	a0,0(a0)
    80001f4c:	0305051b          	addiw	a0,a0,48
    80001f50:	0ff57513          	andi	a0,a0,255
    80001f54:	00002097          	auipc	ra,0x2
    80001f58:	748080e7          	jalr	1864(ra) # 8000469c <__putc>
    80001f5c:	00a00513          	li	a0,10
    80001f60:	00002097          	auipc	ra,0x2
    80001f64:	73c080e7          	jalr	1852(ra) # 8000469c <__putc>
    __putc((char)(Scheduler::get()->i + '0')); __putc('\n');
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	d2c080e7          	jalr	-724(ra) # 80001c94 <_ZN9Scheduler3getEv>
    80001f70:	00053503          	ld	a0,0(a0)
    80001f74:	0305051b          	addiw	a0,a0,48
    80001f78:	0ff57513          	andi	a0,a0,255
    80001f7c:	00002097          	auipc	ra,0x2
    80001f80:	720080e7          	jalr	1824(ra) # 8000469c <__putc>
    80001f84:	00a00513          	li	a0,10
    80001f88:	00002097          	auipc	ra,0x2
    80001f8c:	714080e7          	jalr	1812(ra) # 8000469c <__putc>


    delete th1;
    80001f90:	00090863          	beqz	s2,80001fa0 <main+0xec>
    80001f94:	00090513          	mv	a0,s2
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	09c080e7          	jalr	156(ra) # 80002034 <_ZdlPv>
    delete th2;
    80001fa0:	00048863          	beqz	s1,80001fb0 <main+0xfc>
    80001fa4:	00048513          	mv	a0,s1
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	08c080e7          	jalr	140(ra) # 80002034 <_ZdlPv>

    return 0;
}
    80001fb0:	00000513          	li	a0,0
    80001fb4:	01813083          	ld	ra,24(sp)
    80001fb8:	01013403          	ld	s0,16(sp)
    80001fbc:	00813483          	ld	s1,8(sp)
    80001fc0:	00013903          	ld	s2,0(sp)
    80001fc4:	02010113          	addi	sp,sp,32
    80001fc8:	00008067          	ret
    static void setStvecTable(){}
    80001fcc:	ff010113          	addi	sp,sp,-16
    80001fd0:	00813423          	sd	s0,8(sp)
    80001fd4:	01010413          	addi	s0,sp,16
    80001fd8:	00813403          	ld	s0,8(sp)
    80001fdc:	01010113          	addi	sp,sp,16
    80001fe0:	00008067          	ret

0000000080001fe4 <_Znwm>:
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.h"

void *operator new(size_t n) {
    80001fe4:	ff010113          	addi	sp,sp,-16
    80001fe8:	00113423          	sd	ra,8(sp)
    80001fec:	00813023          	sd	s0,0(sp)
    80001ff0:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001ff4:	fffff097          	auipc	ra,0xfffff
    80001ff8:	374080e7          	jalr	884(ra) # 80001368 <_Z9mem_allocm>
}
    80001ffc:	00813083          	ld	ra,8(sp)
    80002000:	00013403          	ld	s0,0(sp)
    80002004:	01010113          	addi	sp,sp,16
    80002008:	00008067          	ret

000000008000200c <_Znam>:

void *operator new[](size_t n) {
    8000200c:	ff010113          	addi	sp,sp,-16
    80002010:	00113423          	sd	ra,8(sp)
    80002014:	00813023          	sd	s0,0(sp)
    80002018:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	34c080e7          	jalr	844(ra) # 80001368 <_Z9mem_allocm>
}
    80002024:	00813083          	ld	ra,8(sp)
    80002028:	00013403          	ld	s0,0(sp)
    8000202c:	01010113          	addi	sp,sp,16
    80002030:	00008067          	ret

0000000080002034 <_ZdlPv>:

void operator delete(void *p) noexcept {
    80002034:	ff010113          	addi	sp,sp,-16
    80002038:	00113423          	sd	ra,8(sp)
    8000203c:	00813023          	sd	s0,0(sp)
    80002040:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002044:	fffff097          	auipc	ra,0xfffff
    80002048:	358080e7          	jalr	856(ra) # 8000139c <_Z8mem_freePv>
}
    8000204c:	00813083          	ld	ra,8(sp)
    80002050:	00013403          	ld	s0,0(sp)
    80002054:	01010113          	addi	sp,sp,16
    80002058:	00008067          	ret

000000008000205c <_ZdaPv>:

void operator delete[](void *p) noexcept {
    8000205c:	ff010113          	addi	sp,sp,-16
    80002060:	00113423          	sd	ra,8(sp)
    80002064:	00813023          	sd	s0,0(sp)
    80002068:	01010413          	addi	s0,sp,16
    mem_free(p);
    8000206c:	fffff097          	auipc	ra,0xfffff
    80002070:	330080e7          	jalr	816(ra) # 8000139c <_Z8mem_freePv>
    80002074:	00813083          	ld	ra,8(sp)
    80002078:	00013403          	ld	s0,0(sp)
    8000207c:	01010113          	addi	sp,sp,16
    80002080:	00008067          	ret

0000000080002084 <_ZN17interruptHandlers20handleSupervisorTrapEv>:
#include "../h/MemoryAllocator.h"
#include "../h/RiscV.h"

namespace interruptHandlers {

    void handleSupervisorTrap() {
    80002084:	fc010113          	addi	sp,sp,-64
    80002088:	02113c23          	sd	ra,56(sp)
    8000208c:	02813823          	sd	s0,48(sp)
    80002090:	04010413          	addi	s0,sp,64
    static void mc_sip(BitMaskSip mask);
};

inline uint64 RiscV::scauseR() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002094:	142027f3          	csrr	a5,scause
    80002098:	fcf43023          	sd	a5,-64(s0)
    return scause;
    8000209c:	fc043783          	ld	a5,-64(s0)
        uint64 scause = RiscV::scauseR();
        // not ecall interruption
        if (scause != (uint64) (1 << 3) && scause != (uint64) (1 << 3 | 0x01)) {
    800020a0:	ff878793          	addi	a5,a5,-8
    800020a4:	00100713          	li	a4,1
    800020a8:	04f76863          	bltu	a4,a5,800020f8 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x74>
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 RiscV::sepcR() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800020ac:	141027f3          	csrr	a5,sepc
    800020b0:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800020b4:	fd843783          	ld	a5,-40(s0)
            return;
        }

        // interrupt from UserMode(0x08) or KernelMode(0x09)
        // retVal is passed implicitly by changing a0 on stack
        uint64 volatile sepc = RiscV::sepcR() + 4;
    800020b8:	00478793          	addi	a5,a5,4
    800020bc:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("mv a1, %0" : : "r"(val));
}

inline uint64 RiscV::sstatusR() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020c0:	100027f3          	csrr	a5,sstatus
    800020c4:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800020c8:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sstatus = RiscV::sstatusR();
    800020cc:	fef43023          	sd	a5,-32(s0)
    __asm__ volatile ("mv %0, a0" : "=r"(a0));
    800020d0:	00050793          	mv	a5,a0
    800020d4:	fcf43423          	sd	a5,-56(s0)
    return a0;
    800020d8:	fc843783          	ld	a5,-56(s0)
        uint64 codeOp = RiscV::a0R();
        uint64 retVal;

        switch (codeOp) {
    800020dc:	02e78663          	beq	a5,a4,80002108 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x84>
    800020e0:	00200713          	li	a4,2
    800020e4:	02e78e63          	beq	a5,a4,80002120 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x9c>
                break;
            default:
                break;
        }

        RiscV::sstatusW(sstatus);
    800020e8:	fe043783          	ld	a5,-32(s0)
}

inline void RiscV::sstatusW(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800020ec:	10079073          	csrw	sstatus,a5
        RiscV::sepcW(sepc);
    800020f0:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800020f4:	14179073          	csrw	sepc,a5

    }
    800020f8:	03813083          	ld	ra,56(sp)
    800020fc:	03013403          	ld	s0,48(sp)
    80002100:	04010113          	addi	sp,sp,64
    80002104:	00008067          	ret
                __asm__ volatile ("mv %0, a1" : "=r" (size));
    80002108:	00058513          	mv	a0,a1
                retVal = (uint64) MemoryAllocator::mem_alloc(size);
    8000210c:	00000097          	auipc	ra,0x0
    80002110:	118080e7          	jalr	280(ra) # 80002224 <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    80002114:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(fp)");
    80002118:	04543823          	sd	t0,80(s0)
                break;
    8000211c:	fcdff06f          	j	800020e8 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>
                __asm__ volatile ("mv %0, a1" : "=r"(ptr));
    80002120:	00058513          	mv	a0,a1
                retVal = MemoryAllocator::mem_free(ptr);
    80002124:	00000097          	auipc	ra,0x0
    80002128:	258080e7          	jalr	600(ra) # 8000237c <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    8000212c:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(fp)");
    80002130:	04543823          	sd	t0,80(s0)
                break;
    80002134:	fb5ff06f          	j	800020e8 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>

0000000080002138 <_ZN17interruptHandlers22handleConsoleInterruptEv>:

    void handleConsoleInterrupt() {
    80002138:	ff010113          	addi	sp,sp,-16
    8000213c:	00113423          	sd	ra,8(sp)
    80002140:	00813023          	sd	s0,0(sp)
    80002144:	01010413          	addi	s0,sp,16
        console_handler();
    80002148:	00002097          	auipc	ra,0x2
    8000214c:	5c8080e7          	jalr	1480(ra) # 80004710 <console_handler>
    }
    80002150:	00813083          	ld	ra,8(sp)
    80002154:	00013403          	ld	s0,0(sp)
    80002158:	01010113          	addi	sp,sp,16
    8000215c:	00008067          	ret

0000000080002160 <_ZN17interruptHandlers20handleTimerInterruptEv>:

    void handleTimerInterrupt() {
    80002160:	ff010113          	addi	sp,sp,-16
    80002164:	00813423          	sd	s0,8(sp)
    80002168:	01010413          	addi	s0,sp,16
inline void RiscV::ms_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"((uint64)mask));
}

inline void RiscV::mc_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"((uint64)mask));
    8000216c:	00200793          	li	a5,2
    80002170:	1447b073          	csrc	sip,a5
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SSIP);
    }
    80002174:	00813403          	ld	s0,8(sp)
    80002178:	01010113          	addi	sp,sp,16
    8000217c:	00008067          	ret

0000000080002180 <_ZN15MemoryAllocator4initEv>:
const uint64 MemoryAllocator::HEADER_SIZE = (uint64)
        ((sizeof(AVLTree) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
bool MemoryAllocator::initialised = false;


void MemoryAllocator::init() {
    80002180:	ff010113          	addi	sp,sp,-16
    80002184:	00813423          	sd	s0,8(sp)
    80002188:	01010413          	addi	s0,sp,16
    if (MemoryAllocator::initialised) return;
    8000218c:	00003797          	auipc	a5,0x3
    80002190:	7547c783          	lbu	a5,1876(a5) # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002194:	08079263          	bnez	a5,80002218 <_ZN15MemoryAllocator4initEv+0x98>

    MemoryAllocator::startAddr = (((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002198:	00003797          	auipc	a5,0x3
    8000219c:	6d87b783          	ld	a5,1752(a5) # 80005870 <_GLOBAL_OFFSET_TABLE_+0x8>
    800021a0:	0007b783          	ld	a5,0(a5)
    800021a4:	03f78793          	addi	a5,a5,63
    800021a8:	fc07f793          	andi	a5,a5,-64
    800021ac:	00003717          	auipc	a4,0x3
    800021b0:	73470713          	addi	a4,a4,1844 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    800021b4:	00f73423          	sd	a5,8(a4)
    MemoryAllocator::endAddr = ((uint64)HEAP_END_ADDR / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800021b8:	00003697          	auipc	a3,0x3
    800021bc:	6c86b683          	ld	a3,1736(a3) # 80005880 <_GLOBAL_OFFSET_TABLE_+0x18>
    800021c0:	0006b683          	ld	a3,0(a3)
    800021c4:	fc06f693          	andi	a3,a3,-64
    800021c8:	00d73823          	sd	a3,16(a4)

    MemoryAllocator::free = (AVLTree*) MemoryAllocator::startAddr;
    800021cc:	00f73c23          	sd	a5,24(a4)
        resetAll();
        this->sz = sz;
    }

    void resetAll(RESET_FLAGS flags = NO_FLAG) {
        left = right = parent = next = prev = sameSizeNext = sameSizePrev = nullptr; height = 0;
    800021d0:	0207b023          	sd	zero,32(a5)
    800021d4:	0007bc23          	sd	zero,24(a5)
    800021d8:	0207b823          	sd	zero,48(a5)
    800021dc:	0207b423          	sd	zero,40(a5)
    800021e0:	0007b823          	sd	zero,16(a5)
    800021e4:	0007b423          	sd	zero,8(a5)
    800021e8:	0007b023          	sd	zero,0(a5)
    800021ec:	0407a023          	sw	zero,64(a5)
    MemoryAllocator::free->resetAll();
    MemoryAllocator::free->isFree = true;
    800021f0:	01873683          	ld	a3,24(a4)
    800021f4:	00100613          	li	a2,1
    800021f8:	04c68223          	sb	a2,68(a3)
    MemoryAllocator::free->sz =
            (size_t) (MemoryAllocator::endAddr - MemoryAllocator::startAddr - MemoryAllocator::HEADER_SIZE);
    800021fc:	01073783          	ld	a5,16(a4)
    80002200:	00873583          	ld	a1,8(a4)
    80002204:	40b787b3          	sub	a5,a5,a1
    80002208:	f8078793          	addi	a5,a5,-128
    MemoryAllocator::free->sz =
    8000220c:	02f6bc23          	sd	a5,56(a3)
    MemoryAllocator::first = MemoryAllocator::free;
    80002210:	02d73023          	sd	a3,32(a4)
    MemoryAllocator::initialised = true;
    80002214:	00c70023          	sb	a2,0(a4)
}
    80002218:	00813403          	ld	s0,8(sp)
    8000221c:	01010113          	addi	sp,sp,16
    80002220:	00008067          	ret

0000000080002224 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    80002224:	fd010113          	addi	sp,sp,-48
    80002228:	02113423          	sd	ra,40(sp)
    8000222c:	02813023          	sd	s0,32(sp)
    80002230:	00913c23          	sd	s1,24(sp)
    80002234:	01213823          	sd	s2,16(sp)
    80002238:	01313423          	sd	s3,8(sp)
    8000223c:	03010413          	addi	s0,sp,48
    if (size <= 0) return nullptr;
    80002240:	12050a63          	beqz	a0,80002374 <_ZN15MemoryAllocator9mem_allocEm+0x150>
    80002244:	00050493          	mv	s1,a0
    if (!MemoryAllocator::initialised)
    80002248:	00003797          	auipc	a5,0x3
    8000224c:	6987c783          	lbu	a5,1688(a5) # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002250:	08078e63          	beqz	a5,800022ec <_ZN15MemoryAllocator9mem_allocEm+0xc8>
        MemoryAllocator::init();

    size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002254:	03f48493          	addi	s1,s1,63
    80002258:	fc04f493          	andi	s1,s1,-64

    AVLTree* freeSeg = AVLTree::findFreeSeg(MemoryAllocator::free, size);
    8000225c:	00048593          	mv	a1,s1
    80002260:	00003517          	auipc	a0,0x3
    80002264:	69853503          	ld	a0,1688(a0) # 800058f8 <_ZN15MemoryAllocator4freeE>
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	164080e7          	jalr	356(ra) # 800013cc <_ZN7AVLTree11findFreeSegEPS_m>
    80002270:	00050913          	mv	s2,a0
    if (!freeSeg) return nullptr;
    80002274:	04050c63          	beqz	a0,800022cc <_ZN15MemoryAllocator9mem_allocEm+0xa8>

    MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, freeSeg);
    80002278:	00003997          	auipc	s3,0x3
    8000227c:	66898993          	addi	s3,s3,1640 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002280:	00050593          	mv	a1,a0
    80002284:	0189b503          	ld	a0,24(s3)
    80002288:	fffff097          	auipc	ra,0xfffff
    8000228c:	628080e7          	jalr	1576(ra) # 800018b0 <_ZN7AVLTree6removeEPS_S0_>
    80002290:	00a9bc23          	sd	a0,24(s3)

    if (size + MEM_BLOCK_SIZE + HEADER_SIZE <= freeSeg->sz
    80002294:	0c048793          	addi	a5,s1,192
    80002298:	03893703          	ld	a4,56(s2)
    8000229c:	00f76663          	bltu	a4,a5,800022a8 <_ZN15MemoryAllocator9mem_allocEm+0x84>
                && size + MEM_BLOCK_SIZE + HEADER_SIZE >= size) { //overflow check
    800022a0:	f3f00793          	li	a5,-193
    800022a4:	0497fa63          	bgeu	a5,s1,800022f8 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
        freeSeg->sz = size;
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
        newFreeSeg->isFree = true;
    } else {
        MemoryAllocator::first = AVLTree::removeLL(freeSeg, MemoryAllocator::first);
    800022a8:	00003497          	auipc	s1,0x3
    800022ac:	63848493          	addi	s1,s1,1592 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    800022b0:	0204b583          	ld	a1,32(s1)
    800022b4:	00090513          	mv	a0,s2
    800022b8:	00000097          	auipc	ra,0x0
    800022bc:	8b0080e7          	jalr	-1872(ra) # 80001b68 <_ZN7AVLTree8removeLLEPS_S0_>
    800022c0:	02a4b023          	sd	a0,32(s1)
    }
    freeSeg->isFree = false;
    800022c4:	04090223          	sb	zero,68(s2)
    return (void*) ((uint64)freeSeg + HEADER_SIZE);
    800022c8:	08090913          	addi	s2,s2,128
}
    800022cc:	00090513          	mv	a0,s2
    800022d0:	02813083          	ld	ra,40(sp)
    800022d4:	02013403          	ld	s0,32(sp)
    800022d8:	01813483          	ld	s1,24(sp)
    800022dc:	01013903          	ld	s2,16(sp)
    800022e0:	00813983          	ld	s3,8(sp)
    800022e4:	03010113          	addi	sp,sp,48
    800022e8:	00008067          	ret
        MemoryAllocator::init();
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	e94080e7          	jalr	-364(ra) # 80002180 <_ZN15MemoryAllocator4initEv>
    800022f4:	f61ff06f          	j	80002254 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        AVLTree* newFreeSeg = (AVLTree*) ((uint64)freeSeg + size + HEADER_SIZE);
    800022f8:	009907b3          	add	a5,s2,s1
    800022fc:	08078993          	addi	s3,a5,128
    80002300:	0a07b023          	sd	zero,160(a5)
    80002304:	0807bc23          	sd	zero,152(a5)
    80002308:	0a07b823          	sd	zero,176(a5)
    8000230c:	0a07b423          	sd	zero,168(a5)
    80002310:	0807b823          	sd	zero,144(a5)
    80002314:	0807b423          	sd	zero,136(a5)
    80002318:	0807b023          	sd	zero,128(a5)
    8000231c:	0c07a023          	sw	zero,192(a5)
        newFreeSeg->sz = freeSeg->sz - size - HEADER_SIZE;
    80002320:	03893783          	ld	a5,56(s2)
    80002324:	409787b3          	sub	a5,a5,s1
    80002328:	f8078793          	addi	a5,a5,-128
    8000232c:	02f9bc23          	sd	a5,56(s3)
        freeSeg->sz = size;
    80002330:	02993c23          	sd	s1,56(s2)
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
    80002334:	00003497          	auipc	s1,0x3
    80002338:	5ac48493          	addi	s1,s1,1452 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    8000233c:	00098593          	mv	a1,s3
    80002340:	0184b503          	ld	a0,24(s1)
    80002344:	fffff097          	auipc	ra,0xfffff
    80002348:	4c0080e7          	jalr	1216(ra) # 80001804 <_ZN7AVLTree6insertEPS_S0_>
    8000234c:	00a4bc23          	sd	a0,24(s1)
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
    80002350:	0204b603          	ld	a2,32(s1)
    80002354:	00098593          	mv	a1,s3
    80002358:	00090513          	mv	a0,s2
    8000235c:	fffff097          	auipc	ra,0xfffff
    80002360:	79c080e7          	jalr	1948(ra) # 80001af8 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    80002364:	02a4b023          	sd	a0,32(s1)
        newFreeSeg->isFree = true;
    80002368:	00100793          	li	a5,1
    8000236c:	04f98223          	sb	a5,68(s3)
    80002370:	f55ff06f          	j	800022c4 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
    if (size <= 0) return nullptr;
    80002374:	00000913          	li	s2,0
    80002378:	f55ff06f          	j	800022cc <_ZN15MemoryAllocator9mem_allocEm+0xa8>

000000008000237c <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *ptr) {

    if (!ptr) return -1;
    8000237c:	22050c63          	beqz	a0,800025b4 <_ZN15MemoryAllocator8mem_freeEPv+0x238>
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesn't point to beginning of block (its faulty)
    80002380:	03f57713          	andi	a4,a0,63
    80002384:	22071c63          	bnez	a4,800025bc <_ZN15MemoryAllocator8mem_freeEPv+0x240>
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    80002388:	00003717          	auipc	a4,0x3
    8000238c:	56873703          	ld	a4,1384(a4) # 800058f0 <_ZN15MemoryAllocator7endAddrE>
    80002390:	22e57a63          	bgeu	a0,a4,800025c4 <_ZN15MemoryAllocator8mem_freeEPv+0x248>
    80002394:	00003717          	auipc	a4,0x3
    80002398:	55473703          	ld	a4,1364(a4) # 800058e8 <_ZN15MemoryAllocator9startAddrE>
    8000239c:	22e56863          	bltu	a0,a4,800025cc <_ZN15MemoryAllocator8mem_freeEPv+0x250>
int MemoryAllocator::mem_free(void *ptr) {
    800023a0:	fc010113          	addi	sp,sp,-64
    800023a4:	02113c23          	sd	ra,56(sp)
    800023a8:	02813823          	sd	s0,48(sp)
    800023ac:	02913423          	sd	s1,40(sp)
    800023b0:	03213023          	sd	s2,32(sp)
    800023b4:	01313c23          	sd	s3,24(sp)
    800023b8:	01413823          	sd	s4,16(sp)
    800023bc:	01513423          	sd	s5,8(sp)
    800023c0:	04010413          	addi	s0,sp,64

    AVLTree* cur = (AVLTree*) ((uint64)ptr - HEADER_SIZE); cur->resetAll(AVLTree::SAVE_SZ); cur->isFree = true;
    800023c4:	f8050913          	addi	s2,a0,-128
    800023c8:	00090993          	mv	s3,s2
    800023cc:	02093023          	sd	zero,32(s2)
    800023d0:	00093c23          	sd	zero,24(s2)
    800023d4:	02093823          	sd	zero,48(s2)
    800023d8:	02093423          	sd	zero,40(s2)
    800023dc:	00093823          	sd	zero,16(s2)
    800023e0:	00093423          	sd	zero,8(s2)
    800023e4:	f8053023          	sd	zero,-128(a0)
    800023e8:	04092023          	sw	zero,64(s2)
    800023ec:	00100793          	li	a5,1
    800023f0:	04f90223          	sb	a5,68(s2)
    AVLTree* aft = ((uint64)cur + cur->sz + HEADER_SIZE >= MemoryAllocator::endAddr) ? nullptr :
    800023f4:	03893483          	ld	s1,56(s2)
    800023f8:	009904b3          	add	s1,s2,s1
    800023fc:	08048493          	addi	s1,s1,128
    80002400:	00003797          	auipc	a5,0x3
    80002404:	4f07b783          	ld	a5,1264(a5) # 800058f0 <_ZN15MemoryAllocator7endAddrE>
    80002408:	04f4f863          	bgeu	s1,a5,80002458 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    8000240c:	00048a13          	mv	s4,s1
            (AVLTree*) ((uint64)cur + cur->sz + HEADER_SIZE);
    AVLTree* toSwap = nullptr;

    if (aft && aft->isFree) {
    80002410:	04048663          	beqz	s1,8000245c <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    80002414:	0444c783          	lbu	a5,68(s1)
    80002418:	00079663          	bnez	a5,80002424 <_ZN15MemoryAllocator8mem_freeEPv+0xa8>
    AVLTree* toSwap = nullptr;
    8000241c:	00000a13          	li	s4,0
    80002420:	03c0006f          	j	8000245c <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, aft);
    80002424:	00003a97          	auipc	s5,0x3
    80002428:	4bca8a93          	addi	s5,s5,1212 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    8000242c:	00048593          	mv	a1,s1
    80002430:	018ab503          	ld	a0,24(s5)
    80002434:	fffff097          	auipc	ra,0xfffff
    80002438:	47c080e7          	jalr	1148(ra) # 800018b0 <_ZN7AVLTree6removeEPS_S0_>
    8000243c:	00aabc23          	sd	a0,24(s5)
        cur->sz += aft->sz + HEADER_SIZE;
    80002440:	0384b783          	ld	a5,56(s1)
    80002444:	03893703          	ld	a4,56(s2)
    80002448:	00e787b3          	add	a5,a5,a4
    8000244c:	08078793          	addi	a5,a5,128
    80002450:	02f93c23          	sd	a5,56(s2)
        toSwap = aft;
    80002454:	0080006f          	j	8000245c <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    AVLTree* toSwap = nullptr;
    80002458:	00000a13          	li	s4,0
    }

    AVLTree* prev = MemoryAllocator::first;
    8000245c:	00003497          	auipc	s1,0x3
    80002460:	4a44b483          	ld	s1,1188(s1) # 80005900 <_ZN15MemoryAllocator5firstE>
    80002464:	0080006f          	j	8000246c <_ZN15MemoryAllocator8mem_freeEPv+0xf0>
    for(;prev && prev->next && ((uint64)prev->next + prev->next->sz + HEADER_SIZE < (uint64)cur); prev = prev->next);
    80002468:	00070493          	mv	s1,a4
    8000246c:	00048e63          	beqz	s1,80002488 <_ZN15MemoryAllocator8mem_freeEPv+0x10c>
    80002470:	0284b703          	ld	a4,40(s1)
    80002474:	00070a63          	beqz	a4,80002488 <_ZN15MemoryAllocator8mem_freeEPv+0x10c>
    80002478:	03873783          	ld	a5,56(a4)
    8000247c:	00f707b3          	add	a5,a4,a5
    80002480:	08078793          	addi	a5,a5,128
    80002484:	ff27e2e3          	bltu	a5,s2,80002468 <_ZN15MemoryAllocator8mem_freeEPv+0xec>

    if (prev && (uint64)prev + prev->sz + HEADER_SIZE == (uint64)cur) {
    80002488:	00048a63          	beqz	s1,8000249c <_ZN15MemoryAllocator8mem_freeEPv+0x120>
    8000248c:	0384b783          	ld	a5,56(s1)
    80002490:	00f487b3          	add	a5,s1,a5
    80002494:	08078793          	addi	a5,a5,128
    80002498:	06f90663          	beq	s2,a5,80002504 <_ZN15MemoryAllocator8mem_freeEPv+0x188>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
        toSwap = (toSwap) ? toSwap : prev;
        cur = prev;
    }

    MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, cur);
    8000249c:	00003497          	auipc	s1,0x3
    800024a0:	44448493          	addi	s1,s1,1092 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    800024a4:	00098593          	mv	a1,s3
    800024a8:	0184b503          	ld	a0,24(s1)
    800024ac:	fffff097          	auipc	ra,0xfffff
    800024b0:	358080e7          	jalr	856(ra) # 80001804 <_ZN7AVLTree6insertEPS_S0_>
    800024b4:	00a4bc23          	sd	a0,24(s1)
    MemoryAllocator::first = (toSwap) ? AVLTree::swapLL(toSwap, cur, MemoryAllocator::first) :
    800024b8:	0e0a0263          	beqz	s4,8000259c <_ZN15MemoryAllocator8mem_freeEPv+0x220>
    800024bc:	00003617          	auipc	a2,0x3
    800024c0:	44463603          	ld	a2,1092(a2) # 80005900 <_ZN15MemoryAllocator5firstE>
    800024c4:	00098593          	mv	a1,s3
    800024c8:	000a0513          	mv	a0,s4
    800024cc:	fffff097          	auipc	ra,0xfffff
    800024d0:	62c080e7          	jalr	1580(ra) # 80001af8 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    800024d4:	00003797          	auipc	a5,0x3
    800024d8:	42a7b623          	sd	a0,1068(a5) # 80005900 <_ZN15MemoryAllocator5firstE>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    return 0;
    800024dc:	00000513          	li	a0,0
}
    800024e0:	03813083          	ld	ra,56(sp)
    800024e4:	03013403          	ld	s0,48(sp)
    800024e8:	02813483          	ld	s1,40(sp)
    800024ec:	02013903          	ld	s2,32(sp)
    800024f0:	01813983          	ld	s3,24(sp)
    800024f4:	01013a03          	ld	s4,16(sp)
    800024f8:	00813a83          	ld	s5,8(sp)
    800024fc:	04010113          	addi	sp,sp,64
    80002500:	00008067          	ret
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, prev);
    80002504:	00003997          	auipc	s3,0x3
    80002508:	3dc98993          	addi	s3,s3,988 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    8000250c:	00048593          	mv	a1,s1
    80002510:	0189b503          	ld	a0,24(s3)
    80002514:	fffff097          	auipc	ra,0xfffff
    80002518:	39c080e7          	jalr	924(ra) # 800018b0 <_ZN7AVLTree6removeEPS_S0_>
    8000251c:	00a9bc23          	sd	a0,24(s3)
    80002520:	0204b023          	sd	zero,32(s1)
    80002524:	0004bc23          	sd	zero,24(s1)
    80002528:	0204b823          	sd	zero,48(s1)
    8000252c:	0204b423          	sd	zero,40(s1)
    80002530:	0004b823          	sd	zero,16(s1)
    80002534:	0004b423          	sd	zero,8(s1)
    80002538:	0004b023          	sd	zero,0(s1)
    8000253c:	0404a023          	sw	zero,64(s1)
        prev->sz += cur->sz + HEADER_SIZE;
    80002540:	03893783          	ld	a5,56(s2)
    80002544:	0384b703          	ld	a4,56(s1)
    80002548:	00e787b3          	add	a5,a5,a4
    8000254c:	08078793          	addi	a5,a5,128
    80002550:	02f4bc23          	sd	a5,56(s1)
        prev->isFree = true;
    80002554:	00100793          	li	a5,1
    80002558:	04f48223          	sb	a5,68(s1)
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    8000255c:	020a0663          	beqz	s4,80002588 <_ZN15MemoryAllocator8mem_freeEPv+0x20c>
    80002560:	00048513          	mv	a0,s1
    80002564:	00003917          	auipc	s2,0x3
    80002568:	37c90913          	addi	s2,s2,892 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    8000256c:	02093583          	ld	a1,32(s2)
    80002570:	fffff097          	auipc	ra,0xfffff
    80002574:	5f8080e7          	jalr	1528(ra) # 80001b68 <_ZN7AVLTree8removeLLEPS_S0_>
    80002578:	02a93023          	sd	a0,32(s2)
        toSwap = (toSwap) ? toSwap : prev;
    8000257c:	000a0a63          	beqz	s4,80002590 <_ZN15MemoryAllocator8mem_freeEPv+0x214>
        cur = prev;
    80002580:	00048993          	mv	s3,s1
    80002584:	f19ff06f          	j	8000249c <_ZN15MemoryAllocator8mem_freeEPv+0x120>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    80002588:	000a0513          	mv	a0,s4
    8000258c:	fd9ff06f          	j	80002564 <_ZN15MemoryAllocator8mem_freeEPv+0x1e8>
        toSwap = (toSwap) ? toSwap : prev;
    80002590:	00048a13          	mv	s4,s1
        cur = prev;
    80002594:	00048993          	mv	s3,s1
    80002598:	f05ff06f          	j	8000249c <_ZN15MemoryAllocator8mem_freeEPv+0x120>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    8000259c:	00003597          	auipc	a1,0x3
    800025a0:	3645b583          	ld	a1,868(a1) # 80005900 <_ZN15MemoryAllocator5firstE>
    800025a4:	00098513          	mv	a0,s3
    800025a8:	fffff097          	auipc	ra,0xfffff
    800025ac:	610080e7          	jalr	1552(ra) # 80001bb8 <_ZN7AVLTree8insertLLEPS_S0_>
    800025b0:	f25ff06f          	j	800024d4 <_ZN15MemoryAllocator8mem_freeEPv+0x158>
    if (!ptr) return -1;
    800025b4:	fff00513          	li	a0,-1
    800025b8:	00008067          	ret
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesn't point to beginning of block (its faulty)
    800025bc:	ffe00513          	li	a0,-2
    800025c0:	00008067          	ret
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    800025c4:	ffd00513          	li	a0,-3
    800025c8:	00008067          	ret
    800025cc:	ffd00513          	li	a0,-3
}
    800025d0:	00008067          	ret

00000000800025d4 <start>:
    800025d4:	ff010113          	addi	sp,sp,-16
    800025d8:	00813423          	sd	s0,8(sp)
    800025dc:	01010413          	addi	s0,sp,16
    800025e0:	300027f3          	csrr	a5,mstatus
    800025e4:	ffffe737          	lui	a4,0xffffe
    800025e8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7c8f>
    800025ec:	00e7f7b3          	and	a5,a5,a4
    800025f0:	00001737          	lui	a4,0x1
    800025f4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800025f8:	00e7e7b3          	or	a5,a5,a4
    800025fc:	30079073          	csrw	mstatus,a5
    80002600:	00000797          	auipc	a5,0x0
    80002604:	16078793          	addi	a5,a5,352 # 80002760 <system_main>
    80002608:	34179073          	csrw	mepc,a5
    8000260c:	00000793          	li	a5,0
    80002610:	18079073          	csrw	satp,a5
    80002614:	000107b7          	lui	a5,0x10
    80002618:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000261c:	30279073          	csrw	medeleg,a5
    80002620:	30379073          	csrw	mideleg,a5
    80002624:	104027f3          	csrr	a5,sie
    80002628:	2227e793          	ori	a5,a5,546
    8000262c:	10479073          	csrw	sie,a5
    80002630:	fff00793          	li	a5,-1
    80002634:	00a7d793          	srli	a5,a5,0xa
    80002638:	3b079073          	csrw	pmpaddr0,a5
    8000263c:	00f00793          	li	a5,15
    80002640:	3a079073          	csrw	pmpcfg0,a5
    80002644:	f14027f3          	csrr	a5,mhartid
    80002648:	0200c737          	lui	a4,0x200c
    8000264c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002650:	0007869b          	sext.w	a3,a5
    80002654:	00269713          	slli	a4,a3,0x2
    80002658:	000f4637          	lui	a2,0xf4
    8000265c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002660:	00d70733          	add	a4,a4,a3
    80002664:	0037979b          	slliw	a5,a5,0x3
    80002668:	020046b7          	lui	a3,0x2004
    8000266c:	00d787b3          	add	a5,a5,a3
    80002670:	00c585b3          	add	a1,a1,a2
    80002674:	00371693          	slli	a3,a4,0x3
    80002678:	00003717          	auipc	a4,0x3
    8000267c:	29870713          	addi	a4,a4,664 # 80005910 <timer_scratch>
    80002680:	00b7b023          	sd	a1,0(a5)
    80002684:	00d70733          	add	a4,a4,a3
    80002688:	00f73c23          	sd	a5,24(a4)
    8000268c:	02c73023          	sd	a2,32(a4)
    80002690:	34071073          	csrw	mscratch,a4
    80002694:	00000797          	auipc	a5,0x0
    80002698:	6ec78793          	addi	a5,a5,1772 # 80002d80 <timervec>
    8000269c:	30579073          	csrw	mtvec,a5
    800026a0:	300027f3          	csrr	a5,mstatus
    800026a4:	0087e793          	ori	a5,a5,8
    800026a8:	30079073          	csrw	mstatus,a5
    800026ac:	304027f3          	csrr	a5,mie
    800026b0:	0807e793          	ori	a5,a5,128
    800026b4:	30479073          	csrw	mie,a5
    800026b8:	f14027f3          	csrr	a5,mhartid
    800026bc:	0007879b          	sext.w	a5,a5
    800026c0:	00078213          	mv	tp,a5
    800026c4:	30200073          	mret
    800026c8:	00813403          	ld	s0,8(sp)
    800026cc:	01010113          	addi	sp,sp,16
    800026d0:	00008067          	ret

00000000800026d4 <timerinit>:
    800026d4:	ff010113          	addi	sp,sp,-16
    800026d8:	00813423          	sd	s0,8(sp)
    800026dc:	01010413          	addi	s0,sp,16
    800026e0:	f14027f3          	csrr	a5,mhartid
    800026e4:	0200c737          	lui	a4,0x200c
    800026e8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800026ec:	0007869b          	sext.w	a3,a5
    800026f0:	00269713          	slli	a4,a3,0x2
    800026f4:	000f4637          	lui	a2,0xf4
    800026f8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800026fc:	00d70733          	add	a4,a4,a3
    80002700:	0037979b          	slliw	a5,a5,0x3
    80002704:	020046b7          	lui	a3,0x2004
    80002708:	00d787b3          	add	a5,a5,a3
    8000270c:	00c585b3          	add	a1,a1,a2
    80002710:	00371693          	slli	a3,a4,0x3
    80002714:	00003717          	auipc	a4,0x3
    80002718:	1fc70713          	addi	a4,a4,508 # 80005910 <timer_scratch>
    8000271c:	00b7b023          	sd	a1,0(a5)
    80002720:	00d70733          	add	a4,a4,a3
    80002724:	00f73c23          	sd	a5,24(a4)
    80002728:	02c73023          	sd	a2,32(a4)
    8000272c:	34071073          	csrw	mscratch,a4
    80002730:	00000797          	auipc	a5,0x0
    80002734:	65078793          	addi	a5,a5,1616 # 80002d80 <timervec>
    80002738:	30579073          	csrw	mtvec,a5
    8000273c:	300027f3          	csrr	a5,mstatus
    80002740:	0087e793          	ori	a5,a5,8
    80002744:	30079073          	csrw	mstatus,a5
    80002748:	304027f3          	csrr	a5,mie
    8000274c:	0807e793          	ori	a5,a5,128
    80002750:	30479073          	csrw	mie,a5
    80002754:	00813403          	ld	s0,8(sp)
    80002758:	01010113          	addi	sp,sp,16
    8000275c:	00008067          	ret

0000000080002760 <system_main>:
    80002760:	fe010113          	addi	sp,sp,-32
    80002764:	00813823          	sd	s0,16(sp)
    80002768:	00913423          	sd	s1,8(sp)
    8000276c:	00113c23          	sd	ra,24(sp)
    80002770:	02010413          	addi	s0,sp,32
    80002774:	00000097          	auipc	ra,0x0
    80002778:	0c4080e7          	jalr	196(ra) # 80002838 <cpuid>
    8000277c:	00003497          	auipc	s1,0x3
    80002780:	12448493          	addi	s1,s1,292 # 800058a0 <started>
    80002784:	02050263          	beqz	a0,800027a8 <system_main+0x48>
    80002788:	0004a783          	lw	a5,0(s1)
    8000278c:	0007879b          	sext.w	a5,a5
    80002790:	fe078ce3          	beqz	a5,80002788 <system_main+0x28>
    80002794:	0ff0000f          	fence
    80002798:	00003517          	auipc	a0,0x3
    8000279c:	8c050513          	addi	a0,a0,-1856 # 80005058 <_ZN15MemoryAllocator11HEADER_SIZEE+0x38>
    800027a0:	00001097          	auipc	ra,0x1
    800027a4:	a7c080e7          	jalr	-1412(ra) # 8000321c <panic>
    800027a8:	00001097          	auipc	ra,0x1
    800027ac:	9d0080e7          	jalr	-1584(ra) # 80003178 <consoleinit>
    800027b0:	00001097          	auipc	ra,0x1
    800027b4:	15c080e7          	jalr	348(ra) # 8000390c <printfinit>
    800027b8:	00003517          	auipc	a0,0x3
    800027bc:	98050513          	addi	a0,a0,-1664 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    800027c0:	00001097          	auipc	ra,0x1
    800027c4:	ab8080e7          	jalr	-1352(ra) # 80003278 <__printf>
    800027c8:	00003517          	auipc	a0,0x3
    800027cc:	86050513          	addi	a0,a0,-1952 # 80005028 <_ZN15MemoryAllocator11HEADER_SIZEE+0x8>
    800027d0:	00001097          	auipc	ra,0x1
    800027d4:	aa8080e7          	jalr	-1368(ra) # 80003278 <__printf>
    800027d8:	00003517          	auipc	a0,0x3
    800027dc:	96050513          	addi	a0,a0,-1696 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    800027e0:	00001097          	auipc	ra,0x1
    800027e4:	a98080e7          	jalr	-1384(ra) # 80003278 <__printf>
    800027e8:	00001097          	auipc	ra,0x1
    800027ec:	4b0080e7          	jalr	1200(ra) # 80003c98 <kinit>
    800027f0:	00000097          	auipc	ra,0x0
    800027f4:	148080e7          	jalr	328(ra) # 80002938 <trapinit>
    800027f8:	00000097          	auipc	ra,0x0
    800027fc:	16c080e7          	jalr	364(ra) # 80002964 <trapinithart>
    80002800:	00000097          	auipc	ra,0x0
    80002804:	5c0080e7          	jalr	1472(ra) # 80002dc0 <plicinit>
    80002808:	00000097          	auipc	ra,0x0
    8000280c:	5e0080e7          	jalr	1504(ra) # 80002de8 <plicinithart>
    80002810:	00000097          	auipc	ra,0x0
    80002814:	078080e7          	jalr	120(ra) # 80002888 <userinit>
    80002818:	0ff0000f          	fence
    8000281c:	00100793          	li	a5,1
    80002820:	00003517          	auipc	a0,0x3
    80002824:	82050513          	addi	a0,a0,-2016 # 80005040 <_ZN15MemoryAllocator11HEADER_SIZEE+0x20>
    80002828:	00f4a023          	sw	a5,0(s1)
    8000282c:	00001097          	auipc	ra,0x1
    80002830:	a4c080e7          	jalr	-1460(ra) # 80003278 <__printf>
    80002834:	0000006f          	j	80002834 <system_main+0xd4>

0000000080002838 <cpuid>:
    80002838:	ff010113          	addi	sp,sp,-16
    8000283c:	00813423          	sd	s0,8(sp)
    80002840:	01010413          	addi	s0,sp,16
    80002844:	00020513          	mv	a0,tp
    80002848:	00813403          	ld	s0,8(sp)
    8000284c:	0005051b          	sext.w	a0,a0
    80002850:	01010113          	addi	sp,sp,16
    80002854:	00008067          	ret

0000000080002858 <mycpu>:
    80002858:	ff010113          	addi	sp,sp,-16
    8000285c:	00813423          	sd	s0,8(sp)
    80002860:	01010413          	addi	s0,sp,16
    80002864:	00020793          	mv	a5,tp
    80002868:	00813403          	ld	s0,8(sp)
    8000286c:	0007879b          	sext.w	a5,a5
    80002870:	00779793          	slli	a5,a5,0x7
    80002874:	00004517          	auipc	a0,0x4
    80002878:	0cc50513          	addi	a0,a0,204 # 80006940 <cpus>
    8000287c:	00f50533          	add	a0,a0,a5
    80002880:	01010113          	addi	sp,sp,16
    80002884:	00008067          	ret

0000000080002888 <userinit>:
    80002888:	ff010113          	addi	sp,sp,-16
    8000288c:	00813423          	sd	s0,8(sp)
    80002890:	01010413          	addi	s0,sp,16
    80002894:	00813403          	ld	s0,8(sp)
    80002898:	01010113          	addi	sp,sp,16
    8000289c:	fffff317          	auipc	t1,0xfffff
    800028a0:	61830067          	jr	1560(t1) # 80001eb4 <main>

00000000800028a4 <either_copyout>:
    800028a4:	ff010113          	addi	sp,sp,-16
    800028a8:	00813023          	sd	s0,0(sp)
    800028ac:	00113423          	sd	ra,8(sp)
    800028b0:	01010413          	addi	s0,sp,16
    800028b4:	02051663          	bnez	a0,800028e0 <either_copyout+0x3c>
    800028b8:	00058513          	mv	a0,a1
    800028bc:	00060593          	mv	a1,a2
    800028c0:	0006861b          	sext.w	a2,a3
    800028c4:	00002097          	auipc	ra,0x2
    800028c8:	c60080e7          	jalr	-928(ra) # 80004524 <__memmove>
    800028cc:	00813083          	ld	ra,8(sp)
    800028d0:	00013403          	ld	s0,0(sp)
    800028d4:	00000513          	li	a0,0
    800028d8:	01010113          	addi	sp,sp,16
    800028dc:	00008067          	ret
    800028e0:	00002517          	auipc	a0,0x2
    800028e4:	7a050513          	addi	a0,a0,1952 # 80005080 <_ZN15MemoryAllocator11HEADER_SIZEE+0x60>
    800028e8:	00001097          	auipc	ra,0x1
    800028ec:	934080e7          	jalr	-1740(ra) # 8000321c <panic>

00000000800028f0 <either_copyin>:
    800028f0:	ff010113          	addi	sp,sp,-16
    800028f4:	00813023          	sd	s0,0(sp)
    800028f8:	00113423          	sd	ra,8(sp)
    800028fc:	01010413          	addi	s0,sp,16
    80002900:	02059463          	bnez	a1,80002928 <either_copyin+0x38>
    80002904:	00060593          	mv	a1,a2
    80002908:	0006861b          	sext.w	a2,a3
    8000290c:	00002097          	auipc	ra,0x2
    80002910:	c18080e7          	jalr	-1000(ra) # 80004524 <__memmove>
    80002914:	00813083          	ld	ra,8(sp)
    80002918:	00013403          	ld	s0,0(sp)
    8000291c:	00000513          	li	a0,0
    80002920:	01010113          	addi	sp,sp,16
    80002924:	00008067          	ret
    80002928:	00002517          	auipc	a0,0x2
    8000292c:	78050513          	addi	a0,a0,1920 # 800050a8 <_ZN15MemoryAllocator11HEADER_SIZEE+0x88>
    80002930:	00001097          	auipc	ra,0x1
    80002934:	8ec080e7          	jalr	-1812(ra) # 8000321c <panic>

0000000080002938 <trapinit>:
    80002938:	ff010113          	addi	sp,sp,-16
    8000293c:	00813423          	sd	s0,8(sp)
    80002940:	01010413          	addi	s0,sp,16
    80002944:	00813403          	ld	s0,8(sp)
    80002948:	00002597          	auipc	a1,0x2
    8000294c:	78858593          	addi	a1,a1,1928 # 800050d0 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb0>
    80002950:	00004517          	auipc	a0,0x4
    80002954:	07050513          	addi	a0,a0,112 # 800069c0 <tickslock>
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00001317          	auipc	t1,0x1
    80002960:	5cc30067          	jr	1484(t1) # 80003f28 <initlock>

0000000080002964 <trapinithart>:
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00813423          	sd	s0,8(sp)
    8000296c:	01010413          	addi	s0,sp,16
    80002970:	00000797          	auipc	a5,0x0
    80002974:	30078793          	addi	a5,a5,768 # 80002c70 <kernelvec>
    80002978:	10579073          	csrw	stvec,a5
    8000297c:	00813403          	ld	s0,8(sp)
    80002980:	01010113          	addi	sp,sp,16
    80002984:	00008067          	ret

0000000080002988 <usertrap>:
    80002988:	ff010113          	addi	sp,sp,-16
    8000298c:	00813423          	sd	s0,8(sp)
    80002990:	01010413          	addi	s0,sp,16
    80002994:	00813403          	ld	s0,8(sp)
    80002998:	01010113          	addi	sp,sp,16
    8000299c:	00008067          	ret

00000000800029a0 <usertrapret>:
    800029a0:	ff010113          	addi	sp,sp,-16
    800029a4:	00813423          	sd	s0,8(sp)
    800029a8:	01010413          	addi	s0,sp,16
    800029ac:	00813403          	ld	s0,8(sp)
    800029b0:	01010113          	addi	sp,sp,16
    800029b4:	00008067          	ret

00000000800029b8 <kerneltrap>:
    800029b8:	fe010113          	addi	sp,sp,-32
    800029bc:	00813823          	sd	s0,16(sp)
    800029c0:	00113c23          	sd	ra,24(sp)
    800029c4:	00913423          	sd	s1,8(sp)
    800029c8:	02010413          	addi	s0,sp,32
    800029cc:	142025f3          	csrr	a1,scause
    800029d0:	100027f3          	csrr	a5,sstatus
    800029d4:	0027f793          	andi	a5,a5,2
    800029d8:	10079c63          	bnez	a5,80002af0 <kerneltrap+0x138>
    800029dc:	142027f3          	csrr	a5,scause
    800029e0:	0207ce63          	bltz	a5,80002a1c <kerneltrap+0x64>
    800029e4:	00002517          	auipc	a0,0x2
    800029e8:	73450513          	addi	a0,a0,1844 # 80005118 <_ZN15MemoryAllocator11HEADER_SIZEE+0xf8>
    800029ec:	00001097          	auipc	ra,0x1
    800029f0:	88c080e7          	jalr	-1908(ra) # 80003278 <__printf>
    800029f4:	141025f3          	csrr	a1,sepc
    800029f8:	14302673          	csrr	a2,stval
    800029fc:	00002517          	auipc	a0,0x2
    80002a00:	72c50513          	addi	a0,a0,1836 # 80005128 <_ZN15MemoryAllocator11HEADER_SIZEE+0x108>
    80002a04:	00001097          	auipc	ra,0x1
    80002a08:	874080e7          	jalr	-1932(ra) # 80003278 <__printf>
    80002a0c:	00002517          	auipc	a0,0x2
    80002a10:	73450513          	addi	a0,a0,1844 # 80005140 <_ZN15MemoryAllocator11HEADER_SIZEE+0x120>
    80002a14:	00001097          	auipc	ra,0x1
    80002a18:	808080e7          	jalr	-2040(ra) # 8000321c <panic>
    80002a1c:	0ff7f713          	andi	a4,a5,255
    80002a20:	00900693          	li	a3,9
    80002a24:	04d70063          	beq	a4,a3,80002a64 <kerneltrap+0xac>
    80002a28:	fff00713          	li	a4,-1
    80002a2c:	03f71713          	slli	a4,a4,0x3f
    80002a30:	00170713          	addi	a4,a4,1
    80002a34:	fae798e3          	bne	a5,a4,800029e4 <kerneltrap+0x2c>
    80002a38:	00000097          	auipc	ra,0x0
    80002a3c:	e00080e7          	jalr	-512(ra) # 80002838 <cpuid>
    80002a40:	06050663          	beqz	a0,80002aac <kerneltrap+0xf4>
    80002a44:	144027f3          	csrr	a5,sip
    80002a48:	ffd7f793          	andi	a5,a5,-3
    80002a4c:	14479073          	csrw	sip,a5
    80002a50:	01813083          	ld	ra,24(sp)
    80002a54:	01013403          	ld	s0,16(sp)
    80002a58:	00813483          	ld	s1,8(sp)
    80002a5c:	02010113          	addi	sp,sp,32
    80002a60:	00008067          	ret
    80002a64:	00000097          	auipc	ra,0x0
    80002a68:	3d0080e7          	jalr	976(ra) # 80002e34 <plic_claim>
    80002a6c:	00a00793          	li	a5,10
    80002a70:	00050493          	mv	s1,a0
    80002a74:	06f50863          	beq	a0,a5,80002ae4 <kerneltrap+0x12c>
    80002a78:	fc050ce3          	beqz	a0,80002a50 <kerneltrap+0x98>
    80002a7c:	00050593          	mv	a1,a0
    80002a80:	00002517          	auipc	a0,0x2
    80002a84:	67850513          	addi	a0,a0,1656 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    80002a88:	00000097          	auipc	ra,0x0
    80002a8c:	7f0080e7          	jalr	2032(ra) # 80003278 <__printf>
    80002a90:	01013403          	ld	s0,16(sp)
    80002a94:	01813083          	ld	ra,24(sp)
    80002a98:	00048513          	mv	a0,s1
    80002a9c:	00813483          	ld	s1,8(sp)
    80002aa0:	02010113          	addi	sp,sp,32
    80002aa4:	00000317          	auipc	t1,0x0
    80002aa8:	3c830067          	jr	968(t1) # 80002e6c <plic_complete>
    80002aac:	00004517          	auipc	a0,0x4
    80002ab0:	f1450513          	addi	a0,a0,-236 # 800069c0 <tickslock>
    80002ab4:	00001097          	auipc	ra,0x1
    80002ab8:	498080e7          	jalr	1176(ra) # 80003f4c <acquire>
    80002abc:	00003717          	auipc	a4,0x3
    80002ac0:	de870713          	addi	a4,a4,-536 # 800058a4 <ticks>
    80002ac4:	00072783          	lw	a5,0(a4)
    80002ac8:	00004517          	auipc	a0,0x4
    80002acc:	ef850513          	addi	a0,a0,-264 # 800069c0 <tickslock>
    80002ad0:	0017879b          	addiw	a5,a5,1
    80002ad4:	00f72023          	sw	a5,0(a4)
    80002ad8:	00001097          	auipc	ra,0x1
    80002adc:	540080e7          	jalr	1344(ra) # 80004018 <release>
    80002ae0:	f65ff06f          	j	80002a44 <kerneltrap+0x8c>
    80002ae4:	00001097          	auipc	ra,0x1
    80002ae8:	09c080e7          	jalr	156(ra) # 80003b80 <uartintr>
    80002aec:	fa5ff06f          	j	80002a90 <kerneltrap+0xd8>
    80002af0:	00002517          	auipc	a0,0x2
    80002af4:	5e850513          	addi	a0,a0,1512 # 800050d8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb8>
    80002af8:	00000097          	auipc	ra,0x0
    80002afc:	724080e7          	jalr	1828(ra) # 8000321c <panic>

0000000080002b00 <clockintr>:
    80002b00:	fe010113          	addi	sp,sp,-32
    80002b04:	00813823          	sd	s0,16(sp)
    80002b08:	00913423          	sd	s1,8(sp)
    80002b0c:	00113c23          	sd	ra,24(sp)
    80002b10:	02010413          	addi	s0,sp,32
    80002b14:	00004497          	auipc	s1,0x4
    80002b18:	eac48493          	addi	s1,s1,-340 # 800069c0 <tickslock>
    80002b1c:	00048513          	mv	a0,s1
    80002b20:	00001097          	auipc	ra,0x1
    80002b24:	42c080e7          	jalr	1068(ra) # 80003f4c <acquire>
    80002b28:	00003717          	auipc	a4,0x3
    80002b2c:	d7c70713          	addi	a4,a4,-644 # 800058a4 <ticks>
    80002b30:	00072783          	lw	a5,0(a4)
    80002b34:	01013403          	ld	s0,16(sp)
    80002b38:	01813083          	ld	ra,24(sp)
    80002b3c:	00048513          	mv	a0,s1
    80002b40:	0017879b          	addiw	a5,a5,1
    80002b44:	00813483          	ld	s1,8(sp)
    80002b48:	00f72023          	sw	a5,0(a4)
    80002b4c:	02010113          	addi	sp,sp,32
    80002b50:	00001317          	auipc	t1,0x1
    80002b54:	4c830067          	jr	1224(t1) # 80004018 <release>

0000000080002b58 <devintr>:
    80002b58:	142027f3          	csrr	a5,scause
    80002b5c:	00000513          	li	a0,0
    80002b60:	0007c463          	bltz	a5,80002b68 <devintr+0x10>
    80002b64:	00008067          	ret
    80002b68:	fe010113          	addi	sp,sp,-32
    80002b6c:	00813823          	sd	s0,16(sp)
    80002b70:	00113c23          	sd	ra,24(sp)
    80002b74:	00913423          	sd	s1,8(sp)
    80002b78:	02010413          	addi	s0,sp,32
    80002b7c:	0ff7f713          	andi	a4,a5,255
    80002b80:	00900693          	li	a3,9
    80002b84:	04d70c63          	beq	a4,a3,80002bdc <devintr+0x84>
    80002b88:	fff00713          	li	a4,-1
    80002b8c:	03f71713          	slli	a4,a4,0x3f
    80002b90:	00170713          	addi	a4,a4,1
    80002b94:	00e78c63          	beq	a5,a4,80002bac <devintr+0x54>
    80002b98:	01813083          	ld	ra,24(sp)
    80002b9c:	01013403          	ld	s0,16(sp)
    80002ba0:	00813483          	ld	s1,8(sp)
    80002ba4:	02010113          	addi	sp,sp,32
    80002ba8:	00008067          	ret
    80002bac:	00000097          	auipc	ra,0x0
    80002bb0:	c8c080e7          	jalr	-884(ra) # 80002838 <cpuid>
    80002bb4:	06050663          	beqz	a0,80002c20 <devintr+0xc8>
    80002bb8:	144027f3          	csrr	a5,sip
    80002bbc:	ffd7f793          	andi	a5,a5,-3
    80002bc0:	14479073          	csrw	sip,a5
    80002bc4:	01813083          	ld	ra,24(sp)
    80002bc8:	01013403          	ld	s0,16(sp)
    80002bcc:	00813483          	ld	s1,8(sp)
    80002bd0:	00200513          	li	a0,2
    80002bd4:	02010113          	addi	sp,sp,32
    80002bd8:	00008067          	ret
    80002bdc:	00000097          	auipc	ra,0x0
    80002be0:	258080e7          	jalr	600(ra) # 80002e34 <plic_claim>
    80002be4:	00a00793          	li	a5,10
    80002be8:	00050493          	mv	s1,a0
    80002bec:	06f50663          	beq	a0,a5,80002c58 <devintr+0x100>
    80002bf0:	00100513          	li	a0,1
    80002bf4:	fa0482e3          	beqz	s1,80002b98 <devintr+0x40>
    80002bf8:	00048593          	mv	a1,s1
    80002bfc:	00002517          	auipc	a0,0x2
    80002c00:	4fc50513          	addi	a0,a0,1276 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    80002c04:	00000097          	auipc	ra,0x0
    80002c08:	674080e7          	jalr	1652(ra) # 80003278 <__printf>
    80002c0c:	00048513          	mv	a0,s1
    80002c10:	00000097          	auipc	ra,0x0
    80002c14:	25c080e7          	jalr	604(ra) # 80002e6c <plic_complete>
    80002c18:	00100513          	li	a0,1
    80002c1c:	f7dff06f          	j	80002b98 <devintr+0x40>
    80002c20:	00004517          	auipc	a0,0x4
    80002c24:	da050513          	addi	a0,a0,-608 # 800069c0 <tickslock>
    80002c28:	00001097          	auipc	ra,0x1
    80002c2c:	324080e7          	jalr	804(ra) # 80003f4c <acquire>
    80002c30:	00003717          	auipc	a4,0x3
    80002c34:	c7470713          	addi	a4,a4,-908 # 800058a4 <ticks>
    80002c38:	00072783          	lw	a5,0(a4)
    80002c3c:	00004517          	auipc	a0,0x4
    80002c40:	d8450513          	addi	a0,a0,-636 # 800069c0 <tickslock>
    80002c44:	0017879b          	addiw	a5,a5,1
    80002c48:	00f72023          	sw	a5,0(a4)
    80002c4c:	00001097          	auipc	ra,0x1
    80002c50:	3cc080e7          	jalr	972(ra) # 80004018 <release>
    80002c54:	f65ff06f          	j	80002bb8 <devintr+0x60>
    80002c58:	00001097          	auipc	ra,0x1
    80002c5c:	f28080e7          	jalr	-216(ra) # 80003b80 <uartintr>
    80002c60:	fadff06f          	j	80002c0c <devintr+0xb4>
	...

0000000080002c70 <kernelvec>:
    80002c70:	f0010113          	addi	sp,sp,-256
    80002c74:	00113023          	sd	ra,0(sp)
    80002c78:	00213423          	sd	sp,8(sp)
    80002c7c:	00313823          	sd	gp,16(sp)
    80002c80:	00413c23          	sd	tp,24(sp)
    80002c84:	02513023          	sd	t0,32(sp)
    80002c88:	02613423          	sd	t1,40(sp)
    80002c8c:	02713823          	sd	t2,48(sp)
    80002c90:	02813c23          	sd	s0,56(sp)
    80002c94:	04913023          	sd	s1,64(sp)
    80002c98:	04a13423          	sd	a0,72(sp)
    80002c9c:	04b13823          	sd	a1,80(sp)
    80002ca0:	04c13c23          	sd	a2,88(sp)
    80002ca4:	06d13023          	sd	a3,96(sp)
    80002ca8:	06e13423          	sd	a4,104(sp)
    80002cac:	06f13823          	sd	a5,112(sp)
    80002cb0:	07013c23          	sd	a6,120(sp)
    80002cb4:	09113023          	sd	a7,128(sp)
    80002cb8:	09213423          	sd	s2,136(sp)
    80002cbc:	09313823          	sd	s3,144(sp)
    80002cc0:	09413c23          	sd	s4,152(sp)
    80002cc4:	0b513023          	sd	s5,160(sp)
    80002cc8:	0b613423          	sd	s6,168(sp)
    80002ccc:	0b713823          	sd	s7,176(sp)
    80002cd0:	0b813c23          	sd	s8,184(sp)
    80002cd4:	0d913023          	sd	s9,192(sp)
    80002cd8:	0da13423          	sd	s10,200(sp)
    80002cdc:	0db13823          	sd	s11,208(sp)
    80002ce0:	0dc13c23          	sd	t3,216(sp)
    80002ce4:	0fd13023          	sd	t4,224(sp)
    80002ce8:	0fe13423          	sd	t5,232(sp)
    80002cec:	0ff13823          	sd	t6,240(sp)
    80002cf0:	cc9ff0ef          	jal	ra,800029b8 <kerneltrap>
    80002cf4:	00013083          	ld	ra,0(sp)
    80002cf8:	00813103          	ld	sp,8(sp)
    80002cfc:	01013183          	ld	gp,16(sp)
    80002d00:	02013283          	ld	t0,32(sp)
    80002d04:	02813303          	ld	t1,40(sp)
    80002d08:	03013383          	ld	t2,48(sp)
    80002d0c:	03813403          	ld	s0,56(sp)
    80002d10:	04013483          	ld	s1,64(sp)
    80002d14:	04813503          	ld	a0,72(sp)
    80002d18:	05013583          	ld	a1,80(sp)
    80002d1c:	05813603          	ld	a2,88(sp)
    80002d20:	06013683          	ld	a3,96(sp)
    80002d24:	06813703          	ld	a4,104(sp)
    80002d28:	07013783          	ld	a5,112(sp)
    80002d2c:	07813803          	ld	a6,120(sp)
    80002d30:	08013883          	ld	a7,128(sp)
    80002d34:	08813903          	ld	s2,136(sp)
    80002d38:	09013983          	ld	s3,144(sp)
    80002d3c:	09813a03          	ld	s4,152(sp)
    80002d40:	0a013a83          	ld	s5,160(sp)
    80002d44:	0a813b03          	ld	s6,168(sp)
    80002d48:	0b013b83          	ld	s7,176(sp)
    80002d4c:	0b813c03          	ld	s8,184(sp)
    80002d50:	0c013c83          	ld	s9,192(sp)
    80002d54:	0c813d03          	ld	s10,200(sp)
    80002d58:	0d013d83          	ld	s11,208(sp)
    80002d5c:	0d813e03          	ld	t3,216(sp)
    80002d60:	0e013e83          	ld	t4,224(sp)
    80002d64:	0e813f03          	ld	t5,232(sp)
    80002d68:	0f013f83          	ld	t6,240(sp)
    80002d6c:	10010113          	addi	sp,sp,256
    80002d70:	10200073          	sret
    80002d74:	00000013          	nop
    80002d78:	00000013          	nop
    80002d7c:	00000013          	nop

0000000080002d80 <timervec>:
    80002d80:	34051573          	csrrw	a0,mscratch,a0
    80002d84:	00b53023          	sd	a1,0(a0)
    80002d88:	00c53423          	sd	a2,8(a0)
    80002d8c:	00d53823          	sd	a3,16(a0)
    80002d90:	01853583          	ld	a1,24(a0)
    80002d94:	02053603          	ld	a2,32(a0)
    80002d98:	0005b683          	ld	a3,0(a1)
    80002d9c:	00c686b3          	add	a3,a3,a2
    80002da0:	00d5b023          	sd	a3,0(a1)
    80002da4:	00200593          	li	a1,2
    80002da8:	14459073          	csrw	sip,a1
    80002dac:	01053683          	ld	a3,16(a0)
    80002db0:	00853603          	ld	a2,8(a0)
    80002db4:	00053583          	ld	a1,0(a0)
    80002db8:	34051573          	csrrw	a0,mscratch,a0
    80002dbc:	30200073          	mret

0000000080002dc0 <plicinit>:
    80002dc0:	ff010113          	addi	sp,sp,-16
    80002dc4:	00813423          	sd	s0,8(sp)
    80002dc8:	01010413          	addi	s0,sp,16
    80002dcc:	00813403          	ld	s0,8(sp)
    80002dd0:	0c0007b7          	lui	a5,0xc000
    80002dd4:	00100713          	li	a4,1
    80002dd8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002ddc:	00e7a223          	sw	a4,4(a5)
    80002de0:	01010113          	addi	sp,sp,16
    80002de4:	00008067          	ret

0000000080002de8 <plicinithart>:
    80002de8:	ff010113          	addi	sp,sp,-16
    80002dec:	00813023          	sd	s0,0(sp)
    80002df0:	00113423          	sd	ra,8(sp)
    80002df4:	01010413          	addi	s0,sp,16
    80002df8:	00000097          	auipc	ra,0x0
    80002dfc:	a40080e7          	jalr	-1472(ra) # 80002838 <cpuid>
    80002e00:	0085171b          	slliw	a4,a0,0x8
    80002e04:	0c0027b7          	lui	a5,0xc002
    80002e08:	00e787b3          	add	a5,a5,a4
    80002e0c:	40200713          	li	a4,1026
    80002e10:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002e14:	00813083          	ld	ra,8(sp)
    80002e18:	00013403          	ld	s0,0(sp)
    80002e1c:	00d5151b          	slliw	a0,a0,0xd
    80002e20:	0c2017b7          	lui	a5,0xc201
    80002e24:	00a78533          	add	a0,a5,a0
    80002e28:	00052023          	sw	zero,0(a0)
    80002e2c:	01010113          	addi	sp,sp,16
    80002e30:	00008067          	ret

0000000080002e34 <plic_claim>:
    80002e34:	ff010113          	addi	sp,sp,-16
    80002e38:	00813023          	sd	s0,0(sp)
    80002e3c:	00113423          	sd	ra,8(sp)
    80002e40:	01010413          	addi	s0,sp,16
    80002e44:	00000097          	auipc	ra,0x0
    80002e48:	9f4080e7          	jalr	-1548(ra) # 80002838 <cpuid>
    80002e4c:	00813083          	ld	ra,8(sp)
    80002e50:	00013403          	ld	s0,0(sp)
    80002e54:	00d5151b          	slliw	a0,a0,0xd
    80002e58:	0c2017b7          	lui	a5,0xc201
    80002e5c:	00a78533          	add	a0,a5,a0
    80002e60:	00452503          	lw	a0,4(a0)
    80002e64:	01010113          	addi	sp,sp,16
    80002e68:	00008067          	ret

0000000080002e6c <plic_complete>:
    80002e6c:	fe010113          	addi	sp,sp,-32
    80002e70:	00813823          	sd	s0,16(sp)
    80002e74:	00913423          	sd	s1,8(sp)
    80002e78:	00113c23          	sd	ra,24(sp)
    80002e7c:	02010413          	addi	s0,sp,32
    80002e80:	00050493          	mv	s1,a0
    80002e84:	00000097          	auipc	ra,0x0
    80002e88:	9b4080e7          	jalr	-1612(ra) # 80002838 <cpuid>
    80002e8c:	01813083          	ld	ra,24(sp)
    80002e90:	01013403          	ld	s0,16(sp)
    80002e94:	00d5179b          	slliw	a5,a0,0xd
    80002e98:	0c201737          	lui	a4,0xc201
    80002e9c:	00f707b3          	add	a5,a4,a5
    80002ea0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002ea4:	00813483          	ld	s1,8(sp)
    80002ea8:	02010113          	addi	sp,sp,32
    80002eac:	00008067          	ret

0000000080002eb0 <consolewrite>:
    80002eb0:	fb010113          	addi	sp,sp,-80
    80002eb4:	04813023          	sd	s0,64(sp)
    80002eb8:	04113423          	sd	ra,72(sp)
    80002ebc:	02913c23          	sd	s1,56(sp)
    80002ec0:	03213823          	sd	s2,48(sp)
    80002ec4:	03313423          	sd	s3,40(sp)
    80002ec8:	03413023          	sd	s4,32(sp)
    80002ecc:	01513c23          	sd	s5,24(sp)
    80002ed0:	05010413          	addi	s0,sp,80
    80002ed4:	06c05c63          	blez	a2,80002f4c <consolewrite+0x9c>
    80002ed8:	00060993          	mv	s3,a2
    80002edc:	00050a13          	mv	s4,a0
    80002ee0:	00058493          	mv	s1,a1
    80002ee4:	00000913          	li	s2,0
    80002ee8:	fff00a93          	li	s5,-1
    80002eec:	01c0006f          	j	80002f08 <consolewrite+0x58>
    80002ef0:	fbf44503          	lbu	a0,-65(s0)
    80002ef4:	0019091b          	addiw	s2,s2,1
    80002ef8:	00148493          	addi	s1,s1,1
    80002efc:	00001097          	auipc	ra,0x1
    80002f00:	a9c080e7          	jalr	-1380(ra) # 80003998 <uartputc>
    80002f04:	03298063          	beq	s3,s2,80002f24 <consolewrite+0x74>
    80002f08:	00048613          	mv	a2,s1
    80002f0c:	00100693          	li	a3,1
    80002f10:	000a0593          	mv	a1,s4
    80002f14:	fbf40513          	addi	a0,s0,-65
    80002f18:	00000097          	auipc	ra,0x0
    80002f1c:	9d8080e7          	jalr	-1576(ra) # 800028f0 <either_copyin>
    80002f20:	fd5518e3          	bne	a0,s5,80002ef0 <consolewrite+0x40>
    80002f24:	04813083          	ld	ra,72(sp)
    80002f28:	04013403          	ld	s0,64(sp)
    80002f2c:	03813483          	ld	s1,56(sp)
    80002f30:	02813983          	ld	s3,40(sp)
    80002f34:	02013a03          	ld	s4,32(sp)
    80002f38:	01813a83          	ld	s5,24(sp)
    80002f3c:	00090513          	mv	a0,s2
    80002f40:	03013903          	ld	s2,48(sp)
    80002f44:	05010113          	addi	sp,sp,80
    80002f48:	00008067          	ret
    80002f4c:	00000913          	li	s2,0
    80002f50:	fd5ff06f          	j	80002f24 <consolewrite+0x74>

0000000080002f54 <consoleread>:
    80002f54:	f9010113          	addi	sp,sp,-112
    80002f58:	06813023          	sd	s0,96(sp)
    80002f5c:	04913c23          	sd	s1,88(sp)
    80002f60:	05213823          	sd	s2,80(sp)
    80002f64:	05313423          	sd	s3,72(sp)
    80002f68:	05413023          	sd	s4,64(sp)
    80002f6c:	03513c23          	sd	s5,56(sp)
    80002f70:	03613823          	sd	s6,48(sp)
    80002f74:	03713423          	sd	s7,40(sp)
    80002f78:	03813023          	sd	s8,32(sp)
    80002f7c:	06113423          	sd	ra,104(sp)
    80002f80:	01913c23          	sd	s9,24(sp)
    80002f84:	07010413          	addi	s0,sp,112
    80002f88:	00060b93          	mv	s7,a2
    80002f8c:	00050913          	mv	s2,a0
    80002f90:	00058c13          	mv	s8,a1
    80002f94:	00060b1b          	sext.w	s6,a2
    80002f98:	00004497          	auipc	s1,0x4
    80002f9c:	a5048493          	addi	s1,s1,-1456 # 800069e8 <cons>
    80002fa0:	00400993          	li	s3,4
    80002fa4:	fff00a13          	li	s4,-1
    80002fa8:	00a00a93          	li	s5,10
    80002fac:	05705e63          	blez	s7,80003008 <consoleread+0xb4>
    80002fb0:	09c4a703          	lw	a4,156(s1)
    80002fb4:	0984a783          	lw	a5,152(s1)
    80002fb8:	0007071b          	sext.w	a4,a4
    80002fbc:	08e78463          	beq	a5,a4,80003044 <consoleread+0xf0>
    80002fc0:	07f7f713          	andi	a4,a5,127
    80002fc4:	00e48733          	add	a4,s1,a4
    80002fc8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002fcc:	0017869b          	addiw	a3,a5,1
    80002fd0:	08d4ac23          	sw	a3,152(s1)
    80002fd4:	00070c9b          	sext.w	s9,a4
    80002fd8:	0b370663          	beq	a4,s3,80003084 <consoleread+0x130>
    80002fdc:	00100693          	li	a3,1
    80002fe0:	f9f40613          	addi	a2,s0,-97
    80002fe4:	000c0593          	mv	a1,s8
    80002fe8:	00090513          	mv	a0,s2
    80002fec:	f8e40fa3          	sb	a4,-97(s0)
    80002ff0:	00000097          	auipc	ra,0x0
    80002ff4:	8b4080e7          	jalr	-1868(ra) # 800028a4 <either_copyout>
    80002ff8:	01450863          	beq	a0,s4,80003008 <consoleread+0xb4>
    80002ffc:	001c0c13          	addi	s8,s8,1
    80003000:	fffb8b9b          	addiw	s7,s7,-1
    80003004:	fb5c94e3          	bne	s9,s5,80002fac <consoleread+0x58>
    80003008:	000b851b          	sext.w	a0,s7
    8000300c:	06813083          	ld	ra,104(sp)
    80003010:	06013403          	ld	s0,96(sp)
    80003014:	05813483          	ld	s1,88(sp)
    80003018:	05013903          	ld	s2,80(sp)
    8000301c:	04813983          	ld	s3,72(sp)
    80003020:	04013a03          	ld	s4,64(sp)
    80003024:	03813a83          	ld	s5,56(sp)
    80003028:	02813b83          	ld	s7,40(sp)
    8000302c:	02013c03          	ld	s8,32(sp)
    80003030:	01813c83          	ld	s9,24(sp)
    80003034:	40ab053b          	subw	a0,s6,a0
    80003038:	03013b03          	ld	s6,48(sp)
    8000303c:	07010113          	addi	sp,sp,112
    80003040:	00008067          	ret
    80003044:	00001097          	auipc	ra,0x1
    80003048:	1d8080e7          	jalr	472(ra) # 8000421c <push_on>
    8000304c:	0984a703          	lw	a4,152(s1)
    80003050:	09c4a783          	lw	a5,156(s1)
    80003054:	0007879b          	sext.w	a5,a5
    80003058:	fef70ce3          	beq	a4,a5,80003050 <consoleread+0xfc>
    8000305c:	00001097          	auipc	ra,0x1
    80003060:	234080e7          	jalr	564(ra) # 80004290 <pop_on>
    80003064:	0984a783          	lw	a5,152(s1)
    80003068:	07f7f713          	andi	a4,a5,127
    8000306c:	00e48733          	add	a4,s1,a4
    80003070:	01874703          	lbu	a4,24(a4)
    80003074:	0017869b          	addiw	a3,a5,1
    80003078:	08d4ac23          	sw	a3,152(s1)
    8000307c:	00070c9b          	sext.w	s9,a4
    80003080:	f5371ee3          	bne	a4,s3,80002fdc <consoleread+0x88>
    80003084:	000b851b          	sext.w	a0,s7
    80003088:	f96bf2e3          	bgeu	s7,s6,8000300c <consoleread+0xb8>
    8000308c:	08f4ac23          	sw	a5,152(s1)
    80003090:	f7dff06f          	j	8000300c <consoleread+0xb8>

0000000080003094 <consputc>:
    80003094:	10000793          	li	a5,256
    80003098:	00f50663          	beq	a0,a5,800030a4 <consputc+0x10>
    8000309c:	00001317          	auipc	t1,0x1
    800030a0:	9f430067          	jr	-1548(t1) # 80003a90 <uartputc_sync>
    800030a4:	ff010113          	addi	sp,sp,-16
    800030a8:	00113423          	sd	ra,8(sp)
    800030ac:	00813023          	sd	s0,0(sp)
    800030b0:	01010413          	addi	s0,sp,16
    800030b4:	00800513          	li	a0,8
    800030b8:	00001097          	auipc	ra,0x1
    800030bc:	9d8080e7          	jalr	-1576(ra) # 80003a90 <uartputc_sync>
    800030c0:	02000513          	li	a0,32
    800030c4:	00001097          	auipc	ra,0x1
    800030c8:	9cc080e7          	jalr	-1588(ra) # 80003a90 <uartputc_sync>
    800030cc:	00013403          	ld	s0,0(sp)
    800030d0:	00813083          	ld	ra,8(sp)
    800030d4:	00800513          	li	a0,8
    800030d8:	01010113          	addi	sp,sp,16
    800030dc:	00001317          	auipc	t1,0x1
    800030e0:	9b430067          	jr	-1612(t1) # 80003a90 <uartputc_sync>

00000000800030e4 <consoleintr>:
    800030e4:	fe010113          	addi	sp,sp,-32
    800030e8:	00813823          	sd	s0,16(sp)
    800030ec:	00913423          	sd	s1,8(sp)
    800030f0:	01213023          	sd	s2,0(sp)
    800030f4:	00113c23          	sd	ra,24(sp)
    800030f8:	02010413          	addi	s0,sp,32
    800030fc:	00004917          	auipc	s2,0x4
    80003100:	8ec90913          	addi	s2,s2,-1812 # 800069e8 <cons>
    80003104:	00050493          	mv	s1,a0
    80003108:	00090513          	mv	a0,s2
    8000310c:	00001097          	auipc	ra,0x1
    80003110:	e40080e7          	jalr	-448(ra) # 80003f4c <acquire>
    80003114:	02048c63          	beqz	s1,8000314c <consoleintr+0x68>
    80003118:	0a092783          	lw	a5,160(s2)
    8000311c:	09892703          	lw	a4,152(s2)
    80003120:	07f00693          	li	a3,127
    80003124:	40e7873b          	subw	a4,a5,a4
    80003128:	02e6e263          	bltu	a3,a4,8000314c <consoleintr+0x68>
    8000312c:	00d00713          	li	a4,13
    80003130:	04e48063          	beq	s1,a4,80003170 <consoleintr+0x8c>
    80003134:	07f7f713          	andi	a4,a5,127
    80003138:	00e90733          	add	a4,s2,a4
    8000313c:	0017879b          	addiw	a5,a5,1
    80003140:	0af92023          	sw	a5,160(s2)
    80003144:	00970c23          	sb	s1,24(a4)
    80003148:	08f92e23          	sw	a5,156(s2)
    8000314c:	01013403          	ld	s0,16(sp)
    80003150:	01813083          	ld	ra,24(sp)
    80003154:	00813483          	ld	s1,8(sp)
    80003158:	00013903          	ld	s2,0(sp)
    8000315c:	00004517          	auipc	a0,0x4
    80003160:	88c50513          	addi	a0,a0,-1908 # 800069e8 <cons>
    80003164:	02010113          	addi	sp,sp,32
    80003168:	00001317          	auipc	t1,0x1
    8000316c:	eb030067          	jr	-336(t1) # 80004018 <release>
    80003170:	00a00493          	li	s1,10
    80003174:	fc1ff06f          	j	80003134 <consoleintr+0x50>

0000000080003178 <consoleinit>:
    80003178:	fe010113          	addi	sp,sp,-32
    8000317c:	00113c23          	sd	ra,24(sp)
    80003180:	00813823          	sd	s0,16(sp)
    80003184:	00913423          	sd	s1,8(sp)
    80003188:	02010413          	addi	s0,sp,32
    8000318c:	00004497          	auipc	s1,0x4
    80003190:	85c48493          	addi	s1,s1,-1956 # 800069e8 <cons>
    80003194:	00048513          	mv	a0,s1
    80003198:	00002597          	auipc	a1,0x2
    8000319c:	fb858593          	addi	a1,a1,-72 # 80005150 <_ZN15MemoryAllocator11HEADER_SIZEE+0x130>
    800031a0:	00001097          	auipc	ra,0x1
    800031a4:	d88080e7          	jalr	-632(ra) # 80003f28 <initlock>
    800031a8:	00000097          	auipc	ra,0x0
    800031ac:	7ac080e7          	jalr	1964(ra) # 80003954 <uartinit>
    800031b0:	01813083          	ld	ra,24(sp)
    800031b4:	01013403          	ld	s0,16(sp)
    800031b8:	00000797          	auipc	a5,0x0
    800031bc:	d9c78793          	addi	a5,a5,-612 # 80002f54 <consoleread>
    800031c0:	0af4bc23          	sd	a5,184(s1)
    800031c4:	00000797          	auipc	a5,0x0
    800031c8:	cec78793          	addi	a5,a5,-788 # 80002eb0 <consolewrite>
    800031cc:	0cf4b023          	sd	a5,192(s1)
    800031d0:	00813483          	ld	s1,8(sp)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00008067          	ret

00000000800031dc <console_read>:
    800031dc:	ff010113          	addi	sp,sp,-16
    800031e0:	00813423          	sd	s0,8(sp)
    800031e4:	01010413          	addi	s0,sp,16
    800031e8:	00813403          	ld	s0,8(sp)
    800031ec:	00004317          	auipc	t1,0x4
    800031f0:	8b433303          	ld	t1,-1868(t1) # 80006aa0 <devsw+0x10>
    800031f4:	01010113          	addi	sp,sp,16
    800031f8:	00030067          	jr	t1

00000000800031fc <console_write>:
    800031fc:	ff010113          	addi	sp,sp,-16
    80003200:	00813423          	sd	s0,8(sp)
    80003204:	01010413          	addi	s0,sp,16
    80003208:	00813403          	ld	s0,8(sp)
    8000320c:	00004317          	auipc	t1,0x4
    80003210:	89c33303          	ld	t1,-1892(t1) # 80006aa8 <devsw+0x18>
    80003214:	01010113          	addi	sp,sp,16
    80003218:	00030067          	jr	t1

000000008000321c <panic>:
    8000321c:	fe010113          	addi	sp,sp,-32
    80003220:	00113c23          	sd	ra,24(sp)
    80003224:	00813823          	sd	s0,16(sp)
    80003228:	00913423          	sd	s1,8(sp)
    8000322c:	02010413          	addi	s0,sp,32
    80003230:	00050493          	mv	s1,a0
    80003234:	00002517          	auipc	a0,0x2
    80003238:	f2450513          	addi	a0,a0,-220 # 80005158 <_ZN15MemoryAllocator11HEADER_SIZEE+0x138>
    8000323c:	00004797          	auipc	a5,0x4
    80003240:	9007a623          	sw	zero,-1780(a5) # 80006b48 <pr+0x18>
    80003244:	00000097          	auipc	ra,0x0
    80003248:	034080e7          	jalr	52(ra) # 80003278 <__printf>
    8000324c:	00048513          	mv	a0,s1
    80003250:	00000097          	auipc	ra,0x0
    80003254:	028080e7          	jalr	40(ra) # 80003278 <__printf>
    80003258:	00002517          	auipc	a0,0x2
    8000325c:	ee050513          	addi	a0,a0,-288 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    80003260:	00000097          	auipc	ra,0x0
    80003264:	018080e7          	jalr	24(ra) # 80003278 <__printf>
    80003268:	00100793          	li	a5,1
    8000326c:	00002717          	auipc	a4,0x2
    80003270:	62f72e23          	sw	a5,1596(a4) # 800058a8 <panicked>
    80003274:	0000006f          	j	80003274 <panic+0x58>

0000000080003278 <__printf>:
    80003278:	f3010113          	addi	sp,sp,-208
    8000327c:	08813023          	sd	s0,128(sp)
    80003280:	07313423          	sd	s3,104(sp)
    80003284:	09010413          	addi	s0,sp,144
    80003288:	05813023          	sd	s8,64(sp)
    8000328c:	08113423          	sd	ra,136(sp)
    80003290:	06913c23          	sd	s1,120(sp)
    80003294:	07213823          	sd	s2,112(sp)
    80003298:	07413023          	sd	s4,96(sp)
    8000329c:	05513c23          	sd	s5,88(sp)
    800032a0:	05613823          	sd	s6,80(sp)
    800032a4:	05713423          	sd	s7,72(sp)
    800032a8:	03913c23          	sd	s9,56(sp)
    800032ac:	03a13823          	sd	s10,48(sp)
    800032b0:	03b13423          	sd	s11,40(sp)
    800032b4:	00004317          	auipc	t1,0x4
    800032b8:	87c30313          	addi	t1,t1,-1924 # 80006b30 <pr>
    800032bc:	01832c03          	lw	s8,24(t1)
    800032c0:	00b43423          	sd	a1,8(s0)
    800032c4:	00c43823          	sd	a2,16(s0)
    800032c8:	00d43c23          	sd	a3,24(s0)
    800032cc:	02e43023          	sd	a4,32(s0)
    800032d0:	02f43423          	sd	a5,40(s0)
    800032d4:	03043823          	sd	a6,48(s0)
    800032d8:	03143c23          	sd	a7,56(s0)
    800032dc:	00050993          	mv	s3,a0
    800032e0:	4a0c1663          	bnez	s8,8000378c <__printf+0x514>
    800032e4:	60098c63          	beqz	s3,800038fc <__printf+0x684>
    800032e8:	0009c503          	lbu	a0,0(s3)
    800032ec:	00840793          	addi	a5,s0,8
    800032f0:	f6f43c23          	sd	a5,-136(s0)
    800032f4:	00000493          	li	s1,0
    800032f8:	22050063          	beqz	a0,80003518 <__printf+0x2a0>
    800032fc:	00002a37          	lui	s4,0x2
    80003300:	00018ab7          	lui	s5,0x18
    80003304:	000f4b37          	lui	s6,0xf4
    80003308:	00989bb7          	lui	s7,0x989
    8000330c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003310:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003314:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003318:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000331c:	00148c9b          	addiw	s9,s1,1
    80003320:	02500793          	li	a5,37
    80003324:	01998933          	add	s2,s3,s9
    80003328:	38f51263          	bne	a0,a5,800036ac <__printf+0x434>
    8000332c:	00094783          	lbu	a5,0(s2)
    80003330:	00078c9b          	sext.w	s9,a5
    80003334:	1e078263          	beqz	a5,80003518 <__printf+0x2a0>
    80003338:	0024849b          	addiw	s1,s1,2
    8000333c:	07000713          	li	a4,112
    80003340:	00998933          	add	s2,s3,s1
    80003344:	38e78a63          	beq	a5,a4,800036d8 <__printf+0x460>
    80003348:	20f76863          	bltu	a4,a5,80003558 <__printf+0x2e0>
    8000334c:	42a78863          	beq	a5,a0,8000377c <__printf+0x504>
    80003350:	06400713          	li	a4,100
    80003354:	40e79663          	bne	a5,a4,80003760 <__printf+0x4e8>
    80003358:	f7843783          	ld	a5,-136(s0)
    8000335c:	0007a603          	lw	a2,0(a5)
    80003360:	00878793          	addi	a5,a5,8
    80003364:	f6f43c23          	sd	a5,-136(s0)
    80003368:	42064a63          	bltz	a2,8000379c <__printf+0x524>
    8000336c:	00a00713          	li	a4,10
    80003370:	02e677bb          	remuw	a5,a2,a4
    80003374:	00002d97          	auipc	s11,0x2
    80003378:	e0cd8d93          	addi	s11,s11,-500 # 80005180 <digits>
    8000337c:	00900593          	li	a1,9
    80003380:	0006051b          	sext.w	a0,a2
    80003384:	00000c93          	li	s9,0
    80003388:	02079793          	slli	a5,a5,0x20
    8000338c:	0207d793          	srli	a5,a5,0x20
    80003390:	00fd87b3          	add	a5,s11,a5
    80003394:	0007c783          	lbu	a5,0(a5)
    80003398:	02e656bb          	divuw	a3,a2,a4
    8000339c:	f8f40023          	sb	a5,-128(s0)
    800033a0:	14c5d863          	bge	a1,a2,800034f0 <__printf+0x278>
    800033a4:	06300593          	li	a1,99
    800033a8:	00100c93          	li	s9,1
    800033ac:	02e6f7bb          	remuw	a5,a3,a4
    800033b0:	02079793          	slli	a5,a5,0x20
    800033b4:	0207d793          	srli	a5,a5,0x20
    800033b8:	00fd87b3          	add	a5,s11,a5
    800033bc:	0007c783          	lbu	a5,0(a5)
    800033c0:	02e6d73b          	divuw	a4,a3,a4
    800033c4:	f8f400a3          	sb	a5,-127(s0)
    800033c8:	12a5f463          	bgeu	a1,a0,800034f0 <__printf+0x278>
    800033cc:	00a00693          	li	a3,10
    800033d0:	00900593          	li	a1,9
    800033d4:	02d777bb          	remuw	a5,a4,a3
    800033d8:	02079793          	slli	a5,a5,0x20
    800033dc:	0207d793          	srli	a5,a5,0x20
    800033e0:	00fd87b3          	add	a5,s11,a5
    800033e4:	0007c503          	lbu	a0,0(a5)
    800033e8:	02d757bb          	divuw	a5,a4,a3
    800033ec:	f8a40123          	sb	a0,-126(s0)
    800033f0:	48e5f263          	bgeu	a1,a4,80003874 <__printf+0x5fc>
    800033f4:	06300513          	li	a0,99
    800033f8:	02d7f5bb          	remuw	a1,a5,a3
    800033fc:	02059593          	slli	a1,a1,0x20
    80003400:	0205d593          	srli	a1,a1,0x20
    80003404:	00bd85b3          	add	a1,s11,a1
    80003408:	0005c583          	lbu	a1,0(a1)
    8000340c:	02d7d7bb          	divuw	a5,a5,a3
    80003410:	f8b401a3          	sb	a1,-125(s0)
    80003414:	48e57263          	bgeu	a0,a4,80003898 <__printf+0x620>
    80003418:	3e700513          	li	a0,999
    8000341c:	02d7f5bb          	remuw	a1,a5,a3
    80003420:	02059593          	slli	a1,a1,0x20
    80003424:	0205d593          	srli	a1,a1,0x20
    80003428:	00bd85b3          	add	a1,s11,a1
    8000342c:	0005c583          	lbu	a1,0(a1)
    80003430:	02d7d7bb          	divuw	a5,a5,a3
    80003434:	f8b40223          	sb	a1,-124(s0)
    80003438:	46e57663          	bgeu	a0,a4,800038a4 <__printf+0x62c>
    8000343c:	02d7f5bb          	remuw	a1,a5,a3
    80003440:	02059593          	slli	a1,a1,0x20
    80003444:	0205d593          	srli	a1,a1,0x20
    80003448:	00bd85b3          	add	a1,s11,a1
    8000344c:	0005c583          	lbu	a1,0(a1)
    80003450:	02d7d7bb          	divuw	a5,a5,a3
    80003454:	f8b402a3          	sb	a1,-123(s0)
    80003458:	46ea7863          	bgeu	s4,a4,800038c8 <__printf+0x650>
    8000345c:	02d7f5bb          	remuw	a1,a5,a3
    80003460:	02059593          	slli	a1,a1,0x20
    80003464:	0205d593          	srli	a1,a1,0x20
    80003468:	00bd85b3          	add	a1,s11,a1
    8000346c:	0005c583          	lbu	a1,0(a1)
    80003470:	02d7d7bb          	divuw	a5,a5,a3
    80003474:	f8b40323          	sb	a1,-122(s0)
    80003478:	3eeaf863          	bgeu	s5,a4,80003868 <__printf+0x5f0>
    8000347c:	02d7f5bb          	remuw	a1,a5,a3
    80003480:	02059593          	slli	a1,a1,0x20
    80003484:	0205d593          	srli	a1,a1,0x20
    80003488:	00bd85b3          	add	a1,s11,a1
    8000348c:	0005c583          	lbu	a1,0(a1)
    80003490:	02d7d7bb          	divuw	a5,a5,a3
    80003494:	f8b403a3          	sb	a1,-121(s0)
    80003498:	42eb7e63          	bgeu	s6,a4,800038d4 <__printf+0x65c>
    8000349c:	02d7f5bb          	remuw	a1,a5,a3
    800034a0:	02059593          	slli	a1,a1,0x20
    800034a4:	0205d593          	srli	a1,a1,0x20
    800034a8:	00bd85b3          	add	a1,s11,a1
    800034ac:	0005c583          	lbu	a1,0(a1)
    800034b0:	02d7d7bb          	divuw	a5,a5,a3
    800034b4:	f8b40423          	sb	a1,-120(s0)
    800034b8:	42ebfc63          	bgeu	s7,a4,800038f0 <__printf+0x678>
    800034bc:	02079793          	slli	a5,a5,0x20
    800034c0:	0207d793          	srli	a5,a5,0x20
    800034c4:	00fd8db3          	add	s11,s11,a5
    800034c8:	000dc703          	lbu	a4,0(s11)
    800034cc:	00a00793          	li	a5,10
    800034d0:	00900c93          	li	s9,9
    800034d4:	f8e404a3          	sb	a4,-119(s0)
    800034d8:	00065c63          	bgez	a2,800034f0 <__printf+0x278>
    800034dc:	f9040713          	addi	a4,s0,-112
    800034e0:	00f70733          	add	a4,a4,a5
    800034e4:	02d00693          	li	a3,45
    800034e8:	fed70823          	sb	a3,-16(a4)
    800034ec:	00078c93          	mv	s9,a5
    800034f0:	f8040793          	addi	a5,s0,-128
    800034f4:	01978cb3          	add	s9,a5,s9
    800034f8:	f7f40d13          	addi	s10,s0,-129
    800034fc:	000cc503          	lbu	a0,0(s9)
    80003500:	fffc8c93          	addi	s9,s9,-1
    80003504:	00000097          	auipc	ra,0x0
    80003508:	b90080e7          	jalr	-1136(ra) # 80003094 <consputc>
    8000350c:	ffac98e3          	bne	s9,s10,800034fc <__printf+0x284>
    80003510:	00094503          	lbu	a0,0(s2)
    80003514:	e00514e3          	bnez	a0,8000331c <__printf+0xa4>
    80003518:	1a0c1663          	bnez	s8,800036c4 <__printf+0x44c>
    8000351c:	08813083          	ld	ra,136(sp)
    80003520:	08013403          	ld	s0,128(sp)
    80003524:	07813483          	ld	s1,120(sp)
    80003528:	07013903          	ld	s2,112(sp)
    8000352c:	06813983          	ld	s3,104(sp)
    80003530:	06013a03          	ld	s4,96(sp)
    80003534:	05813a83          	ld	s5,88(sp)
    80003538:	05013b03          	ld	s6,80(sp)
    8000353c:	04813b83          	ld	s7,72(sp)
    80003540:	04013c03          	ld	s8,64(sp)
    80003544:	03813c83          	ld	s9,56(sp)
    80003548:	03013d03          	ld	s10,48(sp)
    8000354c:	02813d83          	ld	s11,40(sp)
    80003550:	0d010113          	addi	sp,sp,208
    80003554:	00008067          	ret
    80003558:	07300713          	li	a4,115
    8000355c:	1ce78a63          	beq	a5,a4,80003730 <__printf+0x4b8>
    80003560:	07800713          	li	a4,120
    80003564:	1ee79e63          	bne	a5,a4,80003760 <__printf+0x4e8>
    80003568:	f7843783          	ld	a5,-136(s0)
    8000356c:	0007a703          	lw	a4,0(a5)
    80003570:	00878793          	addi	a5,a5,8
    80003574:	f6f43c23          	sd	a5,-136(s0)
    80003578:	28074263          	bltz	a4,800037fc <__printf+0x584>
    8000357c:	00002d97          	auipc	s11,0x2
    80003580:	c04d8d93          	addi	s11,s11,-1020 # 80005180 <digits>
    80003584:	00f77793          	andi	a5,a4,15
    80003588:	00fd87b3          	add	a5,s11,a5
    8000358c:	0007c683          	lbu	a3,0(a5)
    80003590:	00f00613          	li	a2,15
    80003594:	0007079b          	sext.w	a5,a4
    80003598:	f8d40023          	sb	a3,-128(s0)
    8000359c:	0047559b          	srliw	a1,a4,0x4
    800035a0:	0047569b          	srliw	a3,a4,0x4
    800035a4:	00000c93          	li	s9,0
    800035a8:	0ee65063          	bge	a2,a4,80003688 <__printf+0x410>
    800035ac:	00f6f693          	andi	a3,a3,15
    800035b0:	00dd86b3          	add	a3,s11,a3
    800035b4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800035b8:	0087d79b          	srliw	a5,a5,0x8
    800035bc:	00100c93          	li	s9,1
    800035c0:	f8d400a3          	sb	a3,-127(s0)
    800035c4:	0cb67263          	bgeu	a2,a1,80003688 <__printf+0x410>
    800035c8:	00f7f693          	andi	a3,a5,15
    800035cc:	00dd86b3          	add	a3,s11,a3
    800035d0:	0006c583          	lbu	a1,0(a3)
    800035d4:	00f00613          	li	a2,15
    800035d8:	0047d69b          	srliw	a3,a5,0x4
    800035dc:	f8b40123          	sb	a1,-126(s0)
    800035e0:	0047d593          	srli	a1,a5,0x4
    800035e4:	28f67e63          	bgeu	a2,a5,80003880 <__printf+0x608>
    800035e8:	00f6f693          	andi	a3,a3,15
    800035ec:	00dd86b3          	add	a3,s11,a3
    800035f0:	0006c503          	lbu	a0,0(a3)
    800035f4:	0087d813          	srli	a6,a5,0x8
    800035f8:	0087d69b          	srliw	a3,a5,0x8
    800035fc:	f8a401a3          	sb	a0,-125(s0)
    80003600:	28b67663          	bgeu	a2,a1,8000388c <__printf+0x614>
    80003604:	00f6f693          	andi	a3,a3,15
    80003608:	00dd86b3          	add	a3,s11,a3
    8000360c:	0006c583          	lbu	a1,0(a3)
    80003610:	00c7d513          	srli	a0,a5,0xc
    80003614:	00c7d69b          	srliw	a3,a5,0xc
    80003618:	f8b40223          	sb	a1,-124(s0)
    8000361c:	29067a63          	bgeu	a2,a6,800038b0 <__printf+0x638>
    80003620:	00f6f693          	andi	a3,a3,15
    80003624:	00dd86b3          	add	a3,s11,a3
    80003628:	0006c583          	lbu	a1,0(a3)
    8000362c:	0107d813          	srli	a6,a5,0x10
    80003630:	0107d69b          	srliw	a3,a5,0x10
    80003634:	f8b402a3          	sb	a1,-123(s0)
    80003638:	28a67263          	bgeu	a2,a0,800038bc <__printf+0x644>
    8000363c:	00f6f693          	andi	a3,a3,15
    80003640:	00dd86b3          	add	a3,s11,a3
    80003644:	0006c683          	lbu	a3,0(a3)
    80003648:	0147d79b          	srliw	a5,a5,0x14
    8000364c:	f8d40323          	sb	a3,-122(s0)
    80003650:	21067663          	bgeu	a2,a6,8000385c <__printf+0x5e4>
    80003654:	02079793          	slli	a5,a5,0x20
    80003658:	0207d793          	srli	a5,a5,0x20
    8000365c:	00fd8db3          	add	s11,s11,a5
    80003660:	000dc683          	lbu	a3,0(s11)
    80003664:	00800793          	li	a5,8
    80003668:	00700c93          	li	s9,7
    8000366c:	f8d403a3          	sb	a3,-121(s0)
    80003670:	00075c63          	bgez	a4,80003688 <__printf+0x410>
    80003674:	f9040713          	addi	a4,s0,-112
    80003678:	00f70733          	add	a4,a4,a5
    8000367c:	02d00693          	li	a3,45
    80003680:	fed70823          	sb	a3,-16(a4)
    80003684:	00078c93          	mv	s9,a5
    80003688:	f8040793          	addi	a5,s0,-128
    8000368c:	01978cb3          	add	s9,a5,s9
    80003690:	f7f40d13          	addi	s10,s0,-129
    80003694:	000cc503          	lbu	a0,0(s9)
    80003698:	fffc8c93          	addi	s9,s9,-1
    8000369c:	00000097          	auipc	ra,0x0
    800036a0:	9f8080e7          	jalr	-1544(ra) # 80003094 <consputc>
    800036a4:	ff9d18e3          	bne	s10,s9,80003694 <__printf+0x41c>
    800036a8:	0100006f          	j	800036b8 <__printf+0x440>
    800036ac:	00000097          	auipc	ra,0x0
    800036b0:	9e8080e7          	jalr	-1560(ra) # 80003094 <consputc>
    800036b4:	000c8493          	mv	s1,s9
    800036b8:	00094503          	lbu	a0,0(s2)
    800036bc:	c60510e3          	bnez	a0,8000331c <__printf+0xa4>
    800036c0:	e40c0ee3          	beqz	s8,8000351c <__printf+0x2a4>
    800036c4:	00003517          	auipc	a0,0x3
    800036c8:	46c50513          	addi	a0,a0,1132 # 80006b30 <pr>
    800036cc:	00001097          	auipc	ra,0x1
    800036d0:	94c080e7          	jalr	-1716(ra) # 80004018 <release>
    800036d4:	e49ff06f          	j	8000351c <__printf+0x2a4>
    800036d8:	f7843783          	ld	a5,-136(s0)
    800036dc:	03000513          	li	a0,48
    800036e0:	01000d13          	li	s10,16
    800036e4:	00878713          	addi	a4,a5,8
    800036e8:	0007bc83          	ld	s9,0(a5)
    800036ec:	f6e43c23          	sd	a4,-136(s0)
    800036f0:	00000097          	auipc	ra,0x0
    800036f4:	9a4080e7          	jalr	-1628(ra) # 80003094 <consputc>
    800036f8:	07800513          	li	a0,120
    800036fc:	00000097          	auipc	ra,0x0
    80003700:	998080e7          	jalr	-1640(ra) # 80003094 <consputc>
    80003704:	00002d97          	auipc	s11,0x2
    80003708:	a7cd8d93          	addi	s11,s11,-1412 # 80005180 <digits>
    8000370c:	03ccd793          	srli	a5,s9,0x3c
    80003710:	00fd87b3          	add	a5,s11,a5
    80003714:	0007c503          	lbu	a0,0(a5)
    80003718:	fffd0d1b          	addiw	s10,s10,-1
    8000371c:	004c9c93          	slli	s9,s9,0x4
    80003720:	00000097          	auipc	ra,0x0
    80003724:	974080e7          	jalr	-1676(ra) # 80003094 <consputc>
    80003728:	fe0d12e3          	bnez	s10,8000370c <__printf+0x494>
    8000372c:	f8dff06f          	j	800036b8 <__printf+0x440>
    80003730:	f7843783          	ld	a5,-136(s0)
    80003734:	0007bc83          	ld	s9,0(a5)
    80003738:	00878793          	addi	a5,a5,8
    8000373c:	f6f43c23          	sd	a5,-136(s0)
    80003740:	000c9a63          	bnez	s9,80003754 <__printf+0x4dc>
    80003744:	1080006f          	j	8000384c <__printf+0x5d4>
    80003748:	001c8c93          	addi	s9,s9,1
    8000374c:	00000097          	auipc	ra,0x0
    80003750:	948080e7          	jalr	-1720(ra) # 80003094 <consputc>
    80003754:	000cc503          	lbu	a0,0(s9)
    80003758:	fe0518e3          	bnez	a0,80003748 <__printf+0x4d0>
    8000375c:	f5dff06f          	j	800036b8 <__printf+0x440>
    80003760:	02500513          	li	a0,37
    80003764:	00000097          	auipc	ra,0x0
    80003768:	930080e7          	jalr	-1744(ra) # 80003094 <consputc>
    8000376c:	000c8513          	mv	a0,s9
    80003770:	00000097          	auipc	ra,0x0
    80003774:	924080e7          	jalr	-1756(ra) # 80003094 <consputc>
    80003778:	f41ff06f          	j	800036b8 <__printf+0x440>
    8000377c:	02500513          	li	a0,37
    80003780:	00000097          	auipc	ra,0x0
    80003784:	914080e7          	jalr	-1772(ra) # 80003094 <consputc>
    80003788:	f31ff06f          	j	800036b8 <__printf+0x440>
    8000378c:	00030513          	mv	a0,t1
    80003790:	00000097          	auipc	ra,0x0
    80003794:	7bc080e7          	jalr	1980(ra) # 80003f4c <acquire>
    80003798:	b4dff06f          	j	800032e4 <__printf+0x6c>
    8000379c:	40c0053b          	negw	a0,a2
    800037a0:	00a00713          	li	a4,10
    800037a4:	02e576bb          	remuw	a3,a0,a4
    800037a8:	00002d97          	auipc	s11,0x2
    800037ac:	9d8d8d93          	addi	s11,s11,-1576 # 80005180 <digits>
    800037b0:	ff700593          	li	a1,-9
    800037b4:	02069693          	slli	a3,a3,0x20
    800037b8:	0206d693          	srli	a3,a3,0x20
    800037bc:	00dd86b3          	add	a3,s11,a3
    800037c0:	0006c683          	lbu	a3,0(a3)
    800037c4:	02e557bb          	divuw	a5,a0,a4
    800037c8:	f8d40023          	sb	a3,-128(s0)
    800037cc:	10b65e63          	bge	a2,a1,800038e8 <__printf+0x670>
    800037d0:	06300593          	li	a1,99
    800037d4:	02e7f6bb          	remuw	a3,a5,a4
    800037d8:	02069693          	slli	a3,a3,0x20
    800037dc:	0206d693          	srli	a3,a3,0x20
    800037e0:	00dd86b3          	add	a3,s11,a3
    800037e4:	0006c683          	lbu	a3,0(a3)
    800037e8:	02e7d73b          	divuw	a4,a5,a4
    800037ec:	00200793          	li	a5,2
    800037f0:	f8d400a3          	sb	a3,-127(s0)
    800037f4:	bca5ece3          	bltu	a1,a0,800033cc <__printf+0x154>
    800037f8:	ce5ff06f          	j	800034dc <__printf+0x264>
    800037fc:	40e007bb          	negw	a5,a4
    80003800:	00002d97          	auipc	s11,0x2
    80003804:	980d8d93          	addi	s11,s11,-1664 # 80005180 <digits>
    80003808:	00f7f693          	andi	a3,a5,15
    8000380c:	00dd86b3          	add	a3,s11,a3
    80003810:	0006c583          	lbu	a1,0(a3)
    80003814:	ff100613          	li	a2,-15
    80003818:	0047d69b          	srliw	a3,a5,0x4
    8000381c:	f8b40023          	sb	a1,-128(s0)
    80003820:	0047d59b          	srliw	a1,a5,0x4
    80003824:	0ac75e63          	bge	a4,a2,800038e0 <__printf+0x668>
    80003828:	00f6f693          	andi	a3,a3,15
    8000382c:	00dd86b3          	add	a3,s11,a3
    80003830:	0006c603          	lbu	a2,0(a3)
    80003834:	00f00693          	li	a3,15
    80003838:	0087d79b          	srliw	a5,a5,0x8
    8000383c:	f8c400a3          	sb	a2,-127(s0)
    80003840:	d8b6e4e3          	bltu	a3,a1,800035c8 <__printf+0x350>
    80003844:	00200793          	li	a5,2
    80003848:	e2dff06f          	j	80003674 <__printf+0x3fc>
    8000384c:	00002c97          	auipc	s9,0x2
    80003850:	914c8c93          	addi	s9,s9,-1772 # 80005160 <_ZN15MemoryAllocator11HEADER_SIZEE+0x140>
    80003854:	02800513          	li	a0,40
    80003858:	ef1ff06f          	j	80003748 <__printf+0x4d0>
    8000385c:	00700793          	li	a5,7
    80003860:	00600c93          	li	s9,6
    80003864:	e0dff06f          	j	80003670 <__printf+0x3f8>
    80003868:	00700793          	li	a5,7
    8000386c:	00600c93          	li	s9,6
    80003870:	c69ff06f          	j	800034d8 <__printf+0x260>
    80003874:	00300793          	li	a5,3
    80003878:	00200c93          	li	s9,2
    8000387c:	c5dff06f          	j	800034d8 <__printf+0x260>
    80003880:	00300793          	li	a5,3
    80003884:	00200c93          	li	s9,2
    80003888:	de9ff06f          	j	80003670 <__printf+0x3f8>
    8000388c:	00400793          	li	a5,4
    80003890:	00300c93          	li	s9,3
    80003894:	dddff06f          	j	80003670 <__printf+0x3f8>
    80003898:	00400793          	li	a5,4
    8000389c:	00300c93          	li	s9,3
    800038a0:	c39ff06f          	j	800034d8 <__printf+0x260>
    800038a4:	00500793          	li	a5,5
    800038a8:	00400c93          	li	s9,4
    800038ac:	c2dff06f          	j	800034d8 <__printf+0x260>
    800038b0:	00500793          	li	a5,5
    800038b4:	00400c93          	li	s9,4
    800038b8:	db9ff06f          	j	80003670 <__printf+0x3f8>
    800038bc:	00600793          	li	a5,6
    800038c0:	00500c93          	li	s9,5
    800038c4:	dadff06f          	j	80003670 <__printf+0x3f8>
    800038c8:	00600793          	li	a5,6
    800038cc:	00500c93          	li	s9,5
    800038d0:	c09ff06f          	j	800034d8 <__printf+0x260>
    800038d4:	00800793          	li	a5,8
    800038d8:	00700c93          	li	s9,7
    800038dc:	bfdff06f          	j	800034d8 <__printf+0x260>
    800038e0:	00100793          	li	a5,1
    800038e4:	d91ff06f          	j	80003674 <__printf+0x3fc>
    800038e8:	00100793          	li	a5,1
    800038ec:	bf1ff06f          	j	800034dc <__printf+0x264>
    800038f0:	00900793          	li	a5,9
    800038f4:	00800c93          	li	s9,8
    800038f8:	be1ff06f          	j	800034d8 <__printf+0x260>
    800038fc:	00002517          	auipc	a0,0x2
    80003900:	86c50513          	addi	a0,a0,-1940 # 80005168 <_ZN15MemoryAllocator11HEADER_SIZEE+0x148>
    80003904:	00000097          	auipc	ra,0x0
    80003908:	918080e7          	jalr	-1768(ra) # 8000321c <panic>

000000008000390c <printfinit>:
    8000390c:	fe010113          	addi	sp,sp,-32
    80003910:	00813823          	sd	s0,16(sp)
    80003914:	00913423          	sd	s1,8(sp)
    80003918:	00113c23          	sd	ra,24(sp)
    8000391c:	02010413          	addi	s0,sp,32
    80003920:	00003497          	auipc	s1,0x3
    80003924:	21048493          	addi	s1,s1,528 # 80006b30 <pr>
    80003928:	00048513          	mv	a0,s1
    8000392c:	00002597          	auipc	a1,0x2
    80003930:	84c58593          	addi	a1,a1,-1972 # 80005178 <_ZN15MemoryAllocator11HEADER_SIZEE+0x158>
    80003934:	00000097          	auipc	ra,0x0
    80003938:	5f4080e7          	jalr	1524(ra) # 80003f28 <initlock>
    8000393c:	01813083          	ld	ra,24(sp)
    80003940:	01013403          	ld	s0,16(sp)
    80003944:	0004ac23          	sw	zero,24(s1)
    80003948:	00813483          	ld	s1,8(sp)
    8000394c:	02010113          	addi	sp,sp,32
    80003950:	00008067          	ret

0000000080003954 <uartinit>:
    80003954:	ff010113          	addi	sp,sp,-16
    80003958:	00813423          	sd	s0,8(sp)
    8000395c:	01010413          	addi	s0,sp,16
    80003960:	100007b7          	lui	a5,0x10000
    80003964:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003968:	f8000713          	li	a4,-128
    8000396c:	00e781a3          	sb	a4,3(a5)
    80003970:	00300713          	li	a4,3
    80003974:	00e78023          	sb	a4,0(a5)
    80003978:	000780a3          	sb	zero,1(a5)
    8000397c:	00e781a3          	sb	a4,3(a5)
    80003980:	00700693          	li	a3,7
    80003984:	00d78123          	sb	a3,2(a5)
    80003988:	00e780a3          	sb	a4,1(a5)
    8000398c:	00813403          	ld	s0,8(sp)
    80003990:	01010113          	addi	sp,sp,16
    80003994:	00008067          	ret

0000000080003998 <uartputc>:
    80003998:	00002797          	auipc	a5,0x2
    8000399c:	f107a783          	lw	a5,-240(a5) # 800058a8 <panicked>
    800039a0:	00078463          	beqz	a5,800039a8 <uartputc+0x10>
    800039a4:	0000006f          	j	800039a4 <uartputc+0xc>
    800039a8:	fd010113          	addi	sp,sp,-48
    800039ac:	02813023          	sd	s0,32(sp)
    800039b0:	00913c23          	sd	s1,24(sp)
    800039b4:	01213823          	sd	s2,16(sp)
    800039b8:	01313423          	sd	s3,8(sp)
    800039bc:	02113423          	sd	ra,40(sp)
    800039c0:	03010413          	addi	s0,sp,48
    800039c4:	00002917          	auipc	s2,0x2
    800039c8:	eec90913          	addi	s2,s2,-276 # 800058b0 <uart_tx_r>
    800039cc:	00093783          	ld	a5,0(s2)
    800039d0:	00002497          	auipc	s1,0x2
    800039d4:	ee848493          	addi	s1,s1,-280 # 800058b8 <uart_tx_w>
    800039d8:	0004b703          	ld	a4,0(s1)
    800039dc:	02078693          	addi	a3,a5,32
    800039e0:	00050993          	mv	s3,a0
    800039e4:	02e69c63          	bne	a3,a4,80003a1c <uartputc+0x84>
    800039e8:	00001097          	auipc	ra,0x1
    800039ec:	834080e7          	jalr	-1996(ra) # 8000421c <push_on>
    800039f0:	00093783          	ld	a5,0(s2)
    800039f4:	0004b703          	ld	a4,0(s1)
    800039f8:	02078793          	addi	a5,a5,32
    800039fc:	00e79463          	bne	a5,a4,80003a04 <uartputc+0x6c>
    80003a00:	0000006f          	j	80003a00 <uartputc+0x68>
    80003a04:	00001097          	auipc	ra,0x1
    80003a08:	88c080e7          	jalr	-1908(ra) # 80004290 <pop_on>
    80003a0c:	00093783          	ld	a5,0(s2)
    80003a10:	0004b703          	ld	a4,0(s1)
    80003a14:	02078693          	addi	a3,a5,32
    80003a18:	fce688e3          	beq	a3,a4,800039e8 <uartputc+0x50>
    80003a1c:	01f77693          	andi	a3,a4,31
    80003a20:	00003597          	auipc	a1,0x3
    80003a24:	13058593          	addi	a1,a1,304 # 80006b50 <uart_tx_buf>
    80003a28:	00d586b3          	add	a3,a1,a3
    80003a2c:	00170713          	addi	a4,a4,1
    80003a30:	01368023          	sb	s3,0(a3)
    80003a34:	00e4b023          	sd	a4,0(s1)
    80003a38:	10000637          	lui	a2,0x10000
    80003a3c:	02f71063          	bne	a4,a5,80003a5c <uartputc+0xc4>
    80003a40:	0340006f          	j	80003a74 <uartputc+0xdc>
    80003a44:	00074703          	lbu	a4,0(a4)
    80003a48:	00f93023          	sd	a5,0(s2)
    80003a4c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003a50:	00093783          	ld	a5,0(s2)
    80003a54:	0004b703          	ld	a4,0(s1)
    80003a58:	00f70e63          	beq	a4,a5,80003a74 <uartputc+0xdc>
    80003a5c:	00564683          	lbu	a3,5(a2)
    80003a60:	01f7f713          	andi	a4,a5,31
    80003a64:	00e58733          	add	a4,a1,a4
    80003a68:	0206f693          	andi	a3,a3,32
    80003a6c:	00178793          	addi	a5,a5,1
    80003a70:	fc069ae3          	bnez	a3,80003a44 <uartputc+0xac>
    80003a74:	02813083          	ld	ra,40(sp)
    80003a78:	02013403          	ld	s0,32(sp)
    80003a7c:	01813483          	ld	s1,24(sp)
    80003a80:	01013903          	ld	s2,16(sp)
    80003a84:	00813983          	ld	s3,8(sp)
    80003a88:	03010113          	addi	sp,sp,48
    80003a8c:	00008067          	ret

0000000080003a90 <uartputc_sync>:
    80003a90:	ff010113          	addi	sp,sp,-16
    80003a94:	00813423          	sd	s0,8(sp)
    80003a98:	01010413          	addi	s0,sp,16
    80003a9c:	00002717          	auipc	a4,0x2
    80003aa0:	e0c72703          	lw	a4,-500(a4) # 800058a8 <panicked>
    80003aa4:	02071663          	bnez	a4,80003ad0 <uartputc_sync+0x40>
    80003aa8:	00050793          	mv	a5,a0
    80003aac:	100006b7          	lui	a3,0x10000
    80003ab0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003ab4:	02077713          	andi	a4,a4,32
    80003ab8:	fe070ce3          	beqz	a4,80003ab0 <uartputc_sync+0x20>
    80003abc:	0ff7f793          	andi	a5,a5,255
    80003ac0:	00f68023          	sb	a5,0(a3)
    80003ac4:	00813403          	ld	s0,8(sp)
    80003ac8:	01010113          	addi	sp,sp,16
    80003acc:	00008067          	ret
    80003ad0:	0000006f          	j	80003ad0 <uartputc_sync+0x40>

0000000080003ad4 <uartstart>:
    80003ad4:	ff010113          	addi	sp,sp,-16
    80003ad8:	00813423          	sd	s0,8(sp)
    80003adc:	01010413          	addi	s0,sp,16
    80003ae0:	00002617          	auipc	a2,0x2
    80003ae4:	dd060613          	addi	a2,a2,-560 # 800058b0 <uart_tx_r>
    80003ae8:	00002517          	auipc	a0,0x2
    80003aec:	dd050513          	addi	a0,a0,-560 # 800058b8 <uart_tx_w>
    80003af0:	00063783          	ld	a5,0(a2)
    80003af4:	00053703          	ld	a4,0(a0)
    80003af8:	04f70263          	beq	a4,a5,80003b3c <uartstart+0x68>
    80003afc:	100005b7          	lui	a1,0x10000
    80003b00:	00003817          	auipc	a6,0x3
    80003b04:	05080813          	addi	a6,a6,80 # 80006b50 <uart_tx_buf>
    80003b08:	01c0006f          	j	80003b24 <uartstart+0x50>
    80003b0c:	0006c703          	lbu	a4,0(a3)
    80003b10:	00f63023          	sd	a5,0(a2)
    80003b14:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003b18:	00063783          	ld	a5,0(a2)
    80003b1c:	00053703          	ld	a4,0(a0)
    80003b20:	00f70e63          	beq	a4,a5,80003b3c <uartstart+0x68>
    80003b24:	01f7f713          	andi	a4,a5,31
    80003b28:	00e806b3          	add	a3,a6,a4
    80003b2c:	0055c703          	lbu	a4,5(a1)
    80003b30:	00178793          	addi	a5,a5,1
    80003b34:	02077713          	andi	a4,a4,32
    80003b38:	fc071ae3          	bnez	a4,80003b0c <uartstart+0x38>
    80003b3c:	00813403          	ld	s0,8(sp)
    80003b40:	01010113          	addi	sp,sp,16
    80003b44:	00008067          	ret

0000000080003b48 <uartgetc>:
    80003b48:	ff010113          	addi	sp,sp,-16
    80003b4c:	00813423          	sd	s0,8(sp)
    80003b50:	01010413          	addi	s0,sp,16
    80003b54:	10000737          	lui	a4,0x10000
    80003b58:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003b5c:	0017f793          	andi	a5,a5,1
    80003b60:	00078c63          	beqz	a5,80003b78 <uartgetc+0x30>
    80003b64:	00074503          	lbu	a0,0(a4)
    80003b68:	0ff57513          	andi	a0,a0,255
    80003b6c:	00813403          	ld	s0,8(sp)
    80003b70:	01010113          	addi	sp,sp,16
    80003b74:	00008067          	ret
    80003b78:	fff00513          	li	a0,-1
    80003b7c:	ff1ff06f          	j	80003b6c <uartgetc+0x24>

0000000080003b80 <uartintr>:
    80003b80:	100007b7          	lui	a5,0x10000
    80003b84:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003b88:	0017f793          	andi	a5,a5,1
    80003b8c:	0a078463          	beqz	a5,80003c34 <uartintr+0xb4>
    80003b90:	fe010113          	addi	sp,sp,-32
    80003b94:	00813823          	sd	s0,16(sp)
    80003b98:	00913423          	sd	s1,8(sp)
    80003b9c:	00113c23          	sd	ra,24(sp)
    80003ba0:	02010413          	addi	s0,sp,32
    80003ba4:	100004b7          	lui	s1,0x10000
    80003ba8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003bac:	0ff57513          	andi	a0,a0,255
    80003bb0:	fffff097          	auipc	ra,0xfffff
    80003bb4:	534080e7          	jalr	1332(ra) # 800030e4 <consoleintr>
    80003bb8:	0054c783          	lbu	a5,5(s1)
    80003bbc:	0017f793          	andi	a5,a5,1
    80003bc0:	fe0794e3          	bnez	a5,80003ba8 <uartintr+0x28>
    80003bc4:	00002617          	auipc	a2,0x2
    80003bc8:	cec60613          	addi	a2,a2,-788 # 800058b0 <uart_tx_r>
    80003bcc:	00002517          	auipc	a0,0x2
    80003bd0:	cec50513          	addi	a0,a0,-788 # 800058b8 <uart_tx_w>
    80003bd4:	00063783          	ld	a5,0(a2)
    80003bd8:	00053703          	ld	a4,0(a0)
    80003bdc:	04f70263          	beq	a4,a5,80003c20 <uartintr+0xa0>
    80003be0:	100005b7          	lui	a1,0x10000
    80003be4:	00003817          	auipc	a6,0x3
    80003be8:	f6c80813          	addi	a6,a6,-148 # 80006b50 <uart_tx_buf>
    80003bec:	01c0006f          	j	80003c08 <uartintr+0x88>
    80003bf0:	0006c703          	lbu	a4,0(a3)
    80003bf4:	00f63023          	sd	a5,0(a2)
    80003bf8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003bfc:	00063783          	ld	a5,0(a2)
    80003c00:	00053703          	ld	a4,0(a0)
    80003c04:	00f70e63          	beq	a4,a5,80003c20 <uartintr+0xa0>
    80003c08:	01f7f713          	andi	a4,a5,31
    80003c0c:	00e806b3          	add	a3,a6,a4
    80003c10:	0055c703          	lbu	a4,5(a1)
    80003c14:	00178793          	addi	a5,a5,1
    80003c18:	02077713          	andi	a4,a4,32
    80003c1c:	fc071ae3          	bnez	a4,80003bf0 <uartintr+0x70>
    80003c20:	01813083          	ld	ra,24(sp)
    80003c24:	01013403          	ld	s0,16(sp)
    80003c28:	00813483          	ld	s1,8(sp)
    80003c2c:	02010113          	addi	sp,sp,32
    80003c30:	00008067          	ret
    80003c34:	00002617          	auipc	a2,0x2
    80003c38:	c7c60613          	addi	a2,a2,-900 # 800058b0 <uart_tx_r>
    80003c3c:	00002517          	auipc	a0,0x2
    80003c40:	c7c50513          	addi	a0,a0,-900 # 800058b8 <uart_tx_w>
    80003c44:	00063783          	ld	a5,0(a2)
    80003c48:	00053703          	ld	a4,0(a0)
    80003c4c:	04f70263          	beq	a4,a5,80003c90 <uartintr+0x110>
    80003c50:	100005b7          	lui	a1,0x10000
    80003c54:	00003817          	auipc	a6,0x3
    80003c58:	efc80813          	addi	a6,a6,-260 # 80006b50 <uart_tx_buf>
    80003c5c:	01c0006f          	j	80003c78 <uartintr+0xf8>
    80003c60:	0006c703          	lbu	a4,0(a3)
    80003c64:	00f63023          	sd	a5,0(a2)
    80003c68:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003c6c:	00063783          	ld	a5,0(a2)
    80003c70:	00053703          	ld	a4,0(a0)
    80003c74:	02f70063          	beq	a4,a5,80003c94 <uartintr+0x114>
    80003c78:	01f7f713          	andi	a4,a5,31
    80003c7c:	00e806b3          	add	a3,a6,a4
    80003c80:	0055c703          	lbu	a4,5(a1)
    80003c84:	00178793          	addi	a5,a5,1
    80003c88:	02077713          	andi	a4,a4,32
    80003c8c:	fc071ae3          	bnez	a4,80003c60 <uartintr+0xe0>
    80003c90:	00008067          	ret
    80003c94:	00008067          	ret

0000000080003c98 <kinit>:
    80003c98:	fc010113          	addi	sp,sp,-64
    80003c9c:	02913423          	sd	s1,40(sp)
    80003ca0:	fffff7b7          	lui	a5,0xfffff
    80003ca4:	00004497          	auipc	s1,0x4
    80003ca8:	ecb48493          	addi	s1,s1,-309 # 80007b6f <end+0xfff>
    80003cac:	02813823          	sd	s0,48(sp)
    80003cb0:	01313c23          	sd	s3,24(sp)
    80003cb4:	00f4f4b3          	and	s1,s1,a5
    80003cb8:	02113c23          	sd	ra,56(sp)
    80003cbc:	03213023          	sd	s2,32(sp)
    80003cc0:	01413823          	sd	s4,16(sp)
    80003cc4:	01513423          	sd	s5,8(sp)
    80003cc8:	04010413          	addi	s0,sp,64
    80003ccc:	000017b7          	lui	a5,0x1
    80003cd0:	01100993          	li	s3,17
    80003cd4:	00f487b3          	add	a5,s1,a5
    80003cd8:	01b99993          	slli	s3,s3,0x1b
    80003cdc:	06f9e063          	bltu	s3,a5,80003d3c <kinit+0xa4>
    80003ce0:	00003a97          	auipc	s5,0x3
    80003ce4:	e90a8a93          	addi	s5,s5,-368 # 80006b70 <end>
    80003ce8:	0754ec63          	bltu	s1,s5,80003d60 <kinit+0xc8>
    80003cec:	0734fa63          	bgeu	s1,s3,80003d60 <kinit+0xc8>
    80003cf0:	00088a37          	lui	s4,0x88
    80003cf4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003cf8:	00002917          	auipc	s2,0x2
    80003cfc:	bc890913          	addi	s2,s2,-1080 # 800058c0 <kmem>
    80003d00:	00ca1a13          	slli	s4,s4,0xc
    80003d04:	0140006f          	j	80003d18 <kinit+0x80>
    80003d08:	000017b7          	lui	a5,0x1
    80003d0c:	00f484b3          	add	s1,s1,a5
    80003d10:	0554e863          	bltu	s1,s5,80003d60 <kinit+0xc8>
    80003d14:	0534f663          	bgeu	s1,s3,80003d60 <kinit+0xc8>
    80003d18:	00001637          	lui	a2,0x1
    80003d1c:	00100593          	li	a1,1
    80003d20:	00048513          	mv	a0,s1
    80003d24:	00000097          	auipc	ra,0x0
    80003d28:	5e4080e7          	jalr	1508(ra) # 80004308 <__memset>
    80003d2c:	00093783          	ld	a5,0(s2)
    80003d30:	00f4b023          	sd	a5,0(s1)
    80003d34:	00993023          	sd	s1,0(s2)
    80003d38:	fd4498e3          	bne	s1,s4,80003d08 <kinit+0x70>
    80003d3c:	03813083          	ld	ra,56(sp)
    80003d40:	03013403          	ld	s0,48(sp)
    80003d44:	02813483          	ld	s1,40(sp)
    80003d48:	02013903          	ld	s2,32(sp)
    80003d4c:	01813983          	ld	s3,24(sp)
    80003d50:	01013a03          	ld	s4,16(sp)
    80003d54:	00813a83          	ld	s5,8(sp)
    80003d58:	04010113          	addi	sp,sp,64
    80003d5c:	00008067          	ret
    80003d60:	00001517          	auipc	a0,0x1
    80003d64:	43850513          	addi	a0,a0,1080 # 80005198 <digits+0x18>
    80003d68:	fffff097          	auipc	ra,0xfffff
    80003d6c:	4b4080e7          	jalr	1204(ra) # 8000321c <panic>

0000000080003d70 <freerange>:
    80003d70:	fc010113          	addi	sp,sp,-64
    80003d74:	000017b7          	lui	a5,0x1
    80003d78:	02913423          	sd	s1,40(sp)
    80003d7c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003d80:	009504b3          	add	s1,a0,s1
    80003d84:	fffff537          	lui	a0,0xfffff
    80003d88:	02813823          	sd	s0,48(sp)
    80003d8c:	02113c23          	sd	ra,56(sp)
    80003d90:	03213023          	sd	s2,32(sp)
    80003d94:	01313c23          	sd	s3,24(sp)
    80003d98:	01413823          	sd	s4,16(sp)
    80003d9c:	01513423          	sd	s5,8(sp)
    80003da0:	01613023          	sd	s6,0(sp)
    80003da4:	04010413          	addi	s0,sp,64
    80003da8:	00a4f4b3          	and	s1,s1,a0
    80003dac:	00f487b3          	add	a5,s1,a5
    80003db0:	06f5e463          	bltu	a1,a5,80003e18 <freerange+0xa8>
    80003db4:	00003a97          	auipc	s5,0x3
    80003db8:	dbca8a93          	addi	s5,s5,-580 # 80006b70 <end>
    80003dbc:	0954e263          	bltu	s1,s5,80003e40 <freerange+0xd0>
    80003dc0:	01100993          	li	s3,17
    80003dc4:	01b99993          	slli	s3,s3,0x1b
    80003dc8:	0734fc63          	bgeu	s1,s3,80003e40 <freerange+0xd0>
    80003dcc:	00058a13          	mv	s4,a1
    80003dd0:	00002917          	auipc	s2,0x2
    80003dd4:	af090913          	addi	s2,s2,-1296 # 800058c0 <kmem>
    80003dd8:	00002b37          	lui	s6,0x2
    80003ddc:	0140006f          	j	80003df0 <freerange+0x80>
    80003de0:	000017b7          	lui	a5,0x1
    80003de4:	00f484b3          	add	s1,s1,a5
    80003de8:	0554ec63          	bltu	s1,s5,80003e40 <freerange+0xd0>
    80003dec:	0534fa63          	bgeu	s1,s3,80003e40 <freerange+0xd0>
    80003df0:	00001637          	lui	a2,0x1
    80003df4:	00100593          	li	a1,1
    80003df8:	00048513          	mv	a0,s1
    80003dfc:	00000097          	auipc	ra,0x0
    80003e00:	50c080e7          	jalr	1292(ra) # 80004308 <__memset>
    80003e04:	00093703          	ld	a4,0(s2)
    80003e08:	016487b3          	add	a5,s1,s6
    80003e0c:	00e4b023          	sd	a4,0(s1)
    80003e10:	00993023          	sd	s1,0(s2)
    80003e14:	fcfa76e3          	bgeu	s4,a5,80003de0 <freerange+0x70>
    80003e18:	03813083          	ld	ra,56(sp)
    80003e1c:	03013403          	ld	s0,48(sp)
    80003e20:	02813483          	ld	s1,40(sp)
    80003e24:	02013903          	ld	s2,32(sp)
    80003e28:	01813983          	ld	s3,24(sp)
    80003e2c:	01013a03          	ld	s4,16(sp)
    80003e30:	00813a83          	ld	s5,8(sp)
    80003e34:	00013b03          	ld	s6,0(sp)
    80003e38:	04010113          	addi	sp,sp,64
    80003e3c:	00008067          	ret
    80003e40:	00001517          	auipc	a0,0x1
    80003e44:	35850513          	addi	a0,a0,856 # 80005198 <digits+0x18>
    80003e48:	fffff097          	auipc	ra,0xfffff
    80003e4c:	3d4080e7          	jalr	980(ra) # 8000321c <panic>

0000000080003e50 <kfree>:
    80003e50:	fe010113          	addi	sp,sp,-32
    80003e54:	00813823          	sd	s0,16(sp)
    80003e58:	00113c23          	sd	ra,24(sp)
    80003e5c:	00913423          	sd	s1,8(sp)
    80003e60:	02010413          	addi	s0,sp,32
    80003e64:	03451793          	slli	a5,a0,0x34
    80003e68:	04079c63          	bnez	a5,80003ec0 <kfree+0x70>
    80003e6c:	00003797          	auipc	a5,0x3
    80003e70:	d0478793          	addi	a5,a5,-764 # 80006b70 <end>
    80003e74:	00050493          	mv	s1,a0
    80003e78:	04f56463          	bltu	a0,a5,80003ec0 <kfree+0x70>
    80003e7c:	01100793          	li	a5,17
    80003e80:	01b79793          	slli	a5,a5,0x1b
    80003e84:	02f57e63          	bgeu	a0,a5,80003ec0 <kfree+0x70>
    80003e88:	00001637          	lui	a2,0x1
    80003e8c:	00100593          	li	a1,1
    80003e90:	00000097          	auipc	ra,0x0
    80003e94:	478080e7          	jalr	1144(ra) # 80004308 <__memset>
    80003e98:	00002797          	auipc	a5,0x2
    80003e9c:	a2878793          	addi	a5,a5,-1496 # 800058c0 <kmem>
    80003ea0:	0007b703          	ld	a4,0(a5)
    80003ea4:	01813083          	ld	ra,24(sp)
    80003ea8:	01013403          	ld	s0,16(sp)
    80003eac:	00e4b023          	sd	a4,0(s1)
    80003eb0:	0097b023          	sd	s1,0(a5)
    80003eb4:	00813483          	ld	s1,8(sp)
    80003eb8:	02010113          	addi	sp,sp,32
    80003ebc:	00008067          	ret
    80003ec0:	00001517          	auipc	a0,0x1
    80003ec4:	2d850513          	addi	a0,a0,728 # 80005198 <digits+0x18>
    80003ec8:	fffff097          	auipc	ra,0xfffff
    80003ecc:	354080e7          	jalr	852(ra) # 8000321c <panic>

0000000080003ed0 <kalloc>:
    80003ed0:	fe010113          	addi	sp,sp,-32
    80003ed4:	00813823          	sd	s0,16(sp)
    80003ed8:	00913423          	sd	s1,8(sp)
    80003edc:	00113c23          	sd	ra,24(sp)
    80003ee0:	02010413          	addi	s0,sp,32
    80003ee4:	00002797          	auipc	a5,0x2
    80003ee8:	9dc78793          	addi	a5,a5,-1572 # 800058c0 <kmem>
    80003eec:	0007b483          	ld	s1,0(a5)
    80003ef0:	02048063          	beqz	s1,80003f10 <kalloc+0x40>
    80003ef4:	0004b703          	ld	a4,0(s1)
    80003ef8:	00001637          	lui	a2,0x1
    80003efc:	00500593          	li	a1,5
    80003f00:	00048513          	mv	a0,s1
    80003f04:	00e7b023          	sd	a4,0(a5)
    80003f08:	00000097          	auipc	ra,0x0
    80003f0c:	400080e7          	jalr	1024(ra) # 80004308 <__memset>
    80003f10:	01813083          	ld	ra,24(sp)
    80003f14:	01013403          	ld	s0,16(sp)
    80003f18:	00048513          	mv	a0,s1
    80003f1c:	00813483          	ld	s1,8(sp)
    80003f20:	02010113          	addi	sp,sp,32
    80003f24:	00008067          	ret

0000000080003f28 <initlock>:
    80003f28:	ff010113          	addi	sp,sp,-16
    80003f2c:	00813423          	sd	s0,8(sp)
    80003f30:	01010413          	addi	s0,sp,16
    80003f34:	00813403          	ld	s0,8(sp)
    80003f38:	00b53423          	sd	a1,8(a0)
    80003f3c:	00052023          	sw	zero,0(a0)
    80003f40:	00053823          	sd	zero,16(a0)
    80003f44:	01010113          	addi	sp,sp,16
    80003f48:	00008067          	ret

0000000080003f4c <acquire>:
    80003f4c:	fe010113          	addi	sp,sp,-32
    80003f50:	00813823          	sd	s0,16(sp)
    80003f54:	00913423          	sd	s1,8(sp)
    80003f58:	00113c23          	sd	ra,24(sp)
    80003f5c:	01213023          	sd	s2,0(sp)
    80003f60:	02010413          	addi	s0,sp,32
    80003f64:	00050493          	mv	s1,a0
    80003f68:	10002973          	csrr	s2,sstatus
    80003f6c:	100027f3          	csrr	a5,sstatus
    80003f70:	ffd7f793          	andi	a5,a5,-3
    80003f74:	10079073          	csrw	sstatus,a5
    80003f78:	fffff097          	auipc	ra,0xfffff
    80003f7c:	8e0080e7          	jalr	-1824(ra) # 80002858 <mycpu>
    80003f80:	07852783          	lw	a5,120(a0)
    80003f84:	06078e63          	beqz	a5,80004000 <acquire+0xb4>
    80003f88:	fffff097          	auipc	ra,0xfffff
    80003f8c:	8d0080e7          	jalr	-1840(ra) # 80002858 <mycpu>
    80003f90:	07852783          	lw	a5,120(a0)
    80003f94:	0004a703          	lw	a4,0(s1)
    80003f98:	0017879b          	addiw	a5,a5,1
    80003f9c:	06f52c23          	sw	a5,120(a0)
    80003fa0:	04071063          	bnez	a4,80003fe0 <acquire+0x94>
    80003fa4:	00100713          	li	a4,1
    80003fa8:	00070793          	mv	a5,a4
    80003fac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003fb0:	0007879b          	sext.w	a5,a5
    80003fb4:	fe079ae3          	bnez	a5,80003fa8 <acquire+0x5c>
    80003fb8:	0ff0000f          	fence
    80003fbc:	fffff097          	auipc	ra,0xfffff
    80003fc0:	89c080e7          	jalr	-1892(ra) # 80002858 <mycpu>
    80003fc4:	01813083          	ld	ra,24(sp)
    80003fc8:	01013403          	ld	s0,16(sp)
    80003fcc:	00a4b823          	sd	a0,16(s1)
    80003fd0:	00013903          	ld	s2,0(sp)
    80003fd4:	00813483          	ld	s1,8(sp)
    80003fd8:	02010113          	addi	sp,sp,32
    80003fdc:	00008067          	ret
    80003fe0:	0104b903          	ld	s2,16(s1)
    80003fe4:	fffff097          	auipc	ra,0xfffff
    80003fe8:	874080e7          	jalr	-1932(ra) # 80002858 <mycpu>
    80003fec:	faa91ce3          	bne	s2,a0,80003fa4 <acquire+0x58>
    80003ff0:	00001517          	auipc	a0,0x1
    80003ff4:	1b050513          	addi	a0,a0,432 # 800051a0 <digits+0x20>
    80003ff8:	fffff097          	auipc	ra,0xfffff
    80003ffc:	224080e7          	jalr	548(ra) # 8000321c <panic>
    80004000:	00195913          	srli	s2,s2,0x1
    80004004:	fffff097          	auipc	ra,0xfffff
    80004008:	854080e7          	jalr	-1964(ra) # 80002858 <mycpu>
    8000400c:	00197913          	andi	s2,s2,1
    80004010:	07252e23          	sw	s2,124(a0)
    80004014:	f75ff06f          	j	80003f88 <acquire+0x3c>

0000000080004018 <release>:
    80004018:	fe010113          	addi	sp,sp,-32
    8000401c:	00813823          	sd	s0,16(sp)
    80004020:	00113c23          	sd	ra,24(sp)
    80004024:	00913423          	sd	s1,8(sp)
    80004028:	01213023          	sd	s2,0(sp)
    8000402c:	02010413          	addi	s0,sp,32
    80004030:	00052783          	lw	a5,0(a0)
    80004034:	00079a63          	bnez	a5,80004048 <release+0x30>
    80004038:	00001517          	auipc	a0,0x1
    8000403c:	17050513          	addi	a0,a0,368 # 800051a8 <digits+0x28>
    80004040:	fffff097          	auipc	ra,0xfffff
    80004044:	1dc080e7          	jalr	476(ra) # 8000321c <panic>
    80004048:	01053903          	ld	s2,16(a0)
    8000404c:	00050493          	mv	s1,a0
    80004050:	fffff097          	auipc	ra,0xfffff
    80004054:	808080e7          	jalr	-2040(ra) # 80002858 <mycpu>
    80004058:	fea910e3          	bne	s2,a0,80004038 <release+0x20>
    8000405c:	0004b823          	sd	zero,16(s1)
    80004060:	0ff0000f          	fence
    80004064:	0f50000f          	fence	iorw,ow
    80004068:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000406c:	ffffe097          	auipc	ra,0xffffe
    80004070:	7ec080e7          	jalr	2028(ra) # 80002858 <mycpu>
    80004074:	100027f3          	csrr	a5,sstatus
    80004078:	0027f793          	andi	a5,a5,2
    8000407c:	04079a63          	bnez	a5,800040d0 <release+0xb8>
    80004080:	07852783          	lw	a5,120(a0)
    80004084:	02f05e63          	blez	a5,800040c0 <release+0xa8>
    80004088:	fff7871b          	addiw	a4,a5,-1
    8000408c:	06e52c23          	sw	a4,120(a0)
    80004090:	00071c63          	bnez	a4,800040a8 <release+0x90>
    80004094:	07c52783          	lw	a5,124(a0)
    80004098:	00078863          	beqz	a5,800040a8 <release+0x90>
    8000409c:	100027f3          	csrr	a5,sstatus
    800040a0:	0027e793          	ori	a5,a5,2
    800040a4:	10079073          	csrw	sstatus,a5
    800040a8:	01813083          	ld	ra,24(sp)
    800040ac:	01013403          	ld	s0,16(sp)
    800040b0:	00813483          	ld	s1,8(sp)
    800040b4:	00013903          	ld	s2,0(sp)
    800040b8:	02010113          	addi	sp,sp,32
    800040bc:	00008067          	ret
    800040c0:	00001517          	auipc	a0,0x1
    800040c4:	10850513          	addi	a0,a0,264 # 800051c8 <digits+0x48>
    800040c8:	fffff097          	auipc	ra,0xfffff
    800040cc:	154080e7          	jalr	340(ra) # 8000321c <panic>
    800040d0:	00001517          	auipc	a0,0x1
    800040d4:	0e050513          	addi	a0,a0,224 # 800051b0 <digits+0x30>
    800040d8:	fffff097          	auipc	ra,0xfffff
    800040dc:	144080e7          	jalr	324(ra) # 8000321c <panic>

00000000800040e0 <holding>:
    800040e0:	00052783          	lw	a5,0(a0)
    800040e4:	00079663          	bnez	a5,800040f0 <holding+0x10>
    800040e8:	00000513          	li	a0,0
    800040ec:	00008067          	ret
    800040f0:	fe010113          	addi	sp,sp,-32
    800040f4:	00813823          	sd	s0,16(sp)
    800040f8:	00913423          	sd	s1,8(sp)
    800040fc:	00113c23          	sd	ra,24(sp)
    80004100:	02010413          	addi	s0,sp,32
    80004104:	01053483          	ld	s1,16(a0)
    80004108:	ffffe097          	auipc	ra,0xffffe
    8000410c:	750080e7          	jalr	1872(ra) # 80002858 <mycpu>
    80004110:	01813083          	ld	ra,24(sp)
    80004114:	01013403          	ld	s0,16(sp)
    80004118:	40a48533          	sub	a0,s1,a0
    8000411c:	00153513          	seqz	a0,a0
    80004120:	00813483          	ld	s1,8(sp)
    80004124:	02010113          	addi	sp,sp,32
    80004128:	00008067          	ret

000000008000412c <push_off>:
    8000412c:	fe010113          	addi	sp,sp,-32
    80004130:	00813823          	sd	s0,16(sp)
    80004134:	00113c23          	sd	ra,24(sp)
    80004138:	00913423          	sd	s1,8(sp)
    8000413c:	02010413          	addi	s0,sp,32
    80004140:	100024f3          	csrr	s1,sstatus
    80004144:	100027f3          	csrr	a5,sstatus
    80004148:	ffd7f793          	andi	a5,a5,-3
    8000414c:	10079073          	csrw	sstatus,a5
    80004150:	ffffe097          	auipc	ra,0xffffe
    80004154:	708080e7          	jalr	1800(ra) # 80002858 <mycpu>
    80004158:	07852783          	lw	a5,120(a0)
    8000415c:	02078663          	beqz	a5,80004188 <push_off+0x5c>
    80004160:	ffffe097          	auipc	ra,0xffffe
    80004164:	6f8080e7          	jalr	1784(ra) # 80002858 <mycpu>
    80004168:	07852783          	lw	a5,120(a0)
    8000416c:	01813083          	ld	ra,24(sp)
    80004170:	01013403          	ld	s0,16(sp)
    80004174:	0017879b          	addiw	a5,a5,1
    80004178:	06f52c23          	sw	a5,120(a0)
    8000417c:	00813483          	ld	s1,8(sp)
    80004180:	02010113          	addi	sp,sp,32
    80004184:	00008067          	ret
    80004188:	0014d493          	srli	s1,s1,0x1
    8000418c:	ffffe097          	auipc	ra,0xffffe
    80004190:	6cc080e7          	jalr	1740(ra) # 80002858 <mycpu>
    80004194:	0014f493          	andi	s1,s1,1
    80004198:	06952e23          	sw	s1,124(a0)
    8000419c:	fc5ff06f          	j	80004160 <push_off+0x34>

00000000800041a0 <pop_off>:
    800041a0:	ff010113          	addi	sp,sp,-16
    800041a4:	00813023          	sd	s0,0(sp)
    800041a8:	00113423          	sd	ra,8(sp)
    800041ac:	01010413          	addi	s0,sp,16
    800041b0:	ffffe097          	auipc	ra,0xffffe
    800041b4:	6a8080e7          	jalr	1704(ra) # 80002858 <mycpu>
    800041b8:	100027f3          	csrr	a5,sstatus
    800041bc:	0027f793          	andi	a5,a5,2
    800041c0:	04079663          	bnez	a5,8000420c <pop_off+0x6c>
    800041c4:	07852783          	lw	a5,120(a0)
    800041c8:	02f05a63          	blez	a5,800041fc <pop_off+0x5c>
    800041cc:	fff7871b          	addiw	a4,a5,-1
    800041d0:	06e52c23          	sw	a4,120(a0)
    800041d4:	00071c63          	bnez	a4,800041ec <pop_off+0x4c>
    800041d8:	07c52783          	lw	a5,124(a0)
    800041dc:	00078863          	beqz	a5,800041ec <pop_off+0x4c>
    800041e0:	100027f3          	csrr	a5,sstatus
    800041e4:	0027e793          	ori	a5,a5,2
    800041e8:	10079073          	csrw	sstatus,a5
    800041ec:	00813083          	ld	ra,8(sp)
    800041f0:	00013403          	ld	s0,0(sp)
    800041f4:	01010113          	addi	sp,sp,16
    800041f8:	00008067          	ret
    800041fc:	00001517          	auipc	a0,0x1
    80004200:	fcc50513          	addi	a0,a0,-52 # 800051c8 <digits+0x48>
    80004204:	fffff097          	auipc	ra,0xfffff
    80004208:	018080e7          	jalr	24(ra) # 8000321c <panic>
    8000420c:	00001517          	auipc	a0,0x1
    80004210:	fa450513          	addi	a0,a0,-92 # 800051b0 <digits+0x30>
    80004214:	fffff097          	auipc	ra,0xfffff
    80004218:	008080e7          	jalr	8(ra) # 8000321c <panic>

000000008000421c <push_on>:
    8000421c:	fe010113          	addi	sp,sp,-32
    80004220:	00813823          	sd	s0,16(sp)
    80004224:	00113c23          	sd	ra,24(sp)
    80004228:	00913423          	sd	s1,8(sp)
    8000422c:	02010413          	addi	s0,sp,32
    80004230:	100024f3          	csrr	s1,sstatus
    80004234:	100027f3          	csrr	a5,sstatus
    80004238:	0027e793          	ori	a5,a5,2
    8000423c:	10079073          	csrw	sstatus,a5
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	618080e7          	jalr	1560(ra) # 80002858 <mycpu>
    80004248:	07852783          	lw	a5,120(a0)
    8000424c:	02078663          	beqz	a5,80004278 <push_on+0x5c>
    80004250:	ffffe097          	auipc	ra,0xffffe
    80004254:	608080e7          	jalr	1544(ra) # 80002858 <mycpu>
    80004258:	07852783          	lw	a5,120(a0)
    8000425c:	01813083          	ld	ra,24(sp)
    80004260:	01013403          	ld	s0,16(sp)
    80004264:	0017879b          	addiw	a5,a5,1
    80004268:	06f52c23          	sw	a5,120(a0)
    8000426c:	00813483          	ld	s1,8(sp)
    80004270:	02010113          	addi	sp,sp,32
    80004274:	00008067          	ret
    80004278:	0014d493          	srli	s1,s1,0x1
    8000427c:	ffffe097          	auipc	ra,0xffffe
    80004280:	5dc080e7          	jalr	1500(ra) # 80002858 <mycpu>
    80004284:	0014f493          	andi	s1,s1,1
    80004288:	06952e23          	sw	s1,124(a0)
    8000428c:	fc5ff06f          	j	80004250 <push_on+0x34>

0000000080004290 <pop_on>:
    80004290:	ff010113          	addi	sp,sp,-16
    80004294:	00813023          	sd	s0,0(sp)
    80004298:	00113423          	sd	ra,8(sp)
    8000429c:	01010413          	addi	s0,sp,16
    800042a0:	ffffe097          	auipc	ra,0xffffe
    800042a4:	5b8080e7          	jalr	1464(ra) # 80002858 <mycpu>
    800042a8:	100027f3          	csrr	a5,sstatus
    800042ac:	0027f793          	andi	a5,a5,2
    800042b0:	04078463          	beqz	a5,800042f8 <pop_on+0x68>
    800042b4:	07852783          	lw	a5,120(a0)
    800042b8:	02f05863          	blez	a5,800042e8 <pop_on+0x58>
    800042bc:	fff7879b          	addiw	a5,a5,-1
    800042c0:	06f52c23          	sw	a5,120(a0)
    800042c4:	07853783          	ld	a5,120(a0)
    800042c8:	00079863          	bnez	a5,800042d8 <pop_on+0x48>
    800042cc:	100027f3          	csrr	a5,sstatus
    800042d0:	ffd7f793          	andi	a5,a5,-3
    800042d4:	10079073          	csrw	sstatus,a5
    800042d8:	00813083          	ld	ra,8(sp)
    800042dc:	00013403          	ld	s0,0(sp)
    800042e0:	01010113          	addi	sp,sp,16
    800042e4:	00008067          	ret
    800042e8:	00001517          	auipc	a0,0x1
    800042ec:	f0850513          	addi	a0,a0,-248 # 800051f0 <digits+0x70>
    800042f0:	fffff097          	auipc	ra,0xfffff
    800042f4:	f2c080e7          	jalr	-212(ra) # 8000321c <panic>
    800042f8:	00001517          	auipc	a0,0x1
    800042fc:	ed850513          	addi	a0,a0,-296 # 800051d0 <digits+0x50>
    80004300:	fffff097          	auipc	ra,0xfffff
    80004304:	f1c080e7          	jalr	-228(ra) # 8000321c <panic>

0000000080004308 <__memset>:
    80004308:	ff010113          	addi	sp,sp,-16
    8000430c:	00813423          	sd	s0,8(sp)
    80004310:	01010413          	addi	s0,sp,16
    80004314:	1a060e63          	beqz	a2,800044d0 <__memset+0x1c8>
    80004318:	40a007b3          	neg	a5,a0
    8000431c:	0077f793          	andi	a5,a5,7
    80004320:	00778693          	addi	a3,a5,7
    80004324:	00b00813          	li	a6,11
    80004328:	0ff5f593          	andi	a1,a1,255
    8000432c:	fff6071b          	addiw	a4,a2,-1
    80004330:	1b06e663          	bltu	a3,a6,800044dc <__memset+0x1d4>
    80004334:	1cd76463          	bltu	a4,a3,800044fc <__memset+0x1f4>
    80004338:	1a078e63          	beqz	a5,800044f4 <__memset+0x1ec>
    8000433c:	00b50023          	sb	a1,0(a0)
    80004340:	00100713          	li	a4,1
    80004344:	1ae78463          	beq	a5,a4,800044ec <__memset+0x1e4>
    80004348:	00b500a3          	sb	a1,1(a0)
    8000434c:	00200713          	li	a4,2
    80004350:	1ae78a63          	beq	a5,a4,80004504 <__memset+0x1fc>
    80004354:	00b50123          	sb	a1,2(a0)
    80004358:	00300713          	li	a4,3
    8000435c:	18e78463          	beq	a5,a4,800044e4 <__memset+0x1dc>
    80004360:	00b501a3          	sb	a1,3(a0)
    80004364:	00400713          	li	a4,4
    80004368:	1ae78263          	beq	a5,a4,8000450c <__memset+0x204>
    8000436c:	00b50223          	sb	a1,4(a0)
    80004370:	00500713          	li	a4,5
    80004374:	1ae78063          	beq	a5,a4,80004514 <__memset+0x20c>
    80004378:	00b502a3          	sb	a1,5(a0)
    8000437c:	00700713          	li	a4,7
    80004380:	18e79e63          	bne	a5,a4,8000451c <__memset+0x214>
    80004384:	00b50323          	sb	a1,6(a0)
    80004388:	00700e93          	li	t4,7
    8000438c:	00859713          	slli	a4,a1,0x8
    80004390:	00e5e733          	or	a4,a1,a4
    80004394:	01059e13          	slli	t3,a1,0x10
    80004398:	01c76e33          	or	t3,a4,t3
    8000439c:	01859313          	slli	t1,a1,0x18
    800043a0:	006e6333          	or	t1,t3,t1
    800043a4:	02059893          	slli	a7,a1,0x20
    800043a8:	40f60e3b          	subw	t3,a2,a5
    800043ac:	011368b3          	or	a7,t1,a7
    800043b0:	02859813          	slli	a6,a1,0x28
    800043b4:	0108e833          	or	a6,a7,a6
    800043b8:	03059693          	slli	a3,a1,0x30
    800043bc:	003e589b          	srliw	a7,t3,0x3
    800043c0:	00d866b3          	or	a3,a6,a3
    800043c4:	03859713          	slli	a4,a1,0x38
    800043c8:	00389813          	slli	a6,a7,0x3
    800043cc:	00f507b3          	add	a5,a0,a5
    800043d0:	00e6e733          	or	a4,a3,a4
    800043d4:	000e089b          	sext.w	a7,t3
    800043d8:	00f806b3          	add	a3,a6,a5
    800043dc:	00e7b023          	sd	a4,0(a5)
    800043e0:	00878793          	addi	a5,a5,8
    800043e4:	fed79ce3          	bne	a5,a3,800043dc <__memset+0xd4>
    800043e8:	ff8e7793          	andi	a5,t3,-8
    800043ec:	0007871b          	sext.w	a4,a5
    800043f0:	01d787bb          	addw	a5,a5,t4
    800043f4:	0ce88e63          	beq	a7,a4,800044d0 <__memset+0x1c8>
    800043f8:	00f50733          	add	a4,a0,a5
    800043fc:	00b70023          	sb	a1,0(a4)
    80004400:	0017871b          	addiw	a4,a5,1
    80004404:	0cc77663          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004408:	00e50733          	add	a4,a0,a4
    8000440c:	00b70023          	sb	a1,0(a4)
    80004410:	0027871b          	addiw	a4,a5,2
    80004414:	0ac77e63          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004418:	00e50733          	add	a4,a0,a4
    8000441c:	00b70023          	sb	a1,0(a4)
    80004420:	0037871b          	addiw	a4,a5,3
    80004424:	0ac77663          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004428:	00e50733          	add	a4,a0,a4
    8000442c:	00b70023          	sb	a1,0(a4)
    80004430:	0047871b          	addiw	a4,a5,4
    80004434:	08c77e63          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004438:	00e50733          	add	a4,a0,a4
    8000443c:	00b70023          	sb	a1,0(a4)
    80004440:	0057871b          	addiw	a4,a5,5
    80004444:	08c77663          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004448:	00e50733          	add	a4,a0,a4
    8000444c:	00b70023          	sb	a1,0(a4)
    80004450:	0067871b          	addiw	a4,a5,6
    80004454:	06c77e63          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004458:	00e50733          	add	a4,a0,a4
    8000445c:	00b70023          	sb	a1,0(a4)
    80004460:	0077871b          	addiw	a4,a5,7
    80004464:	06c77663          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004468:	00e50733          	add	a4,a0,a4
    8000446c:	00b70023          	sb	a1,0(a4)
    80004470:	0087871b          	addiw	a4,a5,8
    80004474:	04c77e63          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004478:	00e50733          	add	a4,a0,a4
    8000447c:	00b70023          	sb	a1,0(a4)
    80004480:	0097871b          	addiw	a4,a5,9
    80004484:	04c77663          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004488:	00e50733          	add	a4,a0,a4
    8000448c:	00b70023          	sb	a1,0(a4)
    80004490:	00a7871b          	addiw	a4,a5,10
    80004494:	02c77e63          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    80004498:	00e50733          	add	a4,a0,a4
    8000449c:	00b70023          	sb	a1,0(a4)
    800044a0:	00b7871b          	addiw	a4,a5,11
    800044a4:	02c77663          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    800044a8:	00e50733          	add	a4,a0,a4
    800044ac:	00b70023          	sb	a1,0(a4)
    800044b0:	00c7871b          	addiw	a4,a5,12
    800044b4:	00c77e63          	bgeu	a4,a2,800044d0 <__memset+0x1c8>
    800044b8:	00e50733          	add	a4,a0,a4
    800044bc:	00b70023          	sb	a1,0(a4)
    800044c0:	00d7879b          	addiw	a5,a5,13
    800044c4:	00c7f663          	bgeu	a5,a2,800044d0 <__memset+0x1c8>
    800044c8:	00f507b3          	add	a5,a0,a5
    800044cc:	00b78023          	sb	a1,0(a5)
    800044d0:	00813403          	ld	s0,8(sp)
    800044d4:	01010113          	addi	sp,sp,16
    800044d8:	00008067          	ret
    800044dc:	00b00693          	li	a3,11
    800044e0:	e55ff06f          	j	80004334 <__memset+0x2c>
    800044e4:	00300e93          	li	t4,3
    800044e8:	ea5ff06f          	j	8000438c <__memset+0x84>
    800044ec:	00100e93          	li	t4,1
    800044f0:	e9dff06f          	j	8000438c <__memset+0x84>
    800044f4:	00000e93          	li	t4,0
    800044f8:	e95ff06f          	j	8000438c <__memset+0x84>
    800044fc:	00000793          	li	a5,0
    80004500:	ef9ff06f          	j	800043f8 <__memset+0xf0>
    80004504:	00200e93          	li	t4,2
    80004508:	e85ff06f          	j	8000438c <__memset+0x84>
    8000450c:	00400e93          	li	t4,4
    80004510:	e7dff06f          	j	8000438c <__memset+0x84>
    80004514:	00500e93          	li	t4,5
    80004518:	e75ff06f          	j	8000438c <__memset+0x84>
    8000451c:	00600e93          	li	t4,6
    80004520:	e6dff06f          	j	8000438c <__memset+0x84>

0000000080004524 <__memmove>:
    80004524:	ff010113          	addi	sp,sp,-16
    80004528:	00813423          	sd	s0,8(sp)
    8000452c:	01010413          	addi	s0,sp,16
    80004530:	0e060863          	beqz	a2,80004620 <__memmove+0xfc>
    80004534:	fff6069b          	addiw	a3,a2,-1
    80004538:	0006881b          	sext.w	a6,a3
    8000453c:	0ea5e863          	bltu	a1,a0,8000462c <__memmove+0x108>
    80004540:	00758713          	addi	a4,a1,7
    80004544:	00a5e7b3          	or	a5,a1,a0
    80004548:	40a70733          	sub	a4,a4,a0
    8000454c:	0077f793          	andi	a5,a5,7
    80004550:	00f73713          	sltiu	a4,a4,15
    80004554:	00174713          	xori	a4,a4,1
    80004558:	0017b793          	seqz	a5,a5
    8000455c:	00e7f7b3          	and	a5,a5,a4
    80004560:	10078863          	beqz	a5,80004670 <__memmove+0x14c>
    80004564:	00900793          	li	a5,9
    80004568:	1107f463          	bgeu	a5,a6,80004670 <__memmove+0x14c>
    8000456c:	0036581b          	srliw	a6,a2,0x3
    80004570:	fff8081b          	addiw	a6,a6,-1
    80004574:	02081813          	slli	a6,a6,0x20
    80004578:	01d85893          	srli	a7,a6,0x1d
    8000457c:	00858813          	addi	a6,a1,8
    80004580:	00058793          	mv	a5,a1
    80004584:	00050713          	mv	a4,a0
    80004588:	01088833          	add	a6,a7,a6
    8000458c:	0007b883          	ld	a7,0(a5)
    80004590:	00878793          	addi	a5,a5,8
    80004594:	00870713          	addi	a4,a4,8
    80004598:	ff173c23          	sd	a7,-8(a4)
    8000459c:	ff0798e3          	bne	a5,a6,8000458c <__memmove+0x68>
    800045a0:	ff867713          	andi	a4,a2,-8
    800045a4:	02071793          	slli	a5,a4,0x20
    800045a8:	0207d793          	srli	a5,a5,0x20
    800045ac:	00f585b3          	add	a1,a1,a5
    800045b0:	40e686bb          	subw	a3,a3,a4
    800045b4:	00f507b3          	add	a5,a0,a5
    800045b8:	06e60463          	beq	a2,a4,80004620 <__memmove+0xfc>
    800045bc:	0005c703          	lbu	a4,0(a1)
    800045c0:	00e78023          	sb	a4,0(a5)
    800045c4:	04068e63          	beqz	a3,80004620 <__memmove+0xfc>
    800045c8:	0015c603          	lbu	a2,1(a1)
    800045cc:	00100713          	li	a4,1
    800045d0:	00c780a3          	sb	a2,1(a5)
    800045d4:	04e68663          	beq	a3,a4,80004620 <__memmove+0xfc>
    800045d8:	0025c603          	lbu	a2,2(a1)
    800045dc:	00200713          	li	a4,2
    800045e0:	00c78123          	sb	a2,2(a5)
    800045e4:	02e68e63          	beq	a3,a4,80004620 <__memmove+0xfc>
    800045e8:	0035c603          	lbu	a2,3(a1)
    800045ec:	00300713          	li	a4,3
    800045f0:	00c781a3          	sb	a2,3(a5)
    800045f4:	02e68663          	beq	a3,a4,80004620 <__memmove+0xfc>
    800045f8:	0045c603          	lbu	a2,4(a1)
    800045fc:	00400713          	li	a4,4
    80004600:	00c78223          	sb	a2,4(a5)
    80004604:	00e68e63          	beq	a3,a4,80004620 <__memmove+0xfc>
    80004608:	0055c603          	lbu	a2,5(a1)
    8000460c:	00500713          	li	a4,5
    80004610:	00c782a3          	sb	a2,5(a5)
    80004614:	00e68663          	beq	a3,a4,80004620 <__memmove+0xfc>
    80004618:	0065c703          	lbu	a4,6(a1)
    8000461c:	00e78323          	sb	a4,6(a5)
    80004620:	00813403          	ld	s0,8(sp)
    80004624:	01010113          	addi	sp,sp,16
    80004628:	00008067          	ret
    8000462c:	02061713          	slli	a4,a2,0x20
    80004630:	02075713          	srli	a4,a4,0x20
    80004634:	00e587b3          	add	a5,a1,a4
    80004638:	f0f574e3          	bgeu	a0,a5,80004540 <__memmove+0x1c>
    8000463c:	02069613          	slli	a2,a3,0x20
    80004640:	02065613          	srli	a2,a2,0x20
    80004644:	fff64613          	not	a2,a2
    80004648:	00e50733          	add	a4,a0,a4
    8000464c:	00c78633          	add	a2,a5,a2
    80004650:	fff7c683          	lbu	a3,-1(a5)
    80004654:	fff78793          	addi	a5,a5,-1
    80004658:	fff70713          	addi	a4,a4,-1
    8000465c:	00d70023          	sb	a3,0(a4)
    80004660:	fec798e3          	bne	a5,a2,80004650 <__memmove+0x12c>
    80004664:	00813403          	ld	s0,8(sp)
    80004668:	01010113          	addi	sp,sp,16
    8000466c:	00008067          	ret
    80004670:	02069713          	slli	a4,a3,0x20
    80004674:	02075713          	srli	a4,a4,0x20
    80004678:	00170713          	addi	a4,a4,1
    8000467c:	00e50733          	add	a4,a0,a4
    80004680:	00050793          	mv	a5,a0
    80004684:	0005c683          	lbu	a3,0(a1)
    80004688:	00178793          	addi	a5,a5,1
    8000468c:	00158593          	addi	a1,a1,1
    80004690:	fed78fa3          	sb	a3,-1(a5)
    80004694:	fee798e3          	bne	a5,a4,80004684 <__memmove+0x160>
    80004698:	f89ff06f          	j	80004620 <__memmove+0xfc>

000000008000469c <__putc>:
    8000469c:	fe010113          	addi	sp,sp,-32
    800046a0:	00813823          	sd	s0,16(sp)
    800046a4:	00113c23          	sd	ra,24(sp)
    800046a8:	02010413          	addi	s0,sp,32
    800046ac:	00050793          	mv	a5,a0
    800046b0:	fef40593          	addi	a1,s0,-17
    800046b4:	00100613          	li	a2,1
    800046b8:	00000513          	li	a0,0
    800046bc:	fef407a3          	sb	a5,-17(s0)
    800046c0:	fffff097          	auipc	ra,0xfffff
    800046c4:	b3c080e7          	jalr	-1220(ra) # 800031fc <console_write>
    800046c8:	01813083          	ld	ra,24(sp)
    800046cc:	01013403          	ld	s0,16(sp)
    800046d0:	02010113          	addi	sp,sp,32
    800046d4:	00008067          	ret

00000000800046d8 <__getc>:
    800046d8:	fe010113          	addi	sp,sp,-32
    800046dc:	00813823          	sd	s0,16(sp)
    800046e0:	00113c23          	sd	ra,24(sp)
    800046e4:	02010413          	addi	s0,sp,32
    800046e8:	fe840593          	addi	a1,s0,-24
    800046ec:	00100613          	li	a2,1
    800046f0:	00000513          	li	a0,0
    800046f4:	fffff097          	auipc	ra,0xfffff
    800046f8:	ae8080e7          	jalr	-1304(ra) # 800031dc <console_read>
    800046fc:	fe844503          	lbu	a0,-24(s0)
    80004700:	01813083          	ld	ra,24(sp)
    80004704:	01013403          	ld	s0,16(sp)
    80004708:	02010113          	addi	sp,sp,32
    8000470c:	00008067          	ret

0000000080004710 <console_handler>:
    80004710:	fe010113          	addi	sp,sp,-32
    80004714:	00813823          	sd	s0,16(sp)
    80004718:	00113c23          	sd	ra,24(sp)
    8000471c:	00913423          	sd	s1,8(sp)
    80004720:	02010413          	addi	s0,sp,32
    80004724:	14202773          	csrr	a4,scause
    80004728:	100027f3          	csrr	a5,sstatus
    8000472c:	0027f793          	andi	a5,a5,2
    80004730:	06079e63          	bnez	a5,800047ac <console_handler+0x9c>
    80004734:	00074c63          	bltz	a4,8000474c <console_handler+0x3c>
    80004738:	01813083          	ld	ra,24(sp)
    8000473c:	01013403          	ld	s0,16(sp)
    80004740:	00813483          	ld	s1,8(sp)
    80004744:	02010113          	addi	sp,sp,32
    80004748:	00008067          	ret
    8000474c:	0ff77713          	andi	a4,a4,255
    80004750:	00900793          	li	a5,9
    80004754:	fef712e3          	bne	a4,a5,80004738 <console_handler+0x28>
    80004758:	ffffe097          	auipc	ra,0xffffe
    8000475c:	6dc080e7          	jalr	1756(ra) # 80002e34 <plic_claim>
    80004760:	00a00793          	li	a5,10
    80004764:	00050493          	mv	s1,a0
    80004768:	02f50c63          	beq	a0,a5,800047a0 <console_handler+0x90>
    8000476c:	fc0506e3          	beqz	a0,80004738 <console_handler+0x28>
    80004770:	00050593          	mv	a1,a0
    80004774:	00001517          	auipc	a0,0x1
    80004778:	98450513          	addi	a0,a0,-1660 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    8000477c:	fffff097          	auipc	ra,0xfffff
    80004780:	afc080e7          	jalr	-1284(ra) # 80003278 <__printf>
    80004784:	01013403          	ld	s0,16(sp)
    80004788:	01813083          	ld	ra,24(sp)
    8000478c:	00048513          	mv	a0,s1
    80004790:	00813483          	ld	s1,8(sp)
    80004794:	02010113          	addi	sp,sp,32
    80004798:	ffffe317          	auipc	t1,0xffffe
    8000479c:	6d430067          	jr	1748(t1) # 80002e6c <plic_complete>
    800047a0:	fffff097          	auipc	ra,0xfffff
    800047a4:	3e0080e7          	jalr	992(ra) # 80003b80 <uartintr>
    800047a8:	fddff06f          	j	80004784 <console_handler+0x74>
    800047ac:	00001517          	auipc	a0,0x1
    800047b0:	a4c50513          	addi	a0,a0,-1460 # 800051f8 <digits+0x78>
    800047b4:	fffff097          	auipc	ra,0xfffff
    800047b8:	a68080e7          	jalr	-1432(ra) # 8000321c <panic>
	...
