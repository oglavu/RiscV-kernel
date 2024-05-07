
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	88813103          	ld	sp,-1912(sp) # 80005888 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	648020ef          	jal	ra,80002664 <start>

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
    800010b0:	090010ef          	jal	ra,80002140 <_ZN17interruptHandlers20handleSupervisorTrapEv>
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
    800011c0:	05c010ef          	jal	ra,8000221c <_ZN17interruptHandlers20handleTimerInterruptEv>
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
    800012d0:	725000ef          	jal	ra,800021f4 <_ZN17interruptHandlers22handleConsoleInterruptEv>
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
    800013ec:	0307b703          	ld	a4,48(a5)
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
    80001430:	03852783          	lw	a5,56(a0) # 1038 <_entry-0x7fffefc8>
    80001434:	0385a503          	lw	a0,56(a1)
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
    8000145c:	0385a503          	lw	a0,56(a1)
    80001460:	fe1ff06f          	j	80001440 <_ZN7AVLTree3maxEPKS_S1_+0x2c>
        return n1->height;
    80001464:	03852503          	lw	a0,56(a0)
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
    800014f8:	02a4ac23          	sw	a0,56(s1)
    x->height = 1+max(x->left, x->right);
    800014fc:	00893583          	ld	a1,8(s2)
    80001500:	00093503          	ld	a0,0(s2)
    80001504:	00000097          	auipc	ra,0x0
    80001508:	f10080e7          	jalr	-240(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    8000150c:	0015051b          	addiw	a0,a0,1
    80001510:	02a92c23          	sw	a0,56(s2)
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
    80001584:	02a4ac23          	sw	a0,56(s1)
    y->height = 1+max(y->left, y->right);
    80001588:	00893583          	ld	a1,8(s2)
    8000158c:	00093503          	ld	a0,0(s2)
    80001590:	00000097          	auipc	ra,0x0
    80001594:	e84080e7          	jalr	-380(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    80001598:	0015051b          	addiw	a0,a0,1
    8000159c:	02a92c23          	sw	a0,56(s2)


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
        if (cur == node)
            return true;
        if (cur->sz < node->sz)
            cur = cur->right;
        else
            cur = cur->left;
    800015cc:	00053503          	ld	a0,0(a0)
    while(cur) {
    800015d0:	00050e63          	beqz	a0,800015ec <_ZN7AVLTree8containsEPKS_S1_+0x30>
        if (cur == node)
    800015d4:	02b50463          	beq	a0,a1,800015fc <_ZN7AVLTree8containsEPKS_S1_+0x40>
        if (cur->sz < node->sz)
    800015d8:	03053703          	ld	a4,48(a0)
    800015dc:	0305b783          	ld	a5,48(a1)
    800015e0:	fef776e3          	bgeu	a4,a5,800015cc <_ZN7AVLTree8containsEPKS_S1_+0x10>
            cur = cur->right;
    800015e4:	00853503          	ld	a0,8(a0)
    800015e8:	fe9ff06f          	j	800015d0 <_ZN7AVLTree8containsEPKS_S1_+0x14>
    }

    return false;
    800015ec:	00000513          	li	a0,0
}
    800015f0:	00813403          	ld	s0,8(sp)
    800015f4:	01010113          	addi	sp,sp,16
    800015f8:	00008067          	ret
            return true;
    800015fc:	00100513          	li	a0,1
    80001600:	ff1ff06f          	j	800015f0 <_ZN7AVLTree8containsEPKS_S1_+0x34>

0000000080001604 <_ZN7AVLTree7balanceEPS_>:

AVLTree* AVLTree::balance(AVLTree* cur) {
    80001604:	fc010113          	addi	sp,sp,-64
    80001608:	02113c23          	sd	ra,56(sp)
    8000160c:	02813823          	sd	s0,48(sp)
    80001610:	02913423          	sd	s1,40(sp)
    80001614:	03213023          	sd	s2,32(sp)
    80001618:	01313c23          	sd	s3,24(sp)
    8000161c:	01413823          	sd	s4,16(sp)
    80001620:	01513423          	sd	s5,8(sp)
    80001624:	01613023          	sd	s6,0(sp)
    80001628:	04010413          	addi	s0,sp,64
    8000162c:	00050493          	mv	s1,a0
    AVLTree* prev = nullptr;
    80001630:	00000913          	li	s2,0
    80001634:	0e00006f          	j	80001714 <_ZN7AVLTree7balanceEPS_+0x110>
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
    80001638:	00000993          	li	s3,0
    8000163c:	1080006f          	j	80001744 <_ZN7AVLTree7balanceEPS_+0x140>
    80001640:	00000793          	li	a5,0
    80001644:	10c0006f          	j	80001750 <_ZN7AVLTree7balanceEPS_+0x14c>
    80001648:	00000a13          	li	s4,0
    8000164c:	1200006f          	j	8000176c <_ZN7AVLTree7balanceEPS_+0x168>
    80001650:	00000a13          	li	s4,0
    80001654:	1180006f          	j	8000176c <_ZN7AVLTree7balanceEPS_+0x168>
    80001658:	00000793          	li	a5,0
    8000165c:	1240006f          	j	80001780 <_ZN7AVLTree7balanceEPS_+0x17c>
    80001660:	00000793          	li	a5,0
    80001664:	11c0006f          	j	80001780 <_ZN7AVLTree7balanceEPS_+0x17c>
        int curBalance = AVLTree::getBalance(cur);
        int prevBalance = AVLTree::getBalance(prev);

        AVLTree* oldCurParent = cur->parent;

        if (curBalance < -1 && prevBalance * curBalance < 0) {
    80001668:	033a07bb          	mulw	a5,s4,s3
    8000166c:	1207d263          	bgez	a5,80001790 <_ZN7AVLTree7balanceEPS_+0x18c>
            prev = AVLTree::leftRotation(prev);
    80001670:	00090513          	mv	a0,s2
    80001674:	00000097          	auipc	ra,0x0
    80001678:	ebc080e7          	jalr	-324(ra) # 80001530 <_ZN7AVLTree12leftRotationEPS_>
    8000167c:	00050913          	mv	s2,a0
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    80001680:	0304b703          	ld	a4,48(s1)
    80001684:	03053783          	ld	a5,48(a0)
    80001688:	00f77e63          	bgeu	a4,a5,800016a4 <_ZN7AVLTree7balanceEPS_+0xa0>
    8000168c:	00a4b423          	sd	a0,8(s1)
            cur = AVLTree::rightRotation(cur);
    80001690:	00048513          	mv	a0,s1
    80001694:	00000097          	auipc	ra,0x0
    80001698:	e10080e7          	jalr	-496(ra) # 800014a4 <_ZN7AVLTree13rightRotationEPS_>
    8000169c:	00050493          	mv	s1,a0
    800016a0:	0f80006f          	j	80001798 <_ZN7AVLTree7balanceEPS_+0x194>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016a4:	00a4b023          	sd	a0,0(s1)
    800016a8:	fe9ff06f          	j	80001690 <_ZN7AVLTree7balanceEPS_+0x8c>
        }else if (curBalance < -1) {
            cur = AVLTree::rightRotation(cur);
    800016ac:	00048513          	mv	a0,s1
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	df4080e7          	jalr	-524(ra) # 800014a4 <_ZN7AVLTree13rightRotationEPS_>
    800016b8:	00050493          	mv	s1,a0
    800016bc:	0dc0006f          	j	80001798 <_ZN7AVLTree7balanceEPS_+0x194>
        }
        if (curBalance > 1 && prevBalance * curBalance < 0) {
            prev = AVLTree::rightRotation(prev);
    800016c0:	00090513          	mv	a0,s2
    800016c4:	00000097          	auipc	ra,0x0
    800016c8:	de0080e7          	jalr	-544(ra) # 800014a4 <_ZN7AVLTree13rightRotationEPS_>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016cc:	0304b703          	ld	a4,48(s1)
    800016d0:	03053783          	ld	a5,48(a0)
    800016d4:	00f77e63          	bgeu	a4,a5,800016f0 <_ZN7AVLTree7balanceEPS_+0xec>
    800016d8:	00a4b423          	sd	a0,8(s1)
            cur = AVLTree::leftRotation(cur);
    800016dc:	00048513          	mv	a0,s1
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	e50080e7          	jalr	-432(ra) # 80001530 <_ZN7AVLTree12leftRotationEPS_>
    800016e8:	00050913          	mv	s2,a0
    800016ec:	0c80006f          	j	800017b4 <_ZN7AVLTree7balanceEPS_+0x1b0>
            ((cur->sz < prev->sz) ? cur->right : cur->left) = prev;
    800016f0:	00a4b023          	sd	a0,0(s1)
    800016f4:	fe9ff06f          	j	800016dc <_ZN7AVLTree7balanceEPS_+0xd8>
        }else if (curBalance > 1) {
            cur = AVLTree::leftRotation(cur);
    800016f8:	00048513          	mv	a0,s1
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	e34080e7          	jalr	-460(ra) # 80001530 <_ZN7AVLTree12leftRotationEPS_>
    80001704:	00050913          	mv	s2,a0
    80001708:	0ac0006f          	j	800017b4 <_ZN7AVLTree7balanceEPS_+0x1b0>
        }

        if (oldCurParent) ((oldCurParent->sz < cur->sz) ? oldCurParent->right : oldCurParent->left) = cur;
    8000170c:	012b3023          	sd	s2,0(s6)

        prev = cur;
        cur = cur->parent;
    80001710:	01093483          	ld	s1,16(s2)
    while(cur) {
    80001714:	0a048c63          	beqz	s1,800017cc <_ZN7AVLTree7balanceEPS_+0x1c8>
        cur->height = 1 + max(cur->left, cur->right);
    80001718:	0004ba03          	ld	s4,0(s1)
    8000171c:	0084b983          	ld	s3,8(s1)
    80001720:	00098593          	mv	a1,s3
    80001724:	000a0513          	mv	a0,s4
    80001728:	00000097          	auipc	ra,0x0
    8000172c:	cec080e7          	jalr	-788(ra) # 80001414 <_ZN7AVLTree3maxEPKS_S1_>
    80001730:	0015051b          	addiw	a0,a0,1
    80001734:	02a4ac23          	sw	a0,56(s1)
    return (node && node->right ? 1+node->right->height : 0) - (node && node->left ? 1+node->left->height : 0);
    80001738:	f00980e3          	beqz	s3,80001638 <_ZN7AVLTree7balanceEPS_+0x34>
    8000173c:	0389a983          	lw	s3,56(s3)
    80001740:	0019899b          	addiw	s3,s3,1
    80001744:	ee0a0ee3          	beqz	s4,80001640 <_ZN7AVLTree7balanceEPS_+0x3c>
    80001748:	038a2783          	lw	a5,56(s4)
    8000174c:	0017879b          	addiw	a5,a5,1
    80001750:	40f989bb          	subw	s3,s3,a5
    80001754:	00098a9b          	sext.w	s5,s3
    80001758:	ee0908e3          	beqz	s2,80001648 <_ZN7AVLTree7balanceEPS_+0x44>
    8000175c:	00893783          	ld	a5,8(s2)
    80001760:	ee0788e3          	beqz	a5,80001650 <_ZN7AVLTree7balanceEPS_+0x4c>
    80001764:	0387aa03          	lw	s4,56(a5)
    80001768:	001a0a1b          	addiw	s4,s4,1
    8000176c:	ee0906e3          	beqz	s2,80001658 <_ZN7AVLTree7balanceEPS_+0x54>
    80001770:	00093783          	ld	a5,0(s2)
    80001774:	ee0786e3          	beqz	a5,80001660 <_ZN7AVLTree7balanceEPS_+0x5c>
    80001778:	0387a783          	lw	a5,56(a5)
    8000177c:	0017879b          	addiw	a5,a5,1
    80001780:	40fa0a3b          	subw	s4,s4,a5
        AVLTree* oldCurParent = cur->parent;
    80001784:	0104bb03          	ld	s6,16(s1)
        if (curBalance < -1 && prevBalance * curBalance < 0) {
    80001788:	fff00793          	li	a5,-1
    8000178c:	ecfacee3          	blt	s5,a5,80001668 <_ZN7AVLTree7balanceEPS_+0x64>
        }else if (curBalance < -1) {
    80001790:	fff00793          	li	a5,-1
    80001794:	f0facce3          	blt	s5,a5,800016ac <_ZN7AVLTree7balanceEPS_+0xa8>
        if (curBalance > 1 && prevBalance * curBalance < 0) {
    80001798:	00100793          	li	a5,1
    8000179c:	0157d663          	bge	a5,s5,800017a8 <_ZN7AVLTree7balanceEPS_+0x1a4>
    800017a0:	033a09bb          	mulw	s3,s4,s3
    800017a4:	f009cee3          	bltz	s3,800016c0 <_ZN7AVLTree7balanceEPS_+0xbc>
        }else if (curBalance > 1) {
    800017a8:	00100793          	li	a5,1
    800017ac:	f557c6e3          	blt	a5,s5,800016f8 <_ZN7AVLTree7balanceEPS_+0xf4>
    800017b0:	00048913          	mv	s2,s1
        if (oldCurParent) ((oldCurParent->sz < cur->sz) ? oldCurParent->right : oldCurParent->left) = cur;
    800017b4:	f40b0ee3          	beqz	s6,80001710 <_ZN7AVLTree7balanceEPS_+0x10c>
    800017b8:	030b3703          	ld	a4,48(s6)
    800017bc:	03093783          	ld	a5,48(s2)
    800017c0:	f4f776e3          	bgeu	a4,a5,8000170c <_ZN7AVLTree7balanceEPS_+0x108>
    800017c4:	012b3423          	sd	s2,8(s6)
    800017c8:	f49ff06f          	j	80001710 <_ZN7AVLTree7balanceEPS_+0x10c>
    }
    return prev;
}
    800017cc:	00090513          	mv	a0,s2
    800017d0:	03813083          	ld	ra,56(sp)
    800017d4:	03013403          	ld	s0,48(sp)
    800017d8:	02813483          	ld	s1,40(sp)
    800017dc:	02013903          	ld	s2,32(sp)
    800017e0:	01813983          	ld	s3,24(sp)
    800017e4:	01013a03          	ld	s4,16(sp)
    800017e8:	00813a83          	ld	s5,8(sp)
    800017ec:	00013b03          	ld	s6,0(sp)
    800017f0:	04010113          	addi	sp,sp,64
    800017f4:	00008067          	ret

00000000800017f8 <_ZN7AVLTree6insertEPS_S0_>:
    if (!root) {
    800017f8:	08050663          	beqz	a0,80001884 <_ZN7AVLTree6insertEPS_S0_+0x8c>
    800017fc:	00050613          	mv	a2,a0
    AVLTree* cur = root, *prev = nullptr;
    80001800:	00050793          	mv	a5,a0
    80001804:	00000513          	li	a0,0
    80001808:	01c0006f          	j	80001824 <_ZN7AVLTree6insertEPS_S0_+0x2c>
            cur->sameSize = node;
    8000180c:	00b7bc23          	sd	a1,24(a5)
            return root;
    80001810:	00060513          	mv	a0,a2
    80001814:	00008067          	ret
            cur = cur->left;
    80001818:	0007b703          	ld	a4,0(a5)
AVLTree* AVLTree::insert(AVLTree *root, AVLTree *node) {
    8000181c:	00078513          	mv	a0,a5
    80001820:	00070793          	mv	a5,a4
    while(cur) {
    80001824:	00078e63          	beqz	a5,80001840 <_ZN7AVLTree6insertEPS_S0_+0x48>
        if (node->sz == cur->sz) {
    80001828:	0305b683          	ld	a3,48(a1)
    8000182c:	0307b703          	ld	a4,48(a5)
    80001830:	fce68ee3          	beq	a3,a4,8000180c <_ZN7AVLTree6insertEPS_S0_+0x14>
        if (node->sz > cur->sz)
    80001834:	fed772e3          	bgeu	a4,a3,80001818 <_ZN7AVLTree6insertEPS_S0_+0x20>
            cur = cur->right;
    80001838:	0087b703          	ld	a4,8(a5)
    8000183c:	fe1ff06f          	j	8000181c <_ZN7AVLTree6insertEPS_S0_+0x24>
AVLTree* AVLTree::insert(AVLTree *root, AVLTree *node) {
    80001840:	ff010113          	addi	sp,sp,-16
    80001844:	00113423          	sd	ra,8(sp)
    80001848:	00813023          	sd	s0,0(sp)
    8000184c:	01010413          	addi	s0,sp,16
    (node->sz > prev->sz ? prev->right : prev->left) = node;
    80001850:	0305b703          	ld	a4,48(a1)
    80001854:	03053783          	ld	a5,48(a0)
    80001858:	02e7f263          	bgeu	a5,a4,8000187c <_ZN7AVLTree6insertEPS_S0_+0x84>
    8000185c:	00b53423          	sd	a1,8(a0)
    node->parent = prev;
    80001860:	00a5b823          	sd	a0,16(a1)
    return AVLTree::balance(cur);
    80001864:	00000097          	auipc	ra,0x0
    80001868:	da0080e7          	jalr	-608(ra) # 80001604 <_ZN7AVLTree7balanceEPS_>
}
    8000186c:	00813083          	ld	ra,8(sp)
    80001870:	00013403          	ld	s0,0(sp)
    80001874:	01010113          	addi	sp,sp,16
    80001878:	00008067          	ret
    (node->sz > prev->sz ? prev->right : prev->left) = node;
    8000187c:	00b53023          	sd	a1,0(a0)
    80001880:	fe1ff06f          	j	80001860 <_ZN7AVLTree6insertEPS_S0_+0x68>
        return node;
    80001884:	00058513          	mv	a0,a1
}
    80001888:	00008067          	ret

000000008000188c <_ZN7AVLTree6removeEPS_S0_>:
AVLTree* AVLTree::remove(AVLTree* root, AVLTree* node) {
    8000188c:	fd010113          	addi	sp,sp,-48
    80001890:	02113423          	sd	ra,40(sp)
    80001894:	02813023          	sd	s0,32(sp)
    80001898:	00913c23          	sd	s1,24(sp)
    8000189c:	01213823          	sd	s2,16(sp)
    800018a0:	01313423          	sd	s3,8(sp)
    800018a4:	03010413          	addi	s0,sp,48
    800018a8:	00050913          	mv	s2,a0
    if (!root) return nullptr;
    800018ac:	04050c63          	beqz	a0,80001904 <_ZN7AVLTree6removeEPS_S0_+0x78>
    800018b0:	00058493          	mv	s1,a1
    if (!node || !contains(root, node)) return root;
    800018b4:	04058863          	beqz	a1,80001904 <_ZN7AVLTree6removeEPS_S0_+0x78>
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	d04080e7          	jalr	-764(ra) # 800015bc <_ZN7AVLTree8containsEPKS_S1_>
    800018c0:	04050263          	beqz	a0,80001904 <_ZN7AVLTree6removeEPS_S0_+0x78>
    if (node->sameSize) {
    800018c4:	0184b783          	ld	a5,24(s1)
    800018c8:	06078263          	beqz	a5,8000192c <_ZN7AVLTree6removeEPS_S0_+0xa0>
    return (node->parent && node->parent->right == node);
    800018cc:	0104b703          	ld	a4,16(s1)
    800018d0:	00070663          	beqz	a4,800018dc <_ZN7AVLTree6removeEPS_S0_+0x50>
    800018d4:	00873683          	ld	a3,8(a4)
    800018d8:	04d48663          	beq	s1,a3,80001924 <_ZN7AVLTree6removeEPS_S0_+0x98>
        (isRightSon(node) ? node->parent->right : node->parent->left) = node->sameSize;
    800018dc:	00f73023          	sd	a5,0(a4)
        node->sameSize->right = node->right;
    800018e0:	0184b783          	ld	a5,24(s1)
    800018e4:	0084b703          	ld	a4,8(s1)
    800018e8:	00e7b423          	sd	a4,8(a5)
        node->sameSize->left = node->left;
    800018ec:	0184b783          	ld	a5,24(s1)
    800018f0:	0004b703          	ld	a4,0(s1)
    800018f4:	00e7b023          	sd	a4,0(a5)
        node->sameSize->parent = node->parent;
    800018f8:	0184b783          	ld	a5,24(s1)
    800018fc:	0104b703          	ld	a4,16(s1)
    80001900:	00e7b823          	sd	a4,16(a5)
}
    80001904:	00090513          	mv	a0,s2
    80001908:	02813083          	ld	ra,40(sp)
    8000190c:	02013403          	ld	s0,32(sp)
    80001910:	01813483          	ld	s1,24(sp)
    80001914:	01013903          	ld	s2,16(sp)
    80001918:	00813983          	ld	s3,8(sp)
    8000191c:	03010113          	addi	sp,sp,48
    80001920:	00008067          	ret
        (isRightSon(node) ? node->parent->right : node->parent->left) = node->sameSize;
    80001924:	00f73423          	sd	a5,8(a4)
    80001928:	fb9ff06f          	j	800018e0 <_ZN7AVLTree6removeEPS_S0_+0x54>
    if (!node->left && !node->right) { // no children
    8000192c:	0004b783          	ld	a5,0(s1)
    80001930:	08078263          	beqz	a5,800019b4 <_ZN7AVLTree6removeEPS_S0_+0x128>
    } else if (!node->left || !node->right) { // one child
    80001934:	0a078663          	beqz	a5,800019e0 <_ZN7AVLTree6removeEPS_S0_+0x154>
    80001938:	0084b983          	ld	s3,8(s1)
    8000193c:	0a098263          	beqz	s3,800019e0 <_ZN7AVLTree6removeEPS_S0_+0x154>
        AVLTree* swap = findSuccessor(node);
    80001940:	00048513          	mv	a0,s1
    80001944:	00000097          	auipc	ra,0x0
    80001948:	b28080e7          	jalr	-1240(ra) # 8000146c <_ZN7AVLTree13findSuccessorEPS_>
    8000194c:	00050793          	mv	a5,a0
        if (swap == node->right) {
    80001950:	10a98063          	beq	s3,a0,80001a50 <_ZN7AVLTree6removeEPS_S0_+0x1c4>
            updateFrom = swap->parent; // updating starts from swapped node
    80001954:	01053503          	ld	a0,16(a0)
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001958:	00990c63          	beq	s2,s1,80001970 <_ZN7AVLTree6removeEPS_S0_+0xe4>
    return (node->parent && node->parent->right == node);
    8000195c:	0104b703          	ld	a4,16(s1)
    80001960:	00070663          	beqz	a4,8000196c <_ZN7AVLTree6removeEPS_S0_+0xe0>
    80001964:	00873683          	ld	a3,8(a4)
    80001968:	12d48863          	beq	s1,a3,80001a98 <_ZN7AVLTree6removeEPS_S0_+0x20c>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    8000196c:	00f73023          	sd	a5,0(a4)
            node->left->parent = swap;
    80001970:	0004b703          	ld	a4,0(s1)
    80001974:	00f73823          	sd	a5,16(a4)
            node->right->parent = swap;
    80001978:	0084b703          	ld	a4,8(s1)
    8000197c:	00f73823          	sd	a5,16(a4)
            swap->parent->left = swap->right;
    80001980:	0107b683          	ld	a3,16(a5)
    80001984:	0087b703          	ld	a4,8(a5)
    80001988:	00e6b023          	sd	a4,0(a3)
            if (swap->right) swap->right->parent = swap->parent;
    8000198c:	00070663          	beqz	a4,80001998 <_ZN7AVLTree6removeEPS_S0_+0x10c>
    80001990:	0107b683          	ld	a3,16(a5)
    80001994:	00d73823          	sd	a3,16(a4)
            swap->left = node->left;
    80001998:	0004b703          	ld	a4,0(s1)
    8000199c:	00e7b023          	sd	a4,0(a5)
            swap->right = node->right;
    800019a0:	0084b703          	ld	a4,8(s1)
    800019a4:	00e7b423          	sd	a4,8(a5)
            swap->parent = node->parent;
    800019a8:	0104b703          	ld	a4,16(s1)
    800019ac:	00e7b823          	sd	a4,16(a5)
    800019b0:	0580006f          	j	80001a08 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    if (!node->left && !node->right) { // no children
    800019b4:	0084b703          	ld	a4,8(s1)
    800019b8:	f6071ee3          	bnez	a4,80001934 <_ZN7AVLTree6removeEPS_S0_+0xa8>
        updateFrom = node->parent;
    800019bc:	0104b503          	ld	a0,16(s1)
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = nullptr;
    800019c0:	04990463          	beq	s2,s1,80001a08 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    return (node->parent && node->parent->right == node);
    800019c4:	00050663          	beqz	a0,800019d0 <_ZN7AVLTree6removeEPS_S0_+0x144>
    800019c8:	00853783          	ld	a5,8(a0)
    800019cc:	00f48663          	beq	s1,a5,800019d8 <_ZN7AVLTree6removeEPS_S0_+0x14c>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = nullptr;
    800019d0:	00053023          	sd	zero,0(a0)
    800019d4:	0340006f          	j	80001a08 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    800019d8:	00053423          	sd	zero,8(a0)
    800019dc:	02c0006f          	j	80001a08 <_ZN7AVLTree6removeEPS_S0_+0x17c>
        updateFrom = node->parent;
    800019e0:	0104b503          	ld	a0,16(s1)
        if (node == root) {updateFrom = (node->left) ? node->left : node->right; updateFrom->parent = nullptr;}
    800019e4:	02990a63          	beq	s2,s1,80001a18 <_ZN7AVLTree6removeEPS_S0_+0x18c>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    800019e8:	02990063          	beq	s2,s1,80001a08 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    return (node->parent && node->parent->right == node);
    800019ec:	0104b783          	ld	a5,16(s1)
    800019f0:	00078663          	beqz	a5,800019fc <_ZN7AVLTree6removeEPS_S0_+0x170>
    800019f4:	0087b703          	ld	a4,8(a5)
    800019f8:	02e48c63          	beq	s1,a4,80001a30 <_ZN7AVLTree6removeEPS_S0_+0x1a4>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    800019fc:	0084b703          	ld	a4,8(s1)
    80001a00:	04070463          	beqz	a4,80001a48 <_ZN7AVLTree6removeEPS_S0_+0x1bc>
    80001a04:	00e7b023          	sd	a4,0(a5)
    return AVLTree::balance(updateFrom);
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	bfc080e7          	jalr	-1028(ra) # 80001604 <_ZN7AVLTree7balanceEPS_>
    80001a10:	00050913          	mv	s2,a0
    80001a14:	ef1ff06f          	j	80001904 <_ZN7AVLTree6removeEPS_S0_+0x78>
        if (node == root) {updateFrom = (node->left) ? node->left : node->right; updateFrom->parent = nullptr;}
    80001a18:	00078863          	beqz	a5,80001a28 <_ZN7AVLTree6removeEPS_S0_+0x19c>
    80001a1c:	0007b823          	sd	zero,16(a5)
    80001a20:	00078513          	mv	a0,a5
    80001a24:	fc5ff06f          	j	800019e8 <_ZN7AVLTree6removeEPS_S0_+0x15c>
    80001a28:	0084b783          	ld	a5,8(s1)
    80001a2c:	ff1ff06f          	j	80001a1c <_ZN7AVLTree6removeEPS_S0_+0x190>
        if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = ((node->right) ? node->right : node->left);
    80001a30:	0084b703          	ld	a4,8(s1)
    80001a34:	00070663          	beqz	a4,80001a40 <_ZN7AVLTree6removeEPS_S0_+0x1b4>
    80001a38:	00e7b423          	sd	a4,8(a5)
    80001a3c:	fcdff06f          	j	80001a08 <_ZN7AVLTree6removeEPS_S0_+0x17c>
    80001a40:	0004b703          	ld	a4,0(s1)
    80001a44:	ff5ff06f          	j	80001a38 <_ZN7AVLTree6removeEPS_S0_+0x1ac>
    80001a48:	0004b703          	ld	a4,0(s1)
    80001a4c:	fb9ff06f          	j	80001a04 <_ZN7AVLTree6removeEPS_S0_+0x178>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a50:	00990c63          	beq	s2,s1,80001a68 <_ZN7AVLTree6removeEPS_S0_+0x1dc>
    return (node->parent && node->parent->right == node);
    80001a54:	0104b703          	ld	a4,16(s1)
    80001a58:	00070663          	beqz	a4,80001a64 <_ZN7AVLTree6removeEPS_S0_+0x1d8>
    80001a5c:	00873683          	ld	a3,8(a4)
    80001a60:	02d48863          	beq	s1,a3,80001a90 <_ZN7AVLTree6removeEPS_S0_+0x204>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a64:	00f73023          	sd	a5,0(a4)
            node->right->parent = nullptr;
    80001a68:	0084b703          	ld	a4,8(s1)
    80001a6c:	00073823          	sd	zero,16(a4)
            node->left->parent = swap;
    80001a70:	0004b703          	ld	a4,0(s1)
    80001a74:	00f73823          	sd	a5,16(a4)
            swap->left = node->left;
    80001a78:	0004b703          	ld	a4,0(s1)
    80001a7c:	00e7b023          	sd	a4,0(a5)
            swap->parent = node->parent;
    80001a80:	0104b703          	ld	a4,16(s1)
    80001a84:	00e7b823          	sd	a4,16(a5)
            updateFrom = swap;
    80001a88:	00078513          	mv	a0,a5
    80001a8c:	f7dff06f          	j	80001a08 <_ZN7AVLTree6removeEPS_S0_+0x17c>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a90:	00a73423          	sd	a0,8(a4)
    80001a94:	fd5ff06f          	j	80001a68 <_ZN7AVLTree6removeEPS_S0_+0x1dc>
            if (node != root) (isRightSon(node) ? node->parent->right : node->parent->left) = swap;
    80001a98:	00f73423          	sd	a5,8(a4)
    80001a9c:	ed5ff06f          	j	80001970 <_ZN7AVLTree6removeEPS_S0_+0xe4>

0000000080001aa0 <_ZN7AVLTree6swapLLEPS_S0_S0_>:

AVLTree *AVLTree::swapLL(AVLTree *toSwap, AVLTree *swap, AVLTree* root) {
    80001aa0:	ff010113          	addi	sp,sp,-16
    80001aa4:	00813423          	sd	s0,8(sp)
    80001aa8:	01010413          	addi	s0,sp,16
    80001aac:	00050793          	mv	a5,a0
    80001ab0:	00060513          	mv	a0,a2
    if (!toSwap || !swap || !root || toSwap == swap)
    80001ab4:	02078863          	beqz	a5,80001ae4 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001ab8:	02058663          	beqz	a1,80001ae4 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001abc:	02060463          	beqz	a2,80001ae4 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
    80001ac0:	02b78263          	beq	a5,a1,80001ae4 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>
        return root;

    if (toSwap == root) {
    80001ac4:	02c78663          	beq	a5,a2,80001af0 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x50>
        swap->prev = nullptr;
        if (root->next) root->next->prev = swap;
        return swap;
    }

    AVLTree* prevNode = toSwap->prev;
    80001ac8:	0287b703          	ld	a4,40(a5)
    AVLTree* nextNode = toSwap->next;
    80001acc:	0207b783          	ld	a5,32(a5)
    prevNode->next = swap;
    80001ad0:	02b73023          	sd	a1,32(a4)
    swap->prev = prevNode;
    80001ad4:	02e5b423          	sd	a4,40(a1)
    if (nextNode) nextNode->prev = swap;
    80001ad8:	00078463          	beqz	a5,80001ae0 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x40>
    80001adc:	02b7b423          	sd	a1,40(a5)
    swap->next = nextNode;
    80001ae0:	02f5b023          	sd	a5,32(a1)

    return root;

}
    80001ae4:	00813403          	ld	s0,8(sp)
    80001ae8:	01010113          	addi	sp,sp,16
    80001aec:	00008067          	ret
        swap->next = root->next;
    80001af0:	02063783          	ld	a5,32(a2)
    80001af4:	02f5b023          	sd	a5,32(a1)
        swap->prev = nullptr;
    80001af8:	0205b423          	sd	zero,40(a1)
        if (root->next) root->next->prev = swap;
    80001afc:	02063783          	ld	a5,32(a2)
    80001b00:	00078463          	beqz	a5,80001b08 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x68>
    80001b04:	02b7b423          	sd	a1,40(a5)
        return swap;
    80001b08:	00058513          	mv	a0,a1
    80001b0c:	fd9ff06f          	j	80001ae4 <_ZN7AVLTree6swapLLEPS_S0_S0_+0x44>

0000000080001b10 <_ZN7AVLTree8removeLLEPS_S0_>:

AVLTree *AVLTree::removeLL(AVLTree *toRem, AVLTree *root) {
    80001b10:	ff010113          	addi	sp,sp,-16
    80001b14:	00813423          	sd	s0,8(sp)
    80001b18:	01010413          	addi	s0,sp,16
    80001b1c:	00050793          	mv	a5,a0
    if (!root) return toRem;
    80001b20:	02058263          	beqz	a1,80001b44 <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    80001b24:	00058513          	mv	a0,a1
    if (!toRem) return root;
    80001b28:	00078e63          	beqz	a5,80001b44 <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    if (root == toRem) {
    80001b2c:	02f58263          	beq	a1,a5,80001b50 <_ZN7AVLTree8removeLLEPS_S0_+0x40>
        root = root->next;
        if (root) root->prev = nullptr;
        return root;
    }
    AVLTree* prevNode = toRem->prev;
    80001b30:	0287b703          	ld	a4,40(a5)
    AVLTree* nextNode = toRem->next;
    80001b34:	0207b783          	ld	a5,32(a5)
    prevNode->next = nextNode;
    80001b38:	02f73023          	sd	a5,32(a4)
    if (nextNode)
    80001b3c:	00078463          	beqz	a5,80001b44 <_ZN7AVLTree8removeLLEPS_S0_+0x34>
        nextNode->prev = prevNode;
    80001b40:	02e7b423          	sd	a4,40(a5)

    return root;
}
    80001b44:	00813403          	ld	s0,8(sp)
    80001b48:	01010113          	addi	sp,sp,16
    80001b4c:	00008067          	ret
        root = root->next;
    80001b50:	0205b503          	ld	a0,32(a1)
        if (root) root->prev = nullptr;
    80001b54:	fe0508e3          	beqz	a0,80001b44 <_ZN7AVLTree8removeLLEPS_S0_+0x34>
    80001b58:	02053423          	sd	zero,40(a0)
        return root;
    80001b5c:	fe9ff06f          	j	80001b44 <_ZN7AVLTree8removeLLEPS_S0_+0x34>

0000000080001b60 <_ZN7AVLTree15findPredecessorEPS_>:

AVLTree *AVLTree::findPredecessor(AVLTree *node) {
    80001b60:	ff010113          	addi	sp,sp,-16
    80001b64:	00813423          	sd	s0,8(sp)
    80001b68:	01010413          	addi	s0,sp,16
    if (!node || !node->left) return nullptr;
    80001b6c:	00050c63          	beqz	a0,80001b84 <_ZN7AVLTree15findPredecessorEPS_+0x24>
    80001b70:	00053783          	ld	a5,0(a0)
    80001b74:	00078e63          	beqz	a5,80001b90 <_ZN7AVLTree15findPredecessorEPS_+0x30>
    node = node->left;
    while(node->right)
    80001b78:	00078513          	mv	a0,a5
    80001b7c:	0087b783          	ld	a5,8(a5)
    80001b80:	fe079ce3          	bnez	a5,80001b78 <_ZN7AVLTree15findPredecessorEPS_+0x18>
        node = node->right;
    return node;
}
    80001b84:	00813403          	ld	s0,8(sp)
    80001b88:	01010113          	addi	sp,sp,16
    80001b8c:	00008067          	ret
    if (!node || !node->left) return nullptr;
    80001b90:	00078513          	mv	a0,a5
    80001b94:	ff1ff06f          	j	80001b84 <_ZN7AVLTree15findPredecessorEPS_+0x24>

0000000080001b98 <_ZN7AVLTree8insertLLEPS_S0_>:

AVLTree *AVLTree::insertLL(AVLTree *toInsert, AVLTree *root) {
    80001b98:	ff010113          	addi	sp,sp,-16
    80001b9c:	00813423          	sd	s0,8(sp)
    80001ba0:	01010413          	addi	s0,sp,16
    if (!toInsert) return root;
    80001ba4:	04050c63          	beqz	a0,80001bfc <_ZN7AVLTree8insertLLEPS_S0_+0x64>
    if (!root || toInsert < root) {
    80001ba8:	04058063          	beqz	a1,80001be8 <_ZN7AVLTree8insertLLEPS_S0_+0x50>
    80001bac:	02b56e63          	bltu	a0,a1,80001be8 <_ZN7AVLTree8insertLLEPS_S0_+0x50>
        toInsert->prev = nullptr;
        if (root) root->prev = toInsert;
        return toInsert;
    }

    AVLTree* cur = root;
    80001bb0:	00058793          	mv	a5,a1
    for (; cur->next && (cur->next < toInsert); cur = cur->next);
    80001bb4:	00078713          	mv	a4,a5
    80001bb8:	0207b783          	ld	a5,32(a5)
    80001bbc:	00078463          	beqz	a5,80001bc4 <_ZN7AVLTree8insertLLEPS_S0_+0x2c>
    80001bc0:	fea7eae3          	bltu	a5,a0,80001bb4 <_ZN7AVLTree8insertLLEPS_S0_+0x1c>

    toInsert->next = cur->next;
    80001bc4:	02f53023          	sd	a5,32(a0)
    if(cur->next) cur->next->prev = toInsert;
    80001bc8:	00078463          	beqz	a5,80001bd0 <_ZN7AVLTree8insertLLEPS_S0_+0x38>
    80001bcc:	02a7b423          	sd	a0,40(a5)
    cur->next = toInsert;
    80001bd0:	02a73023          	sd	a0,32(a4)
    toInsert->prev = cur;
    80001bd4:	02e53423          	sd	a4,40(a0)

    return root;
    80001bd8:	00058513          	mv	a0,a1
}
    80001bdc:	00813403          	ld	s0,8(sp)
    80001be0:	01010113          	addi	sp,sp,16
    80001be4:	00008067          	ret
        toInsert->next = root;
    80001be8:	02b53023          	sd	a1,32(a0)
        toInsert->prev = nullptr;
    80001bec:	02053423          	sd	zero,40(a0)
        if (root) root->prev = toInsert;
    80001bf0:	fe0586e3          	beqz	a1,80001bdc <_ZN7AVLTree8insertLLEPS_S0_+0x44>
    80001bf4:	02a5b423          	sd	a0,40(a1)
        return toInsert;
    80001bf8:	fe5ff06f          	j	80001bdc <_ZN7AVLTree8insertLLEPS_S0_+0x44>
    if (!toInsert) return root;
    80001bfc:	00058513          	mv	a0,a1
    80001c00:	fddff06f          	j	80001bdc <_ZN7AVLTree8insertLLEPS_S0_+0x44>

0000000080001c04 <_ZN5RiscV10popSppSpieEv>:
//

#include "../h/RiscV.h"


void RiscV::popSppSpie() {
    80001c04:	ff010113          	addi	sp,sp,-16
    80001c08:	00813423          	sd	s0,8(sp)
    80001c0c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80001c10:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80001c14:	10200073          	sret
}
    80001c18:	00813403          	ld	s0,8(sp)
    80001c1c:	01010113          	addi	sp,sp,16
    80001c20:	00008067          	ret

0000000080001c24 <_ZN9Scheduler3getEv>:
//

#include "../h/Scheduler.h"


TCB *Scheduler::get() {
    80001c24:	ff010113          	addi	sp,sp,-16
    80001c28:	00113423          	sd	ra,8(sp)
    80001c2c:	00813023          	sd	s0,0(sp)
    80001c30:	01010413          	addi	s0,sp,16
    return readyQueue->pop();
    80001c34:	00053503          	ld	a0,0(a0)
    80001c38:	00000097          	auipc	ra,0x0
    80001c3c:	06c080e7          	jalr	108(ra) # 80001ca4 <_ZN5QueueI3TCBE3popEv>
}
    80001c40:	00813083          	ld	ra,8(sp)
    80001c44:	00013403          	ld	s0,0(sp)
    80001c48:	01010113          	addi	sp,sp,16
    80001c4c:	00008067          	ret

0000000080001c50 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB * data) {
    80001c50:	ff010113          	addi	sp,sp,-16
    80001c54:	00113423          	sd	ra,8(sp)
    80001c58:	00813023          	sd	s0,0(sp)
    80001c5c:	01010413          	addi	s0,sp,16
    readyQueue->push(data);
    80001c60:	00053503          	ld	a0,0(a0)
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	114080e7          	jalr	276(ra) # 80001d78 <_ZN5QueueI3TCBE4pushEPS0_>
}
    80001c6c:	00813083          	ld	ra,8(sp)
    80001c70:	00013403          	ld	s0,0(sp)
    80001c74:	01010113          	addi	sp,sp,16
    80001c78:	00008067          	ret

0000000080001c7c <_ZN5QueueI3TCBE4NodedlEPv>:
    p->lastNodeAddr -= (uint64)sizeof(Node);
    return (void*)p->lastNodeAddr;
}

template<typename T>
void Queue<T>::Node::operator delete(void* p) {
    80001c7c:	ff010113          	addi	sp,sp,-16
    80001c80:	00113423          	sd	ra,8(sp)
    80001c84:	00813023          	sd	s0,0(sp)
    80001c88:	01010413          	addi	s0,sp,16
    // page won't be freed if pointer doesn't point to its beginning
    mem_free(p);
    80001c8c:	fffff097          	auipc	ra,0xfffff
    80001c90:	710080e7          	jalr	1808(ra) # 8000139c <_Z8mem_freePv>
}
    80001c94:	00813083          	ld	ra,8(sp)
    80001c98:	00013403          	ld	s0,0(sp)
    80001c9c:	01010113          	addi	sp,sp,16
    80001ca0:	00008067          	ret

0000000080001ca4 <_ZN5QueueI3TCBE3popEv>:
T *Queue<T>::pop() {
    80001ca4:	fe010113          	addi	sp,sp,-32
    80001ca8:	00113c23          	sd	ra,24(sp)
    80001cac:	00813823          	sd	s0,16(sp)
    80001cb0:	00913423          	sd	s1,8(sp)
    80001cb4:	02010413          	addi	s0,sp,32
    80001cb8:	00050793          	mv	a5,a0
    if(!head) return nullptr;
    80001cbc:	00853503          	ld	a0,8(a0)
    80001cc0:	04050063          	beqz	a0,80001d00 <_ZN5QueueI3TCBE3popEv+0x5c>
    T* data = node->data;
    80001cc4:	00853483          	ld	s1,8(a0)
    head = head->next;
    80001cc8:	00053703          	ld	a4,0(a0)
    80001ccc:	00e7b423          	sd	a4,8(a5)
    if (node == last)
    80001cd0:	0107b703          	ld	a4,16(a5)
    80001cd4:	02e50263          	beq	a0,a4,80001cf8 <_ZN5QueueI3TCBE3popEv+0x54>
    delete node;
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	fa4080e7          	jalr	-92(ra) # 80001c7c <_ZN5QueueI3TCBE4NodedlEPv>
}
    80001ce0:	00048513          	mv	a0,s1
    80001ce4:	01813083          	ld	ra,24(sp)
    80001ce8:	01013403          	ld	s0,16(sp)
    80001cec:	00813483          	ld	s1,8(sp)
    80001cf0:	02010113          	addi	sp,sp,32
    80001cf4:	00008067          	ret
        last = nullptr;
    80001cf8:	0007b823          	sd	zero,16(a5)
    80001cfc:	fddff06f          	j	80001cd8 <_ZN5QueueI3TCBE3popEv+0x34>
    if(!head) return nullptr;
    80001d00:	00050493          	mv	s1,a0
    80001d04:	fddff06f          	j	80001ce0 <_ZN5QueueI3TCBE3popEv+0x3c>

0000000080001d08 <_ZN5QueueI3TCBE4NodenwEmPS1_>:
void *Queue<T>::Node::operator new(size_t sz, Queue<T>* p) {
    80001d08:	fe010113          	addi	sp,sp,-32
    80001d0c:	00113c23          	sd	ra,24(sp)
    80001d10:	00813823          	sd	s0,16(sp)
    80001d14:	00913423          	sd	s1,8(sp)
    80001d18:	02010413          	addi	s0,sp,32
    if (sz > MEM_BLOCK_SIZE)
    80001d1c:	04000793          	li	a5,64
    80001d20:	02a7ea63          	bltu	a5,a0,80001d54 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x4c>
    80001d24:	00058493          	mv	s1,a1
    if (p->lastNodeAddr % MEM_BLOCK_SIZE == 0) {
    80001d28:	0005b783          	ld	a5,0(a1)
    80001d2c:	03f7f793          	andi	a5,a5,63
    80001d30:	02078863          	beqz	a5,80001d60 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x58>
    p->lastNodeAddr -= (uint64)sizeof(Node);
    80001d34:	0004b503          	ld	a0,0(s1)
    80001d38:	ff050513          	addi	a0,a0,-16
    80001d3c:	00a4b023          	sd	a0,0(s1)
}
    80001d40:	01813083          	ld	ra,24(sp)
    80001d44:	01013403          	ld	s0,16(sp)
    80001d48:	00813483          	ld	s1,8(sp)
    80001d4c:	02010113          	addi	sp,sp,32
    80001d50:	00008067          	ret
        return mem_alloc(sz);
    80001d54:	fffff097          	auipc	ra,0xfffff
    80001d58:	614080e7          	jalr	1556(ra) # 80001368 <_Z9mem_allocm>
    80001d5c:	fe5ff06f          	j	80001d40 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x38>
        void* ptr = mem_alloc(MEM_BLOCK_SIZE);
    80001d60:	04000513          	li	a0,64
    80001d64:	fffff097          	auipc	ra,0xfffff
    80001d68:	604080e7          	jalr	1540(ra) # 80001368 <_Z9mem_allocm>
        p->lastNodeAddr = (uint64) ptr + MEM_BLOCK_SIZE;
    80001d6c:	04050513          	addi	a0,a0,64
    80001d70:	00a4b023          	sd	a0,0(s1)
    80001d74:	fc1ff06f          	j	80001d34 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x2c>

0000000080001d78 <_ZN5QueueI3TCBE4pushEPS0_>:
void Queue<T>::push(T *data) {
    80001d78:	fe010113          	addi	sp,sp,-32
    80001d7c:	00113c23          	sd	ra,24(sp)
    80001d80:	00813823          	sd	s0,16(sp)
    80001d84:	00913423          	sd	s1,8(sp)
    80001d88:	01213023          	sd	s2,0(sp)
    80001d8c:	02010413          	addi	s0,sp,32
    80001d90:	00050493          	mv	s1,a0
    80001d94:	00058913          	mv	s2,a1
    Node* node = new(this) Node();
    80001d98:	00050593          	mv	a1,a0
    80001d9c:	01000513          	li	a0,16
    80001da0:	00000097          	auipc	ra,0x0
    80001da4:	f68080e7          	jalr	-152(ra) # 80001d08 <_ZN5QueueI3TCBE4NodenwEmPS1_>
    80001da8:	00053023          	sd	zero,0(a0)
    node->data = data;
    80001dac:	01253423          	sd	s2,8(a0)
    if (!head) {
    80001db0:	0084b783          	ld	a5,8(s1)
    80001db4:	02078463          	beqz	a5,80001ddc <_ZN5QueueI3TCBE4pushEPS0_+0x64>
    last->next = node;
    80001db8:	0104b783          	ld	a5,16(s1)
    80001dbc:	00a7b023          	sd	a0,0(a5)
    last = node;
    80001dc0:	00a4b823          	sd	a0,16(s1)
}
    80001dc4:	01813083          	ld	ra,24(sp)
    80001dc8:	01013403          	ld	s0,16(sp)
    80001dcc:	00813483          	ld	s1,8(sp)
    80001dd0:	00013903          	ld	s2,0(sp)
    80001dd4:	02010113          	addi	sp,sp,32
    80001dd8:	00008067          	ret
        head = last = node;
    80001ddc:	00a4b823          	sd	a0,16(s1)
    80001de0:	00a4b423          	sd	a0,8(s1)
        return;
    80001de4:	fe1ff06f          	j	80001dc4 <_ZN5QueueI3TCBE4pushEPS0_+0x4c>

0000000080001de8 <main>:
    uint64 a = 0;
    explicit TCB(int k) : i(k) {}
};


int main() {
    80001de8:	fb010113          	addi	sp,sp,-80
    80001dec:	04113423          	sd	ra,72(sp)
    80001df0:	04813023          	sd	s0,64(sp)
    80001df4:	02913c23          	sd	s1,56(sp)
    80001df8:	03213823          	sd	s2,48(sp)
    80001dfc:	03313423          	sd	s3,40(sp)
    80001e00:	03413023          	sd	s4,32(sp)
    80001e04:	01513c23          	sd	s5,24(sp)
    80001e08:	01613823          	sd	s6,16(sp)
    80001e0c:	05010413          	addi	s0,sp,80

    RiscV::stvecW((uint64)&RiscV::setStvecTable | 0x01);
    80001e10:	fffff797          	auipc	a5,0xfffff
    80001e14:	1f078793          	addi	a5,a5,496 # 80001000 <_ZN5RiscV13setStvecTableEv>
    80001e18:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001e1c:	10579073          	csrw	stvec,a5

#include "Queue.h"

class TCB;

class Scheduler {
    80001e20:	01800513          	li	a0,24
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	27c080e7          	jalr	636(ra) # 800020a0 <_Znwm>
    80001e2c:	00053023          	sd	zero,0(a0)
    80001e30:	00053423          	sd	zero,8(a0)
    80001e34:	00053823          	sd	zero,16(a0)
    80001e38:	faa43c23          	sd	a0,-72(s0)

    Scheduler s;

    TCB* th1 = new TCB(55);
    80001e3c:	01800513          	li	a0,24
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	260080e7          	jalr	608(ra) # 800020a0 <_Znwm>
    80001e48:	00050b13          	mv	s6,a0
    explicit TCB(int k) : i(k) {}
    80001e4c:	03700793          	li	a5,55
    80001e50:	00f53023          	sd	a5,0(a0)
    80001e54:	00053423          	sd	zero,8(a0)
    80001e58:	00053823          	sd	zero,16(a0)
    TCB* th2 = new TCB(2);
    80001e5c:	01800513          	li	a0,24
    80001e60:	00000097          	auipc	ra,0x0
    80001e64:	240080e7          	jalr	576(ra) # 800020a0 <_Znwm>
    80001e68:	00050a93          	mv	s5,a0
    explicit TCB(int k) : i(k) {}
    80001e6c:	00200793          	li	a5,2
    80001e70:	00f53023          	sd	a5,0(a0)
    80001e74:	00053423          	sd	zero,8(a0)
    80001e78:	00053823          	sd	zero,16(a0)
    TCB* th3 = new TCB(3);
    80001e7c:	01800513          	li	a0,24
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	220080e7          	jalr	544(ra) # 800020a0 <_Znwm>
    80001e88:	00050a13          	mv	s4,a0
    explicit TCB(int k) : i(k) {}
    80001e8c:	00300793          	li	a5,3
    80001e90:	00f53023          	sd	a5,0(a0)
    80001e94:	00053423          	sd	zero,8(a0)
    80001e98:	00053823          	sd	zero,16(a0)
    TCB* th4 = new TCB(4);
    80001e9c:	01800513          	li	a0,24
    80001ea0:	00000097          	auipc	ra,0x0
    80001ea4:	200080e7          	jalr	512(ra) # 800020a0 <_Znwm>
    80001ea8:	00050993          	mv	s3,a0
    explicit TCB(int k) : i(k) {}
    80001eac:	00400793          	li	a5,4
    80001eb0:	00f53023          	sd	a5,0(a0)
    80001eb4:	00053423          	sd	zero,8(a0)
    80001eb8:	00053823          	sd	zero,16(a0)
    TCB* th5 = new TCB(5);
    80001ebc:	01800513          	li	a0,24
    80001ec0:	00000097          	auipc	ra,0x0
    80001ec4:	1e0080e7          	jalr	480(ra) # 800020a0 <_Znwm>
    80001ec8:	00050913          	mv	s2,a0
    explicit TCB(int k) : i(k) {}
    80001ecc:	00500793          	li	a5,5
    80001ed0:	00f53023          	sd	a5,0(a0)
    80001ed4:	00053423          	sd	zero,8(a0)
    80001ed8:	00053823          	sd	zero,16(a0)

    s.put(th1);
    80001edc:	000b0593          	mv	a1,s6
    80001ee0:	fb840493          	addi	s1,s0,-72
    80001ee4:	00048513          	mv	a0,s1
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	d68080e7          	jalr	-664(ra) # 80001c50 <_ZN9Scheduler3putEP3TCB>
    s.put(th2);
    80001ef0:	000a8593          	mv	a1,s5
    80001ef4:	00048513          	mv	a0,s1
    80001ef8:	00000097          	auipc	ra,0x0
    80001efc:	d58080e7          	jalr	-680(ra) # 80001c50 <_ZN9Scheduler3putEP3TCB>
    s.put(th3);
    80001f00:	000a0593          	mv	a1,s4
    80001f04:	00048513          	mv	a0,s1
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	d48080e7          	jalr	-696(ra) # 80001c50 <_ZN9Scheduler3putEP3TCB>
    s.put(th4);
    80001f10:	00098593          	mv	a1,s3
    80001f14:	00048513          	mv	a0,s1
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	d38080e7          	jalr	-712(ra) # 80001c50 <_ZN9Scheduler3putEP3TCB>
    s.put(th5);
    80001f20:	00090593          	mv	a1,s2
    80001f24:	00048513          	mv	a0,s1
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	d28080e7          	jalr	-728(ra) # 80001c50 <_ZN9Scheduler3putEP3TCB>

    __putc((char)(s.get()->i + '0')); __putc('\n');
    80001f30:	00048513          	mv	a0,s1
    80001f34:	00000097          	auipc	ra,0x0
    80001f38:	cf0080e7          	jalr	-784(ra) # 80001c24 <_ZN9Scheduler3getEv>
    80001f3c:	00053503          	ld	a0,0(a0)
    80001f40:	0305051b          	addiw	a0,a0,48
    80001f44:	0ff57513          	andi	a0,a0,255
    80001f48:	00002097          	auipc	ra,0x2
    80001f4c:	7e4080e7          	jalr	2020(ra) # 8000472c <__putc>
    80001f50:	00a00513          	li	a0,10
    80001f54:	00002097          	auipc	ra,0x2
    80001f58:	7d8080e7          	jalr	2008(ra) # 8000472c <__putc>
    __putc((char)(s.get()->i + '0')); __putc('\n');
    80001f5c:	00048513          	mv	a0,s1
    80001f60:	00000097          	auipc	ra,0x0
    80001f64:	cc4080e7          	jalr	-828(ra) # 80001c24 <_ZN9Scheduler3getEv>
    80001f68:	00053503          	ld	a0,0(a0)
    80001f6c:	0305051b          	addiw	a0,a0,48
    80001f70:	0ff57513          	andi	a0,a0,255
    80001f74:	00002097          	auipc	ra,0x2
    80001f78:	7b8080e7          	jalr	1976(ra) # 8000472c <__putc>
    80001f7c:	00a00513          	li	a0,10
    80001f80:	00002097          	auipc	ra,0x2
    80001f84:	7ac080e7          	jalr	1964(ra) # 8000472c <__putc>
    __putc((char)(s.get()->i + '0')); __putc('\n');
    80001f88:	00048513          	mv	a0,s1
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	c98080e7          	jalr	-872(ra) # 80001c24 <_ZN9Scheduler3getEv>
    80001f94:	00053503          	ld	a0,0(a0)
    80001f98:	0305051b          	addiw	a0,a0,48
    80001f9c:	0ff57513          	andi	a0,a0,255
    80001fa0:	00002097          	auipc	ra,0x2
    80001fa4:	78c080e7          	jalr	1932(ra) # 8000472c <__putc>
    80001fa8:	00a00513          	li	a0,10
    80001fac:	00002097          	auipc	ra,0x2
    80001fb0:	780080e7          	jalr	1920(ra) # 8000472c <__putc>
    __putc((char)(s.get()->i + '0')); __putc('\n');
    80001fb4:	00048513          	mv	a0,s1
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	c6c080e7          	jalr	-916(ra) # 80001c24 <_ZN9Scheduler3getEv>
    80001fc0:	00053503          	ld	a0,0(a0)
    80001fc4:	0305051b          	addiw	a0,a0,48
    80001fc8:	0ff57513          	andi	a0,a0,255
    80001fcc:	00002097          	auipc	ra,0x2
    80001fd0:	760080e7          	jalr	1888(ra) # 8000472c <__putc>
    80001fd4:	00a00513          	li	a0,10
    80001fd8:	00002097          	auipc	ra,0x2
    80001fdc:	754080e7          	jalr	1876(ra) # 8000472c <__putc>
    __putc((char)(s.get()->i + '0')); __putc('\n');
    80001fe0:	00048513          	mv	a0,s1
    80001fe4:	00000097          	auipc	ra,0x0
    80001fe8:	c40080e7          	jalr	-960(ra) # 80001c24 <_ZN9Scheduler3getEv>
    80001fec:	00053503          	ld	a0,0(a0)
    80001ff0:	0305051b          	addiw	a0,a0,48
    80001ff4:	0ff57513          	andi	a0,a0,255
    80001ff8:	00002097          	auipc	ra,0x2
    80001ffc:	734080e7          	jalr	1844(ra) # 8000472c <__putc>
    80002000:	00a00513          	li	a0,10
    80002004:	00002097          	auipc	ra,0x2
    80002008:	728080e7          	jalr	1832(ra) # 8000472c <__putc>


    delete th1;
    8000200c:	000b0863          	beqz	s6,8000201c <main+0x234>
    80002010:	000b0513          	mv	a0,s6
    80002014:	00000097          	auipc	ra,0x0
    80002018:	0dc080e7          	jalr	220(ra) # 800020f0 <_ZdlPv>
    delete th2;
    8000201c:	000a8863          	beqz	s5,8000202c <main+0x244>
    80002020:	000a8513          	mv	a0,s5
    80002024:	00000097          	auipc	ra,0x0
    80002028:	0cc080e7          	jalr	204(ra) # 800020f0 <_ZdlPv>
    delete th3;
    8000202c:	000a0863          	beqz	s4,8000203c <main+0x254>
    80002030:	000a0513          	mv	a0,s4
    80002034:	00000097          	auipc	ra,0x0
    80002038:	0bc080e7          	jalr	188(ra) # 800020f0 <_ZdlPv>
    delete th4;
    8000203c:	00098863          	beqz	s3,8000204c <main+0x264>
    80002040:	00098513          	mv	a0,s3
    80002044:	00000097          	auipc	ra,0x0
    80002048:	0ac080e7          	jalr	172(ra) # 800020f0 <_ZdlPv>
    delete th5;
    8000204c:	00090863          	beqz	s2,8000205c <main+0x274>
    80002050:	00090513          	mv	a0,s2
    80002054:	00000097          	auipc	ra,0x0
    80002058:	09c080e7          	jalr	156(ra) # 800020f0 <_ZdlPv>

    return 0;
}
    8000205c:	00000513          	li	a0,0
    80002060:	04813083          	ld	ra,72(sp)
    80002064:	04013403          	ld	s0,64(sp)
    80002068:	03813483          	ld	s1,56(sp)
    8000206c:	03013903          	ld	s2,48(sp)
    80002070:	02813983          	ld	s3,40(sp)
    80002074:	02013a03          	ld	s4,32(sp)
    80002078:	01813a83          	ld	s5,24(sp)
    8000207c:	01013b03          	ld	s6,16(sp)
    80002080:	05010113          	addi	sp,sp,80
    80002084:	00008067          	ret
    static void setStvecTable(){}
    80002088:	ff010113          	addi	sp,sp,-16
    8000208c:	00813423          	sd	s0,8(sp)
    80002090:	01010413          	addi	s0,sp,16
    80002094:	00813403          	ld	s0,8(sp)
    80002098:	01010113          	addi	sp,sp,16
    8000209c:	00008067          	ret

00000000800020a0 <_Znwm>:
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.h"

void *operator new(size_t n) {
    800020a0:	ff010113          	addi	sp,sp,-16
    800020a4:	00113423          	sd	ra,8(sp)
    800020a8:	00813023          	sd	s0,0(sp)
    800020ac:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    800020b0:	fffff097          	auipc	ra,0xfffff
    800020b4:	2b8080e7          	jalr	696(ra) # 80001368 <_Z9mem_allocm>
}
    800020b8:	00813083          	ld	ra,8(sp)
    800020bc:	00013403          	ld	s0,0(sp)
    800020c0:	01010113          	addi	sp,sp,16
    800020c4:	00008067          	ret

00000000800020c8 <_Znam>:

void *operator new[](size_t n) {
    800020c8:	ff010113          	addi	sp,sp,-16
    800020cc:	00113423          	sd	ra,8(sp)
    800020d0:	00813023          	sd	s0,0(sp)
    800020d4:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    800020d8:	fffff097          	auipc	ra,0xfffff
    800020dc:	290080e7          	jalr	656(ra) # 80001368 <_Z9mem_allocm>
}
    800020e0:	00813083          	ld	ra,8(sp)
    800020e4:	00013403          	ld	s0,0(sp)
    800020e8:	01010113          	addi	sp,sp,16
    800020ec:	00008067          	ret

00000000800020f0 <_ZdlPv>:

void operator delete(void *p) noexcept {
    800020f0:	ff010113          	addi	sp,sp,-16
    800020f4:	00113423          	sd	ra,8(sp)
    800020f8:	00813023          	sd	s0,0(sp)
    800020fc:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002100:	fffff097          	auipc	ra,0xfffff
    80002104:	29c080e7          	jalr	668(ra) # 8000139c <_Z8mem_freePv>
}
    80002108:	00813083          	ld	ra,8(sp)
    8000210c:	00013403          	ld	s0,0(sp)
    80002110:	01010113          	addi	sp,sp,16
    80002114:	00008067          	ret

0000000080002118 <_ZdaPv>:

void operator delete[](void *p) noexcept {
    80002118:	ff010113          	addi	sp,sp,-16
    8000211c:	00113423          	sd	ra,8(sp)
    80002120:	00813023          	sd	s0,0(sp)
    80002124:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002128:	fffff097          	auipc	ra,0xfffff
    8000212c:	274080e7          	jalr	628(ra) # 8000139c <_Z8mem_freePv>
    80002130:	00813083          	ld	ra,8(sp)
    80002134:	00013403          	ld	s0,0(sp)
    80002138:	01010113          	addi	sp,sp,16
    8000213c:	00008067          	ret

0000000080002140 <_ZN17interruptHandlers20handleSupervisorTrapEv>:
#include "../h/MemoryAllocator.h"
#include "../h/RiscV.h"

namespace interruptHandlers {

    void handleSupervisorTrap() {
    80002140:	fc010113          	addi	sp,sp,-64
    80002144:	02113c23          	sd	ra,56(sp)
    80002148:	02813823          	sd	s0,48(sp)
    8000214c:	04010413          	addi	s0,sp,64
    static void mc_sip(BitMaskSip mask);
};

inline uint64 RiscV::scauseR() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002150:	142027f3          	csrr	a5,scause
    80002154:	fcf43023          	sd	a5,-64(s0)
    return scause;
    80002158:	fc043783          	ld	a5,-64(s0)
        uint64 scause = RiscV::scauseR();
        // not ecall interruption
        if (scause != (uint64) (1 << 3) && scause != (uint64) (1 << 3 | 0x01)) {
    8000215c:	ff878793          	addi	a5,a5,-8
    80002160:	00100713          	li	a4,1
    80002164:	04f76863          	bltu	a4,a5,800021b4 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x74>
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 RiscV::sepcR() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002168:	141027f3          	csrr	a5,sepc
    8000216c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002170:	fd843783          	ld	a5,-40(s0)
            return;
        }

        // interrupt from UserMode(0x08) or KernelMode(0x09)
        // retVal is passed implicitly by changing a0 on stack
        uint64 volatile sepc = RiscV::sepcR() + 4;
    80002174:	00478793          	addi	a5,a5,4
    80002178:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("mv a1, %0" : : "r"(val));
}

inline uint64 RiscV::sstatusR() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000217c:	100027f3          	csrr	a5,sstatus
    80002180:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002184:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sstatus = RiscV::sstatusR();
    80002188:	fef43023          	sd	a5,-32(s0)
    __asm__ volatile ("mv %0, a0" : "=r"(a0));
    8000218c:	00050793          	mv	a5,a0
    80002190:	fcf43423          	sd	a5,-56(s0)
    return a0;
    80002194:	fc843783          	ld	a5,-56(s0)
        uint64 codeOp = RiscV::a0R();
        uint64 retVal;

        switch (codeOp) {
    80002198:	02e78663          	beq	a5,a4,800021c4 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x84>
    8000219c:	00200713          	li	a4,2
    800021a0:	02e78e63          	beq	a5,a4,800021dc <_ZN17interruptHandlers20handleSupervisorTrapEv+0x9c>
                break;
            default:
                break;
        }

        RiscV::sstatusW(sstatus);
    800021a4:	fe043783          	ld	a5,-32(s0)
}

inline void RiscV::sstatusW(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021a8:	10079073          	csrw	sstatus,a5
        RiscV::sepcW(sepc);
    800021ac:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800021b0:	14179073          	csrw	sepc,a5

    }
    800021b4:	03813083          	ld	ra,56(sp)
    800021b8:	03013403          	ld	s0,48(sp)
    800021bc:	04010113          	addi	sp,sp,64
    800021c0:	00008067          	ret
                __asm__ volatile ("mv %0, a1" : "=r" (size));
    800021c4:	00058513          	mv	a0,a1
                retVal = (uint64) MemoryAllocator::mem_alloc(size);
    800021c8:	00000097          	auipc	ra,0x0
    800021cc:	114080e7          	jalr	276(ra) # 800022dc <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    800021d0:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(fp)");
    800021d4:	04543823          	sd	t0,80(s0)
                break;
    800021d8:	fcdff06f          	j	800021a4 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>
                __asm__ volatile ("mv %0, a1" : "=r"(ptr));
    800021dc:	00058513          	mv	a0,a1
                retVal = MemoryAllocator::mem_free(ptr);
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	250080e7          	jalr	592(ra) # 80002430 <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    800021e8:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(fp)");
    800021ec:	04543823          	sd	t0,80(s0)
                break;
    800021f0:	fb5ff06f          	j	800021a4 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>

00000000800021f4 <_ZN17interruptHandlers22handleConsoleInterruptEv>:

    void handleConsoleInterrupt() {
    800021f4:	ff010113          	addi	sp,sp,-16
    800021f8:	00113423          	sd	ra,8(sp)
    800021fc:	00813023          	sd	s0,0(sp)
    80002200:	01010413          	addi	s0,sp,16
        console_handler();
    80002204:	00002097          	auipc	ra,0x2
    80002208:	59c080e7          	jalr	1436(ra) # 800047a0 <console_handler>
    }
    8000220c:	00813083          	ld	ra,8(sp)
    80002210:	00013403          	ld	s0,0(sp)
    80002214:	01010113          	addi	sp,sp,16
    80002218:	00008067          	ret

000000008000221c <_ZN17interruptHandlers20handleTimerInterruptEv>:

    void handleTimerInterrupt() {
    8000221c:	ff010113          	addi	sp,sp,-16
    80002220:	00813423          	sd	s0,8(sp)
    80002224:	01010413          	addi	s0,sp,16
inline void RiscV::ms_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"((uint64)mask));
}

inline void RiscV::mc_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"((uint64)mask));
    80002228:	00200793          	li	a5,2
    8000222c:	1447b073          	csrc	sip,a5
        RiscV::mc_sip(RiscV::BitMaskSip::SIP_SSIP);
    }
    80002230:	00813403          	ld	s0,8(sp)
    80002234:	01010113          	addi	sp,sp,16
    80002238:	00008067          	ret

000000008000223c <_ZN15MemoryAllocator7initMemEv>:
const uint64 MemoryAllocator::HEADER_SIZE = (uint64)
        ((sizeof(AVLTree) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
bool MemoryAllocator::initialised = false;


void MemoryAllocator::initMem() {
    8000223c:	ff010113          	addi	sp,sp,-16
    80002240:	00813423          	sd	s0,8(sp)
    80002244:	01010413          	addi	s0,sp,16
    if (MemoryAllocator::initialised) return;
    80002248:	00003797          	auipc	a5,0x3
    8000224c:	6987c783          	lbu	a5,1688(a5) # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002250:	08079063          	bnez	a5,800022d0 <_ZN15MemoryAllocator7initMemEv+0x94>

    MemoryAllocator::startAddr = (((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002254:	00003797          	auipc	a5,0x3
    80002258:	62c7b783          	ld	a5,1580(a5) # 80005880 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000225c:	0007b783          	ld	a5,0(a5)
    80002260:	03f78793          	addi	a5,a5,63
    80002264:	fc07f793          	andi	a5,a5,-64
    80002268:	00003717          	auipc	a4,0x3
    8000226c:	67870713          	addi	a4,a4,1656 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002270:	00f73423          	sd	a5,8(a4)
    MemoryAllocator::endAddr = ((uint64)HEAP_END_ADDR / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002274:	00003697          	auipc	a3,0x3
    80002278:	61c6b683          	ld	a3,1564(a3) # 80005890 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000227c:	0006b683          	ld	a3,0(a3)
    80002280:	fc06f693          	andi	a3,a3,-64
    80002284:	00d73823          	sd	a3,16(a4)

    MemoryAllocator::free = (AVLTree*) MemoryAllocator::startAddr;
    80002288:	00f73c23          	sd	a5,24(a4)
        resetAll();
        this->sz = sz;
    }

    void resetAll(RESET_FLAGS flags = NO_FLAG) {
        left = right = parent = next = prev = sameSize = nullptr; height = 0;
    8000228c:	0007bc23          	sd	zero,24(a5)
    80002290:	0207b423          	sd	zero,40(a5)
    80002294:	0207b023          	sd	zero,32(a5)
    80002298:	0007b823          	sd	zero,16(a5)
    8000229c:	0007b423          	sd	zero,8(a5)
    800022a0:	0007b023          	sd	zero,0(a5)
    800022a4:	0207ac23          	sw	zero,56(a5)
    MemoryAllocator::free->resetAll();
    MemoryAllocator::free->isFree = true;
    800022a8:	01873683          	ld	a3,24(a4)
    800022ac:	00100613          	li	a2,1
    800022b0:	02c68e23          	sb	a2,60(a3)
    MemoryAllocator::free->sz =
            (size_t) (MemoryAllocator::endAddr - MemoryAllocator::startAddr - MemoryAllocator::HEADER_SIZE);
    800022b4:	01073783          	ld	a5,16(a4)
    800022b8:	00873583          	ld	a1,8(a4)
    800022bc:	40b787b3          	sub	a5,a5,a1
    800022c0:	fc078793          	addi	a5,a5,-64
    MemoryAllocator::free->sz =
    800022c4:	02f6b823          	sd	a5,48(a3)
    MemoryAllocator::first = MemoryAllocator::free;
    800022c8:	02d73023          	sd	a3,32(a4)
    MemoryAllocator::initialised = true;
    800022cc:	00c70023          	sb	a2,0(a4)
}
    800022d0:	00813403          	ld	s0,8(sp)
    800022d4:	01010113          	addi	sp,sp,16
    800022d8:	00008067          	ret

00000000800022dc <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    800022dc:	fd010113          	addi	sp,sp,-48
    800022e0:	02113423          	sd	ra,40(sp)
    800022e4:	02813023          	sd	s0,32(sp)
    800022e8:	00913c23          	sd	s1,24(sp)
    800022ec:	01213823          	sd	s2,16(sp)
    800022f0:	01313423          	sd	s3,8(sp)
    800022f4:	03010413          	addi	s0,sp,48
    if (size <= 0) return nullptr;
    800022f8:	12050863          	beqz	a0,80002428 <_ZN15MemoryAllocator9mem_allocEm+0x14c>
    800022fc:	00050493          	mv	s1,a0
    if (!MemoryAllocator::initialised)
    80002300:	00003797          	auipc	a5,0x3
    80002304:	5e07c783          	lbu	a5,1504(a5) # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002308:	08078e63          	beqz	a5,800023a4 <_ZN15MemoryAllocator9mem_allocEm+0xc8>
        MemoryAllocator::initMem();

    size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    8000230c:	03f48493          	addi	s1,s1,63
    80002310:	fc04f493          	andi	s1,s1,-64

    AVLTree* freeSeg = AVLTree::findFreeSeg(MemoryAllocator::free, size);
    80002314:	00048593          	mv	a1,s1
    80002318:	00003517          	auipc	a0,0x3
    8000231c:	5e053503          	ld	a0,1504(a0) # 800058f8 <_ZN15MemoryAllocator4freeE>
    80002320:	fffff097          	auipc	ra,0xfffff
    80002324:	0ac080e7          	jalr	172(ra) # 800013cc <_ZN7AVLTree11findFreeSegEPS_m>
    80002328:	00050913          	mv	s2,a0
    if (!freeSeg) return nullptr;
    8000232c:	04050c63          	beqz	a0,80002384 <_ZN15MemoryAllocator9mem_allocEm+0xa8>

    MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, freeSeg);
    80002330:	00003997          	auipc	s3,0x3
    80002334:	5b098993          	addi	s3,s3,1456 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002338:	00050593          	mv	a1,a0
    8000233c:	0189b503          	ld	a0,24(s3)
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	54c080e7          	jalr	1356(ra) # 8000188c <_ZN7AVLTree6removeEPS_S0_>
    80002348:	00a9bc23          	sd	a0,24(s3)

    if (size + MEM_BLOCK_SIZE + HEADER_SIZE <= freeSeg->sz
    8000234c:	08048793          	addi	a5,s1,128
    80002350:	03093703          	ld	a4,48(s2)
    80002354:	00f76663          	bltu	a4,a5,80002360 <_ZN15MemoryAllocator9mem_allocEm+0x84>
                && size + MEM_BLOCK_SIZE + HEADER_SIZE >= size) { //overflow check
    80002358:	f7f00793          	li	a5,-129
    8000235c:	0497fa63          	bgeu	a5,s1,800023b0 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
        freeSeg->sz = size;
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
        newFreeSeg->isFree = true;
    } else {
        MemoryAllocator::first = AVLTree::removeLL(freeSeg, MemoryAllocator::first);
    80002360:	00003497          	auipc	s1,0x3
    80002364:	58048493          	addi	s1,s1,1408 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002368:	0204b583          	ld	a1,32(s1)
    8000236c:	00090513          	mv	a0,s2
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	7a0080e7          	jalr	1952(ra) # 80001b10 <_ZN7AVLTree8removeLLEPS_S0_>
    80002378:	02a4b023          	sd	a0,32(s1)
    }
    freeSeg->isFree = false;
    8000237c:	02090e23          	sb	zero,60(s2)
    return (void*) ((uint64)freeSeg + HEADER_SIZE);
    80002380:	04090913          	addi	s2,s2,64
}
    80002384:	00090513          	mv	a0,s2
    80002388:	02813083          	ld	ra,40(sp)
    8000238c:	02013403          	ld	s0,32(sp)
    80002390:	01813483          	ld	s1,24(sp)
    80002394:	01013903          	ld	s2,16(sp)
    80002398:	00813983          	ld	s3,8(sp)
    8000239c:	03010113          	addi	sp,sp,48
    800023a0:	00008067          	ret
        MemoryAllocator::initMem();
    800023a4:	00000097          	auipc	ra,0x0
    800023a8:	e98080e7          	jalr	-360(ra) # 8000223c <_ZN15MemoryAllocator7initMemEv>
    800023ac:	f61ff06f          	j	8000230c <_ZN15MemoryAllocator9mem_allocEm+0x30>
        AVLTree* newFreeSeg = (AVLTree*) ((uint64)freeSeg + size + HEADER_SIZE);
    800023b0:	009907b3          	add	a5,s2,s1
    800023b4:	04078993          	addi	s3,a5,64
    800023b8:	0407bc23          	sd	zero,88(a5)
    800023bc:	0607b423          	sd	zero,104(a5)
    800023c0:	0607b023          	sd	zero,96(a5)
    800023c4:	0407b823          	sd	zero,80(a5)
    800023c8:	0407b423          	sd	zero,72(a5)
    800023cc:	0407b023          	sd	zero,64(a5)
    800023d0:	0607ac23          	sw	zero,120(a5)
        newFreeSeg->sz = freeSeg->sz - size - HEADER_SIZE;
    800023d4:	03093783          	ld	a5,48(s2)
    800023d8:	409787b3          	sub	a5,a5,s1
    800023dc:	fc078793          	addi	a5,a5,-64
    800023e0:	02f9b823          	sd	a5,48(s3)
        freeSeg->sz = size;
    800023e4:	02993823          	sd	s1,48(s2)
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
    800023e8:	00003497          	auipc	s1,0x3
    800023ec:	4f848493          	addi	s1,s1,1272 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    800023f0:	00098593          	mv	a1,s3
    800023f4:	0184b503          	ld	a0,24(s1)
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	400080e7          	jalr	1024(ra) # 800017f8 <_ZN7AVLTree6insertEPS_S0_>
    80002400:	00a4bc23          	sd	a0,24(s1)
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
    80002404:	0204b603          	ld	a2,32(s1)
    80002408:	00098593          	mv	a1,s3
    8000240c:	00090513          	mv	a0,s2
    80002410:	fffff097          	auipc	ra,0xfffff
    80002414:	690080e7          	jalr	1680(ra) # 80001aa0 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    80002418:	02a4b023          	sd	a0,32(s1)
        newFreeSeg->isFree = true;
    8000241c:	00100793          	li	a5,1
    80002420:	02f98e23          	sb	a5,60(s3)
    80002424:	f59ff06f          	j	8000237c <_ZN15MemoryAllocator9mem_allocEm+0xa0>
    if (size <= 0) return nullptr;
    80002428:	00000913          	li	s2,0
    8000242c:	f59ff06f          	j	80002384 <_ZN15MemoryAllocator9mem_allocEm+0xa8>

0000000080002430 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *ptr) {

    if (!ptr) return -1;
    80002430:	20050a63          	beqz	a0,80002644 <_ZN15MemoryAllocator8mem_freeEPv+0x214>
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesnt point to beginning of block (its faulty)
    80002434:	03f57713          	andi	a4,a0,63
    80002438:	20071a63          	bnez	a4,8000264c <_ZN15MemoryAllocator8mem_freeEPv+0x21c>
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    8000243c:	00003717          	auipc	a4,0x3
    80002440:	4b473703          	ld	a4,1204(a4) # 800058f0 <_ZN15MemoryAllocator7endAddrE>
    80002444:	20e57863          	bgeu	a0,a4,80002654 <_ZN15MemoryAllocator8mem_freeEPv+0x224>
    80002448:	00003717          	auipc	a4,0x3
    8000244c:	4a073703          	ld	a4,1184(a4) # 800058e8 <_ZN15MemoryAllocator9startAddrE>
    80002450:	20e56663          	bltu	a0,a4,8000265c <_ZN15MemoryAllocator8mem_freeEPv+0x22c>
int MemoryAllocator::mem_free(void *ptr) {
    80002454:	fc010113          	addi	sp,sp,-64
    80002458:	02113c23          	sd	ra,56(sp)
    8000245c:	02813823          	sd	s0,48(sp)
    80002460:	02913423          	sd	s1,40(sp)
    80002464:	03213023          	sd	s2,32(sp)
    80002468:	01313c23          	sd	s3,24(sp)
    8000246c:	01413823          	sd	s4,16(sp)
    80002470:	01513423          	sd	s5,8(sp)
    80002474:	04010413          	addi	s0,sp,64

    AVLTree* cur = (AVLTree*) ((uint64)ptr - HEADER_SIZE); cur->resetAll(AVLTree::SAVE_SZ); cur->isFree = true;
    80002478:	fc050913          	addi	s2,a0,-64
    8000247c:	00090993          	mv	s3,s2
    80002480:	00093c23          	sd	zero,24(s2)
    80002484:	02093423          	sd	zero,40(s2)
    80002488:	02093023          	sd	zero,32(s2)
    8000248c:	00093823          	sd	zero,16(s2)
    80002490:	00093423          	sd	zero,8(s2)
    80002494:	fc053023          	sd	zero,-64(a0)
    80002498:	02092c23          	sw	zero,56(s2)
    8000249c:	00100793          	li	a5,1
    800024a0:	02f90e23          	sb	a5,60(s2)
    AVLTree* aft = ((uint64)cur + cur->sz + HEADER_SIZE >= MemoryAllocator::endAddr) ? nullptr :
    800024a4:	03093483          	ld	s1,48(s2)
    800024a8:	009904b3          	add	s1,s2,s1
    800024ac:	04048493          	addi	s1,s1,64
    800024b0:	00003797          	auipc	a5,0x3
    800024b4:	4407b783          	ld	a5,1088(a5) # 800058f0 <_ZN15MemoryAllocator7endAddrE>
    800024b8:	04f4f863          	bgeu	s1,a5,80002508 <_ZN15MemoryAllocator8mem_freeEPv+0xd8>
    800024bc:	00048a13          	mv	s4,s1
            (AVLTree*) ((uint64)cur + cur->sz + HEADER_SIZE);
    AVLTree* toSwap = nullptr;

    if (aft && aft->isFree) {
    800024c0:	04048663          	beqz	s1,8000250c <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    800024c4:	03c4c783          	lbu	a5,60(s1)
    800024c8:	00079663          	bnez	a5,800024d4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    AVLTree* toSwap = nullptr;
    800024cc:	00000a13          	li	s4,0
    800024d0:	03c0006f          	j	8000250c <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, aft);
    800024d4:	00003a97          	auipc	s5,0x3
    800024d8:	40ca8a93          	addi	s5,s5,1036 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    800024dc:	00048593          	mv	a1,s1
    800024e0:	018ab503          	ld	a0,24(s5)
    800024e4:	fffff097          	auipc	ra,0xfffff
    800024e8:	3a8080e7          	jalr	936(ra) # 8000188c <_ZN7AVLTree6removeEPS_S0_>
    800024ec:	00aabc23          	sd	a0,24(s5)
        cur->sz += aft->sz + HEADER_SIZE;
    800024f0:	0304b783          	ld	a5,48(s1)
    800024f4:	03093703          	ld	a4,48(s2)
    800024f8:	00e787b3          	add	a5,a5,a4
    800024fc:	04078793          	addi	a5,a5,64
    80002500:	02f93823          	sd	a5,48(s2)
        toSwap = aft;
    80002504:	0080006f          	j	8000250c <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    AVLTree* toSwap = nullptr;
    80002508:	00000a13          	li	s4,0
    }

    AVLTree* prev = MemoryAllocator::first;
    8000250c:	00003497          	auipc	s1,0x3
    80002510:	3f44b483          	ld	s1,1012(s1) # 80005900 <_ZN15MemoryAllocator5firstE>
    80002514:	0080006f          	j	8000251c <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    for(;prev && prev->next && ((uint64)prev->next + prev->next->sz + HEADER_SIZE < (uint64)cur); prev = prev->next);
    80002518:	00070493          	mv	s1,a4
    8000251c:	00048e63          	beqz	s1,80002538 <_ZN15MemoryAllocator8mem_freeEPv+0x108>
    80002520:	0204b703          	ld	a4,32(s1)
    80002524:	00070a63          	beqz	a4,80002538 <_ZN15MemoryAllocator8mem_freeEPv+0x108>
    80002528:	03073783          	ld	a5,48(a4)
    8000252c:	00f707b3          	add	a5,a4,a5
    80002530:	04078793          	addi	a5,a5,64
    80002534:	ff27e2e3          	bltu	a5,s2,80002518 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>

    if (prev && (uint64)prev + prev->sz + HEADER_SIZE == (uint64)cur) {
    80002538:	00048a63          	beqz	s1,8000254c <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
    8000253c:	0304b783          	ld	a5,48(s1)
    80002540:	00f487b3          	add	a5,s1,a5
    80002544:	04078793          	addi	a5,a5,64
    80002548:	06f90663          	beq	s2,a5,800025b4 <_ZN15MemoryAllocator8mem_freeEPv+0x184>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
        toSwap = (toSwap) ? toSwap : prev;
        cur = prev;
    }

    MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, cur);
    8000254c:	00003497          	auipc	s1,0x3
    80002550:	39448493          	addi	s1,s1,916 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    80002554:	00098593          	mv	a1,s3
    80002558:	0184b503          	ld	a0,24(s1)
    8000255c:	fffff097          	auipc	ra,0xfffff
    80002560:	29c080e7          	jalr	668(ra) # 800017f8 <_ZN7AVLTree6insertEPS_S0_>
    80002564:	00a4bc23          	sd	a0,24(s1)
    MemoryAllocator::first = (toSwap) ? AVLTree::swapLL(toSwap, cur, MemoryAllocator::first) :
    80002568:	0c0a0263          	beqz	s4,8000262c <_ZN15MemoryAllocator8mem_freeEPv+0x1fc>
    8000256c:	00003617          	auipc	a2,0x3
    80002570:	39463603          	ld	a2,916(a2) # 80005900 <_ZN15MemoryAllocator5firstE>
    80002574:	00098593          	mv	a1,s3
    80002578:	000a0513          	mv	a0,s4
    8000257c:	fffff097          	auipc	ra,0xfffff
    80002580:	524080e7          	jalr	1316(ra) # 80001aa0 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    80002584:	00003797          	auipc	a5,0x3
    80002588:	36a7be23          	sd	a0,892(a5) # 80005900 <_ZN15MemoryAllocator5firstE>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    return 0;
    8000258c:	00000513          	li	a0,0
}
    80002590:	03813083          	ld	ra,56(sp)
    80002594:	03013403          	ld	s0,48(sp)
    80002598:	02813483          	ld	s1,40(sp)
    8000259c:	02013903          	ld	s2,32(sp)
    800025a0:	01813983          	ld	s3,24(sp)
    800025a4:	01013a03          	ld	s4,16(sp)
    800025a8:	00813a83          	ld	s5,8(sp)
    800025ac:	04010113          	addi	sp,sp,64
    800025b0:	00008067          	ret
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, prev);
    800025b4:	00003997          	auipc	s3,0x3
    800025b8:	32c98993          	addi	s3,s3,812 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    800025bc:	00048593          	mv	a1,s1
    800025c0:	0189b503          	ld	a0,24(s3)
    800025c4:	fffff097          	auipc	ra,0xfffff
    800025c8:	2c8080e7          	jalr	712(ra) # 8000188c <_ZN7AVLTree6removeEPS_S0_>
    800025cc:	00a9bc23          	sd	a0,24(s3)
        prev->sz += cur->sz + HEADER_SIZE;
    800025d0:	03093783          	ld	a5,48(s2)
    800025d4:	0304b703          	ld	a4,48(s1)
    800025d8:	00e787b3          	add	a5,a5,a4
    800025dc:	04078793          	addi	a5,a5,64
    800025e0:	02f4b823          	sd	a5,48(s1)
        prev->isFree = true;
    800025e4:	00100793          	li	a5,1
    800025e8:	02f48e23          	sb	a5,60(s1)
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    800025ec:	020a0663          	beqz	s4,80002618 <_ZN15MemoryAllocator8mem_freeEPv+0x1e8>
    800025f0:	00048513          	mv	a0,s1
    800025f4:	00003917          	auipc	s2,0x3
    800025f8:	2ec90913          	addi	s2,s2,748 # 800058e0 <_ZN15MemoryAllocator11initialisedE>
    800025fc:	02093583          	ld	a1,32(s2)
    80002600:	fffff097          	auipc	ra,0xfffff
    80002604:	510080e7          	jalr	1296(ra) # 80001b10 <_ZN7AVLTree8removeLLEPS_S0_>
    80002608:	02a93023          	sd	a0,32(s2)
        toSwap = (toSwap) ? toSwap : prev;
    8000260c:	000a0a63          	beqz	s4,80002620 <_ZN15MemoryAllocator8mem_freeEPv+0x1f0>
        cur = prev;
    80002610:	00048993          	mv	s3,s1
    80002614:	f39ff06f          	j	8000254c <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    80002618:	000a0513          	mv	a0,s4
    8000261c:	fd9ff06f          	j	800025f4 <_ZN15MemoryAllocator8mem_freeEPv+0x1c4>
        toSwap = (toSwap) ? toSwap : prev;
    80002620:	00048a13          	mv	s4,s1
        cur = prev;
    80002624:	00048993          	mv	s3,s1
    80002628:	f25ff06f          	j	8000254c <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    8000262c:	00003597          	auipc	a1,0x3
    80002630:	2d45b583          	ld	a1,724(a1) # 80005900 <_ZN15MemoryAllocator5firstE>
    80002634:	00098513          	mv	a0,s3
    80002638:	fffff097          	auipc	ra,0xfffff
    8000263c:	560080e7          	jalr	1376(ra) # 80001b98 <_ZN7AVLTree8insertLLEPS_S0_>
    80002640:	f45ff06f          	j	80002584 <_ZN15MemoryAllocator8mem_freeEPv+0x154>
    if (!ptr) return -1;
    80002644:	fff00513          	li	a0,-1
    80002648:	00008067          	ret
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesnt point to beginning of block (its faulty)
    8000264c:	ffe00513          	li	a0,-2
    80002650:	00008067          	ret
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    80002654:	ffd00513          	li	a0,-3
    80002658:	00008067          	ret
    8000265c:	ffd00513          	li	a0,-3
}
    80002660:	00008067          	ret

0000000080002664 <start>:
    80002664:	ff010113          	addi	sp,sp,-16
    80002668:	00813423          	sd	s0,8(sp)
    8000266c:	01010413          	addi	s0,sp,16
    80002670:	300027f3          	csrr	a5,mstatus
    80002674:	ffffe737          	lui	a4,0xffffe
    80002678:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7c8f>
    8000267c:	00e7f7b3          	and	a5,a5,a4
    80002680:	00001737          	lui	a4,0x1
    80002684:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002688:	00e7e7b3          	or	a5,a5,a4
    8000268c:	30079073          	csrw	mstatus,a5
    80002690:	00000797          	auipc	a5,0x0
    80002694:	16078793          	addi	a5,a5,352 # 800027f0 <system_main>
    80002698:	34179073          	csrw	mepc,a5
    8000269c:	00000793          	li	a5,0
    800026a0:	18079073          	csrw	satp,a5
    800026a4:	000107b7          	lui	a5,0x10
    800026a8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800026ac:	30279073          	csrw	medeleg,a5
    800026b0:	30379073          	csrw	mideleg,a5
    800026b4:	104027f3          	csrr	a5,sie
    800026b8:	2227e793          	ori	a5,a5,546
    800026bc:	10479073          	csrw	sie,a5
    800026c0:	fff00793          	li	a5,-1
    800026c4:	00a7d793          	srli	a5,a5,0xa
    800026c8:	3b079073          	csrw	pmpaddr0,a5
    800026cc:	00f00793          	li	a5,15
    800026d0:	3a079073          	csrw	pmpcfg0,a5
    800026d4:	f14027f3          	csrr	a5,mhartid
    800026d8:	0200c737          	lui	a4,0x200c
    800026dc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800026e0:	0007869b          	sext.w	a3,a5
    800026e4:	00269713          	slli	a4,a3,0x2
    800026e8:	000f4637          	lui	a2,0xf4
    800026ec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800026f0:	00d70733          	add	a4,a4,a3
    800026f4:	0037979b          	slliw	a5,a5,0x3
    800026f8:	020046b7          	lui	a3,0x2004
    800026fc:	00d787b3          	add	a5,a5,a3
    80002700:	00c585b3          	add	a1,a1,a2
    80002704:	00371693          	slli	a3,a4,0x3
    80002708:	00003717          	auipc	a4,0x3
    8000270c:	20870713          	addi	a4,a4,520 # 80005910 <timer_scratch>
    80002710:	00b7b023          	sd	a1,0(a5)
    80002714:	00d70733          	add	a4,a4,a3
    80002718:	00f73c23          	sd	a5,24(a4)
    8000271c:	02c73023          	sd	a2,32(a4)
    80002720:	34071073          	csrw	mscratch,a4
    80002724:	00000797          	auipc	a5,0x0
    80002728:	6ec78793          	addi	a5,a5,1772 # 80002e10 <timervec>
    8000272c:	30579073          	csrw	mtvec,a5
    80002730:	300027f3          	csrr	a5,mstatus
    80002734:	0087e793          	ori	a5,a5,8
    80002738:	30079073          	csrw	mstatus,a5
    8000273c:	304027f3          	csrr	a5,mie
    80002740:	0807e793          	ori	a5,a5,128
    80002744:	30479073          	csrw	mie,a5
    80002748:	f14027f3          	csrr	a5,mhartid
    8000274c:	0007879b          	sext.w	a5,a5
    80002750:	00078213          	mv	tp,a5
    80002754:	30200073          	mret
    80002758:	00813403          	ld	s0,8(sp)
    8000275c:	01010113          	addi	sp,sp,16
    80002760:	00008067          	ret

0000000080002764 <timerinit>:
    80002764:	ff010113          	addi	sp,sp,-16
    80002768:	00813423          	sd	s0,8(sp)
    8000276c:	01010413          	addi	s0,sp,16
    80002770:	f14027f3          	csrr	a5,mhartid
    80002774:	0200c737          	lui	a4,0x200c
    80002778:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000277c:	0007869b          	sext.w	a3,a5
    80002780:	00269713          	slli	a4,a3,0x2
    80002784:	000f4637          	lui	a2,0xf4
    80002788:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000278c:	00d70733          	add	a4,a4,a3
    80002790:	0037979b          	slliw	a5,a5,0x3
    80002794:	020046b7          	lui	a3,0x2004
    80002798:	00d787b3          	add	a5,a5,a3
    8000279c:	00c585b3          	add	a1,a1,a2
    800027a0:	00371693          	slli	a3,a4,0x3
    800027a4:	00003717          	auipc	a4,0x3
    800027a8:	16c70713          	addi	a4,a4,364 # 80005910 <timer_scratch>
    800027ac:	00b7b023          	sd	a1,0(a5)
    800027b0:	00d70733          	add	a4,a4,a3
    800027b4:	00f73c23          	sd	a5,24(a4)
    800027b8:	02c73023          	sd	a2,32(a4)
    800027bc:	34071073          	csrw	mscratch,a4
    800027c0:	00000797          	auipc	a5,0x0
    800027c4:	65078793          	addi	a5,a5,1616 # 80002e10 <timervec>
    800027c8:	30579073          	csrw	mtvec,a5
    800027cc:	300027f3          	csrr	a5,mstatus
    800027d0:	0087e793          	ori	a5,a5,8
    800027d4:	30079073          	csrw	mstatus,a5
    800027d8:	304027f3          	csrr	a5,mie
    800027dc:	0807e793          	ori	a5,a5,128
    800027e0:	30479073          	csrw	mie,a5
    800027e4:	00813403          	ld	s0,8(sp)
    800027e8:	01010113          	addi	sp,sp,16
    800027ec:	00008067          	ret

00000000800027f0 <system_main>:
    800027f0:	fe010113          	addi	sp,sp,-32
    800027f4:	00813823          	sd	s0,16(sp)
    800027f8:	00913423          	sd	s1,8(sp)
    800027fc:	00113c23          	sd	ra,24(sp)
    80002800:	02010413          	addi	s0,sp,32
    80002804:	00000097          	auipc	ra,0x0
    80002808:	0c4080e7          	jalr	196(ra) # 800028c8 <cpuid>
    8000280c:	00003497          	auipc	s1,0x3
    80002810:	0a448493          	addi	s1,s1,164 # 800058b0 <started>
    80002814:	02050263          	beqz	a0,80002838 <system_main+0x48>
    80002818:	0004a783          	lw	a5,0(s1)
    8000281c:	0007879b          	sext.w	a5,a5
    80002820:	fe078ce3          	beqz	a5,80002818 <system_main+0x28>
    80002824:	0ff0000f          	fence
    80002828:	00003517          	auipc	a0,0x3
    8000282c:	83050513          	addi	a0,a0,-2000 # 80005058 <_ZN15MemoryAllocator11HEADER_SIZEE+0x38>
    80002830:	00001097          	auipc	ra,0x1
    80002834:	a7c080e7          	jalr	-1412(ra) # 800032ac <panic>
    80002838:	00001097          	auipc	ra,0x1
    8000283c:	9d0080e7          	jalr	-1584(ra) # 80003208 <consoleinit>
    80002840:	00001097          	auipc	ra,0x1
    80002844:	15c080e7          	jalr	348(ra) # 8000399c <printfinit>
    80002848:	00003517          	auipc	a0,0x3
    8000284c:	8f050513          	addi	a0,a0,-1808 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    80002850:	00001097          	auipc	ra,0x1
    80002854:	ab8080e7          	jalr	-1352(ra) # 80003308 <__printf>
    80002858:	00002517          	auipc	a0,0x2
    8000285c:	7d050513          	addi	a0,a0,2000 # 80005028 <_ZN15MemoryAllocator11HEADER_SIZEE+0x8>
    80002860:	00001097          	auipc	ra,0x1
    80002864:	aa8080e7          	jalr	-1368(ra) # 80003308 <__printf>
    80002868:	00003517          	auipc	a0,0x3
    8000286c:	8d050513          	addi	a0,a0,-1840 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    80002870:	00001097          	auipc	ra,0x1
    80002874:	a98080e7          	jalr	-1384(ra) # 80003308 <__printf>
    80002878:	00001097          	auipc	ra,0x1
    8000287c:	4b0080e7          	jalr	1200(ra) # 80003d28 <kinit>
    80002880:	00000097          	auipc	ra,0x0
    80002884:	148080e7          	jalr	328(ra) # 800029c8 <trapinit>
    80002888:	00000097          	auipc	ra,0x0
    8000288c:	16c080e7          	jalr	364(ra) # 800029f4 <trapinithart>
    80002890:	00000097          	auipc	ra,0x0
    80002894:	5c0080e7          	jalr	1472(ra) # 80002e50 <plicinit>
    80002898:	00000097          	auipc	ra,0x0
    8000289c:	5e0080e7          	jalr	1504(ra) # 80002e78 <plicinithart>
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	078080e7          	jalr	120(ra) # 80002918 <userinit>
    800028a8:	0ff0000f          	fence
    800028ac:	00100793          	li	a5,1
    800028b0:	00002517          	auipc	a0,0x2
    800028b4:	79050513          	addi	a0,a0,1936 # 80005040 <_ZN15MemoryAllocator11HEADER_SIZEE+0x20>
    800028b8:	00f4a023          	sw	a5,0(s1)
    800028bc:	00001097          	auipc	ra,0x1
    800028c0:	a4c080e7          	jalr	-1460(ra) # 80003308 <__printf>
    800028c4:	0000006f          	j	800028c4 <system_main+0xd4>

00000000800028c8 <cpuid>:
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00813423          	sd	s0,8(sp)
    800028d0:	01010413          	addi	s0,sp,16
    800028d4:	00020513          	mv	a0,tp
    800028d8:	00813403          	ld	s0,8(sp)
    800028dc:	0005051b          	sext.w	a0,a0
    800028e0:	01010113          	addi	sp,sp,16
    800028e4:	00008067          	ret

00000000800028e8 <mycpu>:
    800028e8:	ff010113          	addi	sp,sp,-16
    800028ec:	00813423          	sd	s0,8(sp)
    800028f0:	01010413          	addi	s0,sp,16
    800028f4:	00020793          	mv	a5,tp
    800028f8:	00813403          	ld	s0,8(sp)
    800028fc:	0007879b          	sext.w	a5,a5
    80002900:	00779793          	slli	a5,a5,0x7
    80002904:	00004517          	auipc	a0,0x4
    80002908:	03c50513          	addi	a0,a0,60 # 80006940 <cpus>
    8000290c:	00f50533          	add	a0,a0,a5
    80002910:	01010113          	addi	sp,sp,16
    80002914:	00008067          	ret

0000000080002918 <userinit>:
    80002918:	ff010113          	addi	sp,sp,-16
    8000291c:	00813423          	sd	s0,8(sp)
    80002920:	01010413          	addi	s0,sp,16
    80002924:	00813403          	ld	s0,8(sp)
    80002928:	01010113          	addi	sp,sp,16
    8000292c:	fffff317          	auipc	t1,0xfffff
    80002930:	4bc30067          	jr	1212(t1) # 80001de8 <main>

0000000080002934 <either_copyout>:
    80002934:	ff010113          	addi	sp,sp,-16
    80002938:	00813023          	sd	s0,0(sp)
    8000293c:	00113423          	sd	ra,8(sp)
    80002940:	01010413          	addi	s0,sp,16
    80002944:	02051663          	bnez	a0,80002970 <either_copyout+0x3c>
    80002948:	00058513          	mv	a0,a1
    8000294c:	00060593          	mv	a1,a2
    80002950:	0006861b          	sext.w	a2,a3
    80002954:	00002097          	auipc	ra,0x2
    80002958:	c60080e7          	jalr	-928(ra) # 800045b4 <__memmove>
    8000295c:	00813083          	ld	ra,8(sp)
    80002960:	00013403          	ld	s0,0(sp)
    80002964:	00000513          	li	a0,0
    80002968:	01010113          	addi	sp,sp,16
    8000296c:	00008067          	ret
    80002970:	00002517          	auipc	a0,0x2
    80002974:	71050513          	addi	a0,a0,1808 # 80005080 <_ZN15MemoryAllocator11HEADER_SIZEE+0x60>
    80002978:	00001097          	auipc	ra,0x1
    8000297c:	934080e7          	jalr	-1740(ra) # 800032ac <panic>

0000000080002980 <either_copyin>:
    80002980:	ff010113          	addi	sp,sp,-16
    80002984:	00813023          	sd	s0,0(sp)
    80002988:	00113423          	sd	ra,8(sp)
    8000298c:	01010413          	addi	s0,sp,16
    80002990:	02059463          	bnez	a1,800029b8 <either_copyin+0x38>
    80002994:	00060593          	mv	a1,a2
    80002998:	0006861b          	sext.w	a2,a3
    8000299c:	00002097          	auipc	ra,0x2
    800029a0:	c18080e7          	jalr	-1000(ra) # 800045b4 <__memmove>
    800029a4:	00813083          	ld	ra,8(sp)
    800029a8:	00013403          	ld	s0,0(sp)
    800029ac:	00000513          	li	a0,0
    800029b0:	01010113          	addi	sp,sp,16
    800029b4:	00008067          	ret
    800029b8:	00002517          	auipc	a0,0x2
    800029bc:	6f050513          	addi	a0,a0,1776 # 800050a8 <_ZN15MemoryAllocator11HEADER_SIZEE+0x88>
    800029c0:	00001097          	auipc	ra,0x1
    800029c4:	8ec080e7          	jalr	-1812(ra) # 800032ac <panic>

00000000800029c8 <trapinit>:
    800029c8:	ff010113          	addi	sp,sp,-16
    800029cc:	00813423          	sd	s0,8(sp)
    800029d0:	01010413          	addi	s0,sp,16
    800029d4:	00813403          	ld	s0,8(sp)
    800029d8:	00002597          	auipc	a1,0x2
    800029dc:	6f858593          	addi	a1,a1,1784 # 800050d0 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb0>
    800029e0:	00004517          	auipc	a0,0x4
    800029e4:	fe050513          	addi	a0,a0,-32 # 800069c0 <tickslock>
    800029e8:	01010113          	addi	sp,sp,16
    800029ec:	00001317          	auipc	t1,0x1
    800029f0:	5cc30067          	jr	1484(t1) # 80003fb8 <initlock>

00000000800029f4 <trapinithart>:
    800029f4:	ff010113          	addi	sp,sp,-16
    800029f8:	00813423          	sd	s0,8(sp)
    800029fc:	01010413          	addi	s0,sp,16
    80002a00:	00000797          	auipc	a5,0x0
    80002a04:	30078793          	addi	a5,a5,768 # 80002d00 <kernelvec>
    80002a08:	10579073          	csrw	stvec,a5
    80002a0c:	00813403          	ld	s0,8(sp)
    80002a10:	01010113          	addi	sp,sp,16
    80002a14:	00008067          	ret

0000000080002a18 <usertrap>:
    80002a18:	ff010113          	addi	sp,sp,-16
    80002a1c:	00813423          	sd	s0,8(sp)
    80002a20:	01010413          	addi	s0,sp,16
    80002a24:	00813403          	ld	s0,8(sp)
    80002a28:	01010113          	addi	sp,sp,16
    80002a2c:	00008067          	ret

0000000080002a30 <usertrapret>:
    80002a30:	ff010113          	addi	sp,sp,-16
    80002a34:	00813423          	sd	s0,8(sp)
    80002a38:	01010413          	addi	s0,sp,16
    80002a3c:	00813403          	ld	s0,8(sp)
    80002a40:	01010113          	addi	sp,sp,16
    80002a44:	00008067          	ret

0000000080002a48 <kerneltrap>:
    80002a48:	fe010113          	addi	sp,sp,-32
    80002a4c:	00813823          	sd	s0,16(sp)
    80002a50:	00113c23          	sd	ra,24(sp)
    80002a54:	00913423          	sd	s1,8(sp)
    80002a58:	02010413          	addi	s0,sp,32
    80002a5c:	142025f3          	csrr	a1,scause
    80002a60:	100027f3          	csrr	a5,sstatus
    80002a64:	0027f793          	andi	a5,a5,2
    80002a68:	10079c63          	bnez	a5,80002b80 <kerneltrap+0x138>
    80002a6c:	142027f3          	csrr	a5,scause
    80002a70:	0207ce63          	bltz	a5,80002aac <kerneltrap+0x64>
    80002a74:	00002517          	auipc	a0,0x2
    80002a78:	6a450513          	addi	a0,a0,1700 # 80005118 <_ZN15MemoryAllocator11HEADER_SIZEE+0xf8>
    80002a7c:	00001097          	auipc	ra,0x1
    80002a80:	88c080e7          	jalr	-1908(ra) # 80003308 <__printf>
    80002a84:	141025f3          	csrr	a1,sepc
    80002a88:	14302673          	csrr	a2,stval
    80002a8c:	00002517          	auipc	a0,0x2
    80002a90:	69c50513          	addi	a0,a0,1692 # 80005128 <_ZN15MemoryAllocator11HEADER_SIZEE+0x108>
    80002a94:	00001097          	auipc	ra,0x1
    80002a98:	874080e7          	jalr	-1932(ra) # 80003308 <__printf>
    80002a9c:	00002517          	auipc	a0,0x2
    80002aa0:	6a450513          	addi	a0,a0,1700 # 80005140 <_ZN15MemoryAllocator11HEADER_SIZEE+0x120>
    80002aa4:	00001097          	auipc	ra,0x1
    80002aa8:	808080e7          	jalr	-2040(ra) # 800032ac <panic>
    80002aac:	0ff7f713          	andi	a4,a5,255
    80002ab0:	00900693          	li	a3,9
    80002ab4:	04d70063          	beq	a4,a3,80002af4 <kerneltrap+0xac>
    80002ab8:	fff00713          	li	a4,-1
    80002abc:	03f71713          	slli	a4,a4,0x3f
    80002ac0:	00170713          	addi	a4,a4,1
    80002ac4:	fae798e3          	bne	a5,a4,80002a74 <kerneltrap+0x2c>
    80002ac8:	00000097          	auipc	ra,0x0
    80002acc:	e00080e7          	jalr	-512(ra) # 800028c8 <cpuid>
    80002ad0:	06050663          	beqz	a0,80002b3c <kerneltrap+0xf4>
    80002ad4:	144027f3          	csrr	a5,sip
    80002ad8:	ffd7f793          	andi	a5,a5,-3
    80002adc:	14479073          	csrw	sip,a5
    80002ae0:	01813083          	ld	ra,24(sp)
    80002ae4:	01013403          	ld	s0,16(sp)
    80002ae8:	00813483          	ld	s1,8(sp)
    80002aec:	02010113          	addi	sp,sp,32
    80002af0:	00008067          	ret
    80002af4:	00000097          	auipc	ra,0x0
    80002af8:	3d0080e7          	jalr	976(ra) # 80002ec4 <plic_claim>
    80002afc:	00a00793          	li	a5,10
    80002b00:	00050493          	mv	s1,a0
    80002b04:	06f50863          	beq	a0,a5,80002b74 <kerneltrap+0x12c>
    80002b08:	fc050ce3          	beqz	a0,80002ae0 <kerneltrap+0x98>
    80002b0c:	00050593          	mv	a1,a0
    80002b10:	00002517          	auipc	a0,0x2
    80002b14:	5e850513          	addi	a0,a0,1512 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    80002b18:	00000097          	auipc	ra,0x0
    80002b1c:	7f0080e7          	jalr	2032(ra) # 80003308 <__printf>
    80002b20:	01013403          	ld	s0,16(sp)
    80002b24:	01813083          	ld	ra,24(sp)
    80002b28:	00048513          	mv	a0,s1
    80002b2c:	00813483          	ld	s1,8(sp)
    80002b30:	02010113          	addi	sp,sp,32
    80002b34:	00000317          	auipc	t1,0x0
    80002b38:	3c830067          	jr	968(t1) # 80002efc <plic_complete>
    80002b3c:	00004517          	auipc	a0,0x4
    80002b40:	e8450513          	addi	a0,a0,-380 # 800069c0 <tickslock>
    80002b44:	00001097          	auipc	ra,0x1
    80002b48:	498080e7          	jalr	1176(ra) # 80003fdc <acquire>
    80002b4c:	00003717          	auipc	a4,0x3
    80002b50:	d6870713          	addi	a4,a4,-664 # 800058b4 <ticks>
    80002b54:	00072783          	lw	a5,0(a4)
    80002b58:	00004517          	auipc	a0,0x4
    80002b5c:	e6850513          	addi	a0,a0,-408 # 800069c0 <tickslock>
    80002b60:	0017879b          	addiw	a5,a5,1
    80002b64:	00f72023          	sw	a5,0(a4)
    80002b68:	00001097          	auipc	ra,0x1
    80002b6c:	540080e7          	jalr	1344(ra) # 800040a8 <release>
    80002b70:	f65ff06f          	j	80002ad4 <kerneltrap+0x8c>
    80002b74:	00001097          	auipc	ra,0x1
    80002b78:	09c080e7          	jalr	156(ra) # 80003c10 <uartintr>
    80002b7c:	fa5ff06f          	j	80002b20 <kerneltrap+0xd8>
    80002b80:	00002517          	auipc	a0,0x2
    80002b84:	55850513          	addi	a0,a0,1368 # 800050d8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb8>
    80002b88:	00000097          	auipc	ra,0x0
    80002b8c:	724080e7          	jalr	1828(ra) # 800032ac <panic>

0000000080002b90 <clockintr>:
    80002b90:	fe010113          	addi	sp,sp,-32
    80002b94:	00813823          	sd	s0,16(sp)
    80002b98:	00913423          	sd	s1,8(sp)
    80002b9c:	00113c23          	sd	ra,24(sp)
    80002ba0:	02010413          	addi	s0,sp,32
    80002ba4:	00004497          	auipc	s1,0x4
    80002ba8:	e1c48493          	addi	s1,s1,-484 # 800069c0 <tickslock>
    80002bac:	00048513          	mv	a0,s1
    80002bb0:	00001097          	auipc	ra,0x1
    80002bb4:	42c080e7          	jalr	1068(ra) # 80003fdc <acquire>
    80002bb8:	00003717          	auipc	a4,0x3
    80002bbc:	cfc70713          	addi	a4,a4,-772 # 800058b4 <ticks>
    80002bc0:	00072783          	lw	a5,0(a4)
    80002bc4:	01013403          	ld	s0,16(sp)
    80002bc8:	01813083          	ld	ra,24(sp)
    80002bcc:	00048513          	mv	a0,s1
    80002bd0:	0017879b          	addiw	a5,a5,1
    80002bd4:	00813483          	ld	s1,8(sp)
    80002bd8:	00f72023          	sw	a5,0(a4)
    80002bdc:	02010113          	addi	sp,sp,32
    80002be0:	00001317          	auipc	t1,0x1
    80002be4:	4c830067          	jr	1224(t1) # 800040a8 <release>

0000000080002be8 <devintr>:
    80002be8:	142027f3          	csrr	a5,scause
    80002bec:	00000513          	li	a0,0
    80002bf0:	0007c463          	bltz	a5,80002bf8 <devintr+0x10>
    80002bf4:	00008067          	ret
    80002bf8:	fe010113          	addi	sp,sp,-32
    80002bfc:	00813823          	sd	s0,16(sp)
    80002c00:	00113c23          	sd	ra,24(sp)
    80002c04:	00913423          	sd	s1,8(sp)
    80002c08:	02010413          	addi	s0,sp,32
    80002c0c:	0ff7f713          	andi	a4,a5,255
    80002c10:	00900693          	li	a3,9
    80002c14:	04d70c63          	beq	a4,a3,80002c6c <devintr+0x84>
    80002c18:	fff00713          	li	a4,-1
    80002c1c:	03f71713          	slli	a4,a4,0x3f
    80002c20:	00170713          	addi	a4,a4,1
    80002c24:	00e78c63          	beq	a5,a4,80002c3c <devintr+0x54>
    80002c28:	01813083          	ld	ra,24(sp)
    80002c2c:	01013403          	ld	s0,16(sp)
    80002c30:	00813483          	ld	s1,8(sp)
    80002c34:	02010113          	addi	sp,sp,32
    80002c38:	00008067          	ret
    80002c3c:	00000097          	auipc	ra,0x0
    80002c40:	c8c080e7          	jalr	-884(ra) # 800028c8 <cpuid>
    80002c44:	06050663          	beqz	a0,80002cb0 <devintr+0xc8>
    80002c48:	144027f3          	csrr	a5,sip
    80002c4c:	ffd7f793          	andi	a5,a5,-3
    80002c50:	14479073          	csrw	sip,a5
    80002c54:	01813083          	ld	ra,24(sp)
    80002c58:	01013403          	ld	s0,16(sp)
    80002c5c:	00813483          	ld	s1,8(sp)
    80002c60:	00200513          	li	a0,2
    80002c64:	02010113          	addi	sp,sp,32
    80002c68:	00008067          	ret
    80002c6c:	00000097          	auipc	ra,0x0
    80002c70:	258080e7          	jalr	600(ra) # 80002ec4 <plic_claim>
    80002c74:	00a00793          	li	a5,10
    80002c78:	00050493          	mv	s1,a0
    80002c7c:	06f50663          	beq	a0,a5,80002ce8 <devintr+0x100>
    80002c80:	00100513          	li	a0,1
    80002c84:	fa0482e3          	beqz	s1,80002c28 <devintr+0x40>
    80002c88:	00048593          	mv	a1,s1
    80002c8c:	00002517          	auipc	a0,0x2
    80002c90:	46c50513          	addi	a0,a0,1132 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    80002c94:	00000097          	auipc	ra,0x0
    80002c98:	674080e7          	jalr	1652(ra) # 80003308 <__printf>
    80002c9c:	00048513          	mv	a0,s1
    80002ca0:	00000097          	auipc	ra,0x0
    80002ca4:	25c080e7          	jalr	604(ra) # 80002efc <plic_complete>
    80002ca8:	00100513          	li	a0,1
    80002cac:	f7dff06f          	j	80002c28 <devintr+0x40>
    80002cb0:	00004517          	auipc	a0,0x4
    80002cb4:	d1050513          	addi	a0,a0,-752 # 800069c0 <tickslock>
    80002cb8:	00001097          	auipc	ra,0x1
    80002cbc:	324080e7          	jalr	804(ra) # 80003fdc <acquire>
    80002cc0:	00003717          	auipc	a4,0x3
    80002cc4:	bf470713          	addi	a4,a4,-1036 # 800058b4 <ticks>
    80002cc8:	00072783          	lw	a5,0(a4)
    80002ccc:	00004517          	auipc	a0,0x4
    80002cd0:	cf450513          	addi	a0,a0,-780 # 800069c0 <tickslock>
    80002cd4:	0017879b          	addiw	a5,a5,1
    80002cd8:	00f72023          	sw	a5,0(a4)
    80002cdc:	00001097          	auipc	ra,0x1
    80002ce0:	3cc080e7          	jalr	972(ra) # 800040a8 <release>
    80002ce4:	f65ff06f          	j	80002c48 <devintr+0x60>
    80002ce8:	00001097          	auipc	ra,0x1
    80002cec:	f28080e7          	jalr	-216(ra) # 80003c10 <uartintr>
    80002cf0:	fadff06f          	j	80002c9c <devintr+0xb4>
	...

0000000080002d00 <kernelvec>:
    80002d00:	f0010113          	addi	sp,sp,-256
    80002d04:	00113023          	sd	ra,0(sp)
    80002d08:	00213423          	sd	sp,8(sp)
    80002d0c:	00313823          	sd	gp,16(sp)
    80002d10:	00413c23          	sd	tp,24(sp)
    80002d14:	02513023          	sd	t0,32(sp)
    80002d18:	02613423          	sd	t1,40(sp)
    80002d1c:	02713823          	sd	t2,48(sp)
    80002d20:	02813c23          	sd	s0,56(sp)
    80002d24:	04913023          	sd	s1,64(sp)
    80002d28:	04a13423          	sd	a0,72(sp)
    80002d2c:	04b13823          	sd	a1,80(sp)
    80002d30:	04c13c23          	sd	a2,88(sp)
    80002d34:	06d13023          	sd	a3,96(sp)
    80002d38:	06e13423          	sd	a4,104(sp)
    80002d3c:	06f13823          	sd	a5,112(sp)
    80002d40:	07013c23          	sd	a6,120(sp)
    80002d44:	09113023          	sd	a7,128(sp)
    80002d48:	09213423          	sd	s2,136(sp)
    80002d4c:	09313823          	sd	s3,144(sp)
    80002d50:	09413c23          	sd	s4,152(sp)
    80002d54:	0b513023          	sd	s5,160(sp)
    80002d58:	0b613423          	sd	s6,168(sp)
    80002d5c:	0b713823          	sd	s7,176(sp)
    80002d60:	0b813c23          	sd	s8,184(sp)
    80002d64:	0d913023          	sd	s9,192(sp)
    80002d68:	0da13423          	sd	s10,200(sp)
    80002d6c:	0db13823          	sd	s11,208(sp)
    80002d70:	0dc13c23          	sd	t3,216(sp)
    80002d74:	0fd13023          	sd	t4,224(sp)
    80002d78:	0fe13423          	sd	t5,232(sp)
    80002d7c:	0ff13823          	sd	t6,240(sp)
    80002d80:	cc9ff0ef          	jal	ra,80002a48 <kerneltrap>
    80002d84:	00013083          	ld	ra,0(sp)
    80002d88:	00813103          	ld	sp,8(sp)
    80002d8c:	01013183          	ld	gp,16(sp)
    80002d90:	02013283          	ld	t0,32(sp)
    80002d94:	02813303          	ld	t1,40(sp)
    80002d98:	03013383          	ld	t2,48(sp)
    80002d9c:	03813403          	ld	s0,56(sp)
    80002da0:	04013483          	ld	s1,64(sp)
    80002da4:	04813503          	ld	a0,72(sp)
    80002da8:	05013583          	ld	a1,80(sp)
    80002dac:	05813603          	ld	a2,88(sp)
    80002db0:	06013683          	ld	a3,96(sp)
    80002db4:	06813703          	ld	a4,104(sp)
    80002db8:	07013783          	ld	a5,112(sp)
    80002dbc:	07813803          	ld	a6,120(sp)
    80002dc0:	08013883          	ld	a7,128(sp)
    80002dc4:	08813903          	ld	s2,136(sp)
    80002dc8:	09013983          	ld	s3,144(sp)
    80002dcc:	09813a03          	ld	s4,152(sp)
    80002dd0:	0a013a83          	ld	s5,160(sp)
    80002dd4:	0a813b03          	ld	s6,168(sp)
    80002dd8:	0b013b83          	ld	s7,176(sp)
    80002ddc:	0b813c03          	ld	s8,184(sp)
    80002de0:	0c013c83          	ld	s9,192(sp)
    80002de4:	0c813d03          	ld	s10,200(sp)
    80002de8:	0d013d83          	ld	s11,208(sp)
    80002dec:	0d813e03          	ld	t3,216(sp)
    80002df0:	0e013e83          	ld	t4,224(sp)
    80002df4:	0e813f03          	ld	t5,232(sp)
    80002df8:	0f013f83          	ld	t6,240(sp)
    80002dfc:	10010113          	addi	sp,sp,256
    80002e00:	10200073          	sret
    80002e04:	00000013          	nop
    80002e08:	00000013          	nop
    80002e0c:	00000013          	nop

0000000080002e10 <timervec>:
    80002e10:	34051573          	csrrw	a0,mscratch,a0
    80002e14:	00b53023          	sd	a1,0(a0)
    80002e18:	00c53423          	sd	a2,8(a0)
    80002e1c:	00d53823          	sd	a3,16(a0)
    80002e20:	01853583          	ld	a1,24(a0)
    80002e24:	02053603          	ld	a2,32(a0)
    80002e28:	0005b683          	ld	a3,0(a1)
    80002e2c:	00c686b3          	add	a3,a3,a2
    80002e30:	00d5b023          	sd	a3,0(a1)
    80002e34:	00200593          	li	a1,2
    80002e38:	14459073          	csrw	sip,a1
    80002e3c:	01053683          	ld	a3,16(a0)
    80002e40:	00853603          	ld	a2,8(a0)
    80002e44:	00053583          	ld	a1,0(a0)
    80002e48:	34051573          	csrrw	a0,mscratch,a0
    80002e4c:	30200073          	mret

0000000080002e50 <plicinit>:
    80002e50:	ff010113          	addi	sp,sp,-16
    80002e54:	00813423          	sd	s0,8(sp)
    80002e58:	01010413          	addi	s0,sp,16
    80002e5c:	00813403          	ld	s0,8(sp)
    80002e60:	0c0007b7          	lui	a5,0xc000
    80002e64:	00100713          	li	a4,1
    80002e68:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002e6c:	00e7a223          	sw	a4,4(a5)
    80002e70:	01010113          	addi	sp,sp,16
    80002e74:	00008067          	ret

0000000080002e78 <plicinithart>:
    80002e78:	ff010113          	addi	sp,sp,-16
    80002e7c:	00813023          	sd	s0,0(sp)
    80002e80:	00113423          	sd	ra,8(sp)
    80002e84:	01010413          	addi	s0,sp,16
    80002e88:	00000097          	auipc	ra,0x0
    80002e8c:	a40080e7          	jalr	-1472(ra) # 800028c8 <cpuid>
    80002e90:	0085171b          	slliw	a4,a0,0x8
    80002e94:	0c0027b7          	lui	a5,0xc002
    80002e98:	00e787b3          	add	a5,a5,a4
    80002e9c:	40200713          	li	a4,1026
    80002ea0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002ea4:	00813083          	ld	ra,8(sp)
    80002ea8:	00013403          	ld	s0,0(sp)
    80002eac:	00d5151b          	slliw	a0,a0,0xd
    80002eb0:	0c2017b7          	lui	a5,0xc201
    80002eb4:	00a78533          	add	a0,a5,a0
    80002eb8:	00052023          	sw	zero,0(a0)
    80002ebc:	01010113          	addi	sp,sp,16
    80002ec0:	00008067          	ret

0000000080002ec4 <plic_claim>:
    80002ec4:	ff010113          	addi	sp,sp,-16
    80002ec8:	00813023          	sd	s0,0(sp)
    80002ecc:	00113423          	sd	ra,8(sp)
    80002ed0:	01010413          	addi	s0,sp,16
    80002ed4:	00000097          	auipc	ra,0x0
    80002ed8:	9f4080e7          	jalr	-1548(ra) # 800028c8 <cpuid>
    80002edc:	00813083          	ld	ra,8(sp)
    80002ee0:	00013403          	ld	s0,0(sp)
    80002ee4:	00d5151b          	slliw	a0,a0,0xd
    80002ee8:	0c2017b7          	lui	a5,0xc201
    80002eec:	00a78533          	add	a0,a5,a0
    80002ef0:	00452503          	lw	a0,4(a0)
    80002ef4:	01010113          	addi	sp,sp,16
    80002ef8:	00008067          	ret

0000000080002efc <plic_complete>:
    80002efc:	fe010113          	addi	sp,sp,-32
    80002f00:	00813823          	sd	s0,16(sp)
    80002f04:	00913423          	sd	s1,8(sp)
    80002f08:	00113c23          	sd	ra,24(sp)
    80002f0c:	02010413          	addi	s0,sp,32
    80002f10:	00050493          	mv	s1,a0
    80002f14:	00000097          	auipc	ra,0x0
    80002f18:	9b4080e7          	jalr	-1612(ra) # 800028c8 <cpuid>
    80002f1c:	01813083          	ld	ra,24(sp)
    80002f20:	01013403          	ld	s0,16(sp)
    80002f24:	00d5179b          	slliw	a5,a0,0xd
    80002f28:	0c201737          	lui	a4,0xc201
    80002f2c:	00f707b3          	add	a5,a4,a5
    80002f30:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002f34:	00813483          	ld	s1,8(sp)
    80002f38:	02010113          	addi	sp,sp,32
    80002f3c:	00008067          	ret

0000000080002f40 <consolewrite>:
    80002f40:	fb010113          	addi	sp,sp,-80
    80002f44:	04813023          	sd	s0,64(sp)
    80002f48:	04113423          	sd	ra,72(sp)
    80002f4c:	02913c23          	sd	s1,56(sp)
    80002f50:	03213823          	sd	s2,48(sp)
    80002f54:	03313423          	sd	s3,40(sp)
    80002f58:	03413023          	sd	s4,32(sp)
    80002f5c:	01513c23          	sd	s5,24(sp)
    80002f60:	05010413          	addi	s0,sp,80
    80002f64:	06c05c63          	blez	a2,80002fdc <consolewrite+0x9c>
    80002f68:	00060993          	mv	s3,a2
    80002f6c:	00050a13          	mv	s4,a0
    80002f70:	00058493          	mv	s1,a1
    80002f74:	00000913          	li	s2,0
    80002f78:	fff00a93          	li	s5,-1
    80002f7c:	01c0006f          	j	80002f98 <consolewrite+0x58>
    80002f80:	fbf44503          	lbu	a0,-65(s0)
    80002f84:	0019091b          	addiw	s2,s2,1
    80002f88:	00148493          	addi	s1,s1,1
    80002f8c:	00001097          	auipc	ra,0x1
    80002f90:	a9c080e7          	jalr	-1380(ra) # 80003a28 <uartputc>
    80002f94:	03298063          	beq	s3,s2,80002fb4 <consolewrite+0x74>
    80002f98:	00048613          	mv	a2,s1
    80002f9c:	00100693          	li	a3,1
    80002fa0:	000a0593          	mv	a1,s4
    80002fa4:	fbf40513          	addi	a0,s0,-65
    80002fa8:	00000097          	auipc	ra,0x0
    80002fac:	9d8080e7          	jalr	-1576(ra) # 80002980 <either_copyin>
    80002fb0:	fd5518e3          	bne	a0,s5,80002f80 <consolewrite+0x40>
    80002fb4:	04813083          	ld	ra,72(sp)
    80002fb8:	04013403          	ld	s0,64(sp)
    80002fbc:	03813483          	ld	s1,56(sp)
    80002fc0:	02813983          	ld	s3,40(sp)
    80002fc4:	02013a03          	ld	s4,32(sp)
    80002fc8:	01813a83          	ld	s5,24(sp)
    80002fcc:	00090513          	mv	a0,s2
    80002fd0:	03013903          	ld	s2,48(sp)
    80002fd4:	05010113          	addi	sp,sp,80
    80002fd8:	00008067          	ret
    80002fdc:	00000913          	li	s2,0
    80002fe0:	fd5ff06f          	j	80002fb4 <consolewrite+0x74>

0000000080002fe4 <consoleread>:
    80002fe4:	f9010113          	addi	sp,sp,-112
    80002fe8:	06813023          	sd	s0,96(sp)
    80002fec:	04913c23          	sd	s1,88(sp)
    80002ff0:	05213823          	sd	s2,80(sp)
    80002ff4:	05313423          	sd	s3,72(sp)
    80002ff8:	05413023          	sd	s4,64(sp)
    80002ffc:	03513c23          	sd	s5,56(sp)
    80003000:	03613823          	sd	s6,48(sp)
    80003004:	03713423          	sd	s7,40(sp)
    80003008:	03813023          	sd	s8,32(sp)
    8000300c:	06113423          	sd	ra,104(sp)
    80003010:	01913c23          	sd	s9,24(sp)
    80003014:	07010413          	addi	s0,sp,112
    80003018:	00060b93          	mv	s7,a2
    8000301c:	00050913          	mv	s2,a0
    80003020:	00058c13          	mv	s8,a1
    80003024:	00060b1b          	sext.w	s6,a2
    80003028:	00004497          	auipc	s1,0x4
    8000302c:	9c048493          	addi	s1,s1,-1600 # 800069e8 <cons>
    80003030:	00400993          	li	s3,4
    80003034:	fff00a13          	li	s4,-1
    80003038:	00a00a93          	li	s5,10
    8000303c:	05705e63          	blez	s7,80003098 <consoleread+0xb4>
    80003040:	09c4a703          	lw	a4,156(s1)
    80003044:	0984a783          	lw	a5,152(s1)
    80003048:	0007071b          	sext.w	a4,a4
    8000304c:	08e78463          	beq	a5,a4,800030d4 <consoleread+0xf0>
    80003050:	07f7f713          	andi	a4,a5,127
    80003054:	00e48733          	add	a4,s1,a4
    80003058:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000305c:	0017869b          	addiw	a3,a5,1
    80003060:	08d4ac23          	sw	a3,152(s1)
    80003064:	00070c9b          	sext.w	s9,a4
    80003068:	0b370663          	beq	a4,s3,80003114 <consoleread+0x130>
    8000306c:	00100693          	li	a3,1
    80003070:	f9f40613          	addi	a2,s0,-97
    80003074:	000c0593          	mv	a1,s8
    80003078:	00090513          	mv	a0,s2
    8000307c:	f8e40fa3          	sb	a4,-97(s0)
    80003080:	00000097          	auipc	ra,0x0
    80003084:	8b4080e7          	jalr	-1868(ra) # 80002934 <either_copyout>
    80003088:	01450863          	beq	a0,s4,80003098 <consoleread+0xb4>
    8000308c:	001c0c13          	addi	s8,s8,1
    80003090:	fffb8b9b          	addiw	s7,s7,-1
    80003094:	fb5c94e3          	bne	s9,s5,8000303c <consoleread+0x58>
    80003098:	000b851b          	sext.w	a0,s7
    8000309c:	06813083          	ld	ra,104(sp)
    800030a0:	06013403          	ld	s0,96(sp)
    800030a4:	05813483          	ld	s1,88(sp)
    800030a8:	05013903          	ld	s2,80(sp)
    800030ac:	04813983          	ld	s3,72(sp)
    800030b0:	04013a03          	ld	s4,64(sp)
    800030b4:	03813a83          	ld	s5,56(sp)
    800030b8:	02813b83          	ld	s7,40(sp)
    800030bc:	02013c03          	ld	s8,32(sp)
    800030c0:	01813c83          	ld	s9,24(sp)
    800030c4:	40ab053b          	subw	a0,s6,a0
    800030c8:	03013b03          	ld	s6,48(sp)
    800030cc:	07010113          	addi	sp,sp,112
    800030d0:	00008067          	ret
    800030d4:	00001097          	auipc	ra,0x1
    800030d8:	1d8080e7          	jalr	472(ra) # 800042ac <push_on>
    800030dc:	0984a703          	lw	a4,152(s1)
    800030e0:	09c4a783          	lw	a5,156(s1)
    800030e4:	0007879b          	sext.w	a5,a5
    800030e8:	fef70ce3          	beq	a4,a5,800030e0 <consoleread+0xfc>
    800030ec:	00001097          	auipc	ra,0x1
    800030f0:	234080e7          	jalr	564(ra) # 80004320 <pop_on>
    800030f4:	0984a783          	lw	a5,152(s1)
    800030f8:	07f7f713          	andi	a4,a5,127
    800030fc:	00e48733          	add	a4,s1,a4
    80003100:	01874703          	lbu	a4,24(a4)
    80003104:	0017869b          	addiw	a3,a5,1
    80003108:	08d4ac23          	sw	a3,152(s1)
    8000310c:	00070c9b          	sext.w	s9,a4
    80003110:	f5371ee3          	bne	a4,s3,8000306c <consoleread+0x88>
    80003114:	000b851b          	sext.w	a0,s7
    80003118:	f96bf2e3          	bgeu	s7,s6,8000309c <consoleread+0xb8>
    8000311c:	08f4ac23          	sw	a5,152(s1)
    80003120:	f7dff06f          	j	8000309c <consoleread+0xb8>

0000000080003124 <consputc>:
    80003124:	10000793          	li	a5,256
    80003128:	00f50663          	beq	a0,a5,80003134 <consputc+0x10>
    8000312c:	00001317          	auipc	t1,0x1
    80003130:	9f430067          	jr	-1548(t1) # 80003b20 <uartputc_sync>
    80003134:	ff010113          	addi	sp,sp,-16
    80003138:	00113423          	sd	ra,8(sp)
    8000313c:	00813023          	sd	s0,0(sp)
    80003140:	01010413          	addi	s0,sp,16
    80003144:	00800513          	li	a0,8
    80003148:	00001097          	auipc	ra,0x1
    8000314c:	9d8080e7          	jalr	-1576(ra) # 80003b20 <uartputc_sync>
    80003150:	02000513          	li	a0,32
    80003154:	00001097          	auipc	ra,0x1
    80003158:	9cc080e7          	jalr	-1588(ra) # 80003b20 <uartputc_sync>
    8000315c:	00013403          	ld	s0,0(sp)
    80003160:	00813083          	ld	ra,8(sp)
    80003164:	00800513          	li	a0,8
    80003168:	01010113          	addi	sp,sp,16
    8000316c:	00001317          	auipc	t1,0x1
    80003170:	9b430067          	jr	-1612(t1) # 80003b20 <uartputc_sync>

0000000080003174 <consoleintr>:
    80003174:	fe010113          	addi	sp,sp,-32
    80003178:	00813823          	sd	s0,16(sp)
    8000317c:	00913423          	sd	s1,8(sp)
    80003180:	01213023          	sd	s2,0(sp)
    80003184:	00113c23          	sd	ra,24(sp)
    80003188:	02010413          	addi	s0,sp,32
    8000318c:	00004917          	auipc	s2,0x4
    80003190:	85c90913          	addi	s2,s2,-1956 # 800069e8 <cons>
    80003194:	00050493          	mv	s1,a0
    80003198:	00090513          	mv	a0,s2
    8000319c:	00001097          	auipc	ra,0x1
    800031a0:	e40080e7          	jalr	-448(ra) # 80003fdc <acquire>
    800031a4:	02048c63          	beqz	s1,800031dc <consoleintr+0x68>
    800031a8:	0a092783          	lw	a5,160(s2)
    800031ac:	09892703          	lw	a4,152(s2)
    800031b0:	07f00693          	li	a3,127
    800031b4:	40e7873b          	subw	a4,a5,a4
    800031b8:	02e6e263          	bltu	a3,a4,800031dc <consoleintr+0x68>
    800031bc:	00d00713          	li	a4,13
    800031c0:	04e48063          	beq	s1,a4,80003200 <consoleintr+0x8c>
    800031c4:	07f7f713          	andi	a4,a5,127
    800031c8:	00e90733          	add	a4,s2,a4
    800031cc:	0017879b          	addiw	a5,a5,1
    800031d0:	0af92023          	sw	a5,160(s2)
    800031d4:	00970c23          	sb	s1,24(a4)
    800031d8:	08f92e23          	sw	a5,156(s2)
    800031dc:	01013403          	ld	s0,16(sp)
    800031e0:	01813083          	ld	ra,24(sp)
    800031e4:	00813483          	ld	s1,8(sp)
    800031e8:	00013903          	ld	s2,0(sp)
    800031ec:	00003517          	auipc	a0,0x3
    800031f0:	7fc50513          	addi	a0,a0,2044 # 800069e8 <cons>
    800031f4:	02010113          	addi	sp,sp,32
    800031f8:	00001317          	auipc	t1,0x1
    800031fc:	eb030067          	jr	-336(t1) # 800040a8 <release>
    80003200:	00a00493          	li	s1,10
    80003204:	fc1ff06f          	j	800031c4 <consoleintr+0x50>

0000000080003208 <consoleinit>:
    80003208:	fe010113          	addi	sp,sp,-32
    8000320c:	00113c23          	sd	ra,24(sp)
    80003210:	00813823          	sd	s0,16(sp)
    80003214:	00913423          	sd	s1,8(sp)
    80003218:	02010413          	addi	s0,sp,32
    8000321c:	00003497          	auipc	s1,0x3
    80003220:	7cc48493          	addi	s1,s1,1996 # 800069e8 <cons>
    80003224:	00048513          	mv	a0,s1
    80003228:	00002597          	auipc	a1,0x2
    8000322c:	f2858593          	addi	a1,a1,-216 # 80005150 <_ZN15MemoryAllocator11HEADER_SIZEE+0x130>
    80003230:	00001097          	auipc	ra,0x1
    80003234:	d88080e7          	jalr	-632(ra) # 80003fb8 <initlock>
    80003238:	00000097          	auipc	ra,0x0
    8000323c:	7ac080e7          	jalr	1964(ra) # 800039e4 <uartinit>
    80003240:	01813083          	ld	ra,24(sp)
    80003244:	01013403          	ld	s0,16(sp)
    80003248:	00000797          	auipc	a5,0x0
    8000324c:	d9c78793          	addi	a5,a5,-612 # 80002fe4 <consoleread>
    80003250:	0af4bc23          	sd	a5,184(s1)
    80003254:	00000797          	auipc	a5,0x0
    80003258:	cec78793          	addi	a5,a5,-788 # 80002f40 <consolewrite>
    8000325c:	0cf4b023          	sd	a5,192(s1)
    80003260:	00813483          	ld	s1,8(sp)
    80003264:	02010113          	addi	sp,sp,32
    80003268:	00008067          	ret

000000008000326c <console_read>:
    8000326c:	ff010113          	addi	sp,sp,-16
    80003270:	00813423          	sd	s0,8(sp)
    80003274:	01010413          	addi	s0,sp,16
    80003278:	00813403          	ld	s0,8(sp)
    8000327c:	00004317          	auipc	t1,0x4
    80003280:	82433303          	ld	t1,-2012(t1) # 80006aa0 <devsw+0x10>
    80003284:	01010113          	addi	sp,sp,16
    80003288:	00030067          	jr	t1

000000008000328c <console_write>:
    8000328c:	ff010113          	addi	sp,sp,-16
    80003290:	00813423          	sd	s0,8(sp)
    80003294:	01010413          	addi	s0,sp,16
    80003298:	00813403          	ld	s0,8(sp)
    8000329c:	00004317          	auipc	t1,0x4
    800032a0:	80c33303          	ld	t1,-2036(t1) # 80006aa8 <devsw+0x18>
    800032a4:	01010113          	addi	sp,sp,16
    800032a8:	00030067          	jr	t1

00000000800032ac <panic>:
    800032ac:	fe010113          	addi	sp,sp,-32
    800032b0:	00113c23          	sd	ra,24(sp)
    800032b4:	00813823          	sd	s0,16(sp)
    800032b8:	00913423          	sd	s1,8(sp)
    800032bc:	02010413          	addi	s0,sp,32
    800032c0:	00050493          	mv	s1,a0
    800032c4:	00002517          	auipc	a0,0x2
    800032c8:	e9450513          	addi	a0,a0,-364 # 80005158 <_ZN15MemoryAllocator11HEADER_SIZEE+0x138>
    800032cc:	00004797          	auipc	a5,0x4
    800032d0:	8607ae23          	sw	zero,-1924(a5) # 80006b48 <pr+0x18>
    800032d4:	00000097          	auipc	ra,0x0
    800032d8:	034080e7          	jalr	52(ra) # 80003308 <__printf>
    800032dc:	00048513          	mv	a0,s1
    800032e0:	00000097          	auipc	ra,0x0
    800032e4:	028080e7          	jalr	40(ra) # 80003308 <__printf>
    800032e8:	00002517          	auipc	a0,0x2
    800032ec:	e5050513          	addi	a0,a0,-432 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    800032f0:	00000097          	auipc	ra,0x0
    800032f4:	018080e7          	jalr	24(ra) # 80003308 <__printf>
    800032f8:	00100793          	li	a5,1
    800032fc:	00002717          	auipc	a4,0x2
    80003300:	5af72e23          	sw	a5,1468(a4) # 800058b8 <panicked>
    80003304:	0000006f          	j	80003304 <panic+0x58>

0000000080003308 <__printf>:
    80003308:	f3010113          	addi	sp,sp,-208
    8000330c:	08813023          	sd	s0,128(sp)
    80003310:	07313423          	sd	s3,104(sp)
    80003314:	09010413          	addi	s0,sp,144
    80003318:	05813023          	sd	s8,64(sp)
    8000331c:	08113423          	sd	ra,136(sp)
    80003320:	06913c23          	sd	s1,120(sp)
    80003324:	07213823          	sd	s2,112(sp)
    80003328:	07413023          	sd	s4,96(sp)
    8000332c:	05513c23          	sd	s5,88(sp)
    80003330:	05613823          	sd	s6,80(sp)
    80003334:	05713423          	sd	s7,72(sp)
    80003338:	03913c23          	sd	s9,56(sp)
    8000333c:	03a13823          	sd	s10,48(sp)
    80003340:	03b13423          	sd	s11,40(sp)
    80003344:	00003317          	auipc	t1,0x3
    80003348:	7ec30313          	addi	t1,t1,2028 # 80006b30 <pr>
    8000334c:	01832c03          	lw	s8,24(t1)
    80003350:	00b43423          	sd	a1,8(s0)
    80003354:	00c43823          	sd	a2,16(s0)
    80003358:	00d43c23          	sd	a3,24(s0)
    8000335c:	02e43023          	sd	a4,32(s0)
    80003360:	02f43423          	sd	a5,40(s0)
    80003364:	03043823          	sd	a6,48(s0)
    80003368:	03143c23          	sd	a7,56(s0)
    8000336c:	00050993          	mv	s3,a0
    80003370:	4a0c1663          	bnez	s8,8000381c <__printf+0x514>
    80003374:	60098c63          	beqz	s3,8000398c <__printf+0x684>
    80003378:	0009c503          	lbu	a0,0(s3)
    8000337c:	00840793          	addi	a5,s0,8
    80003380:	f6f43c23          	sd	a5,-136(s0)
    80003384:	00000493          	li	s1,0
    80003388:	22050063          	beqz	a0,800035a8 <__printf+0x2a0>
    8000338c:	00002a37          	lui	s4,0x2
    80003390:	00018ab7          	lui	s5,0x18
    80003394:	000f4b37          	lui	s6,0xf4
    80003398:	00989bb7          	lui	s7,0x989
    8000339c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800033a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800033a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800033a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800033ac:	00148c9b          	addiw	s9,s1,1
    800033b0:	02500793          	li	a5,37
    800033b4:	01998933          	add	s2,s3,s9
    800033b8:	38f51263          	bne	a0,a5,8000373c <__printf+0x434>
    800033bc:	00094783          	lbu	a5,0(s2)
    800033c0:	00078c9b          	sext.w	s9,a5
    800033c4:	1e078263          	beqz	a5,800035a8 <__printf+0x2a0>
    800033c8:	0024849b          	addiw	s1,s1,2
    800033cc:	07000713          	li	a4,112
    800033d0:	00998933          	add	s2,s3,s1
    800033d4:	38e78a63          	beq	a5,a4,80003768 <__printf+0x460>
    800033d8:	20f76863          	bltu	a4,a5,800035e8 <__printf+0x2e0>
    800033dc:	42a78863          	beq	a5,a0,8000380c <__printf+0x504>
    800033e0:	06400713          	li	a4,100
    800033e4:	40e79663          	bne	a5,a4,800037f0 <__printf+0x4e8>
    800033e8:	f7843783          	ld	a5,-136(s0)
    800033ec:	0007a603          	lw	a2,0(a5)
    800033f0:	00878793          	addi	a5,a5,8
    800033f4:	f6f43c23          	sd	a5,-136(s0)
    800033f8:	42064a63          	bltz	a2,8000382c <__printf+0x524>
    800033fc:	00a00713          	li	a4,10
    80003400:	02e677bb          	remuw	a5,a2,a4
    80003404:	00002d97          	auipc	s11,0x2
    80003408:	d7cd8d93          	addi	s11,s11,-644 # 80005180 <digits>
    8000340c:	00900593          	li	a1,9
    80003410:	0006051b          	sext.w	a0,a2
    80003414:	00000c93          	li	s9,0
    80003418:	02079793          	slli	a5,a5,0x20
    8000341c:	0207d793          	srli	a5,a5,0x20
    80003420:	00fd87b3          	add	a5,s11,a5
    80003424:	0007c783          	lbu	a5,0(a5)
    80003428:	02e656bb          	divuw	a3,a2,a4
    8000342c:	f8f40023          	sb	a5,-128(s0)
    80003430:	14c5d863          	bge	a1,a2,80003580 <__printf+0x278>
    80003434:	06300593          	li	a1,99
    80003438:	00100c93          	li	s9,1
    8000343c:	02e6f7bb          	remuw	a5,a3,a4
    80003440:	02079793          	slli	a5,a5,0x20
    80003444:	0207d793          	srli	a5,a5,0x20
    80003448:	00fd87b3          	add	a5,s11,a5
    8000344c:	0007c783          	lbu	a5,0(a5)
    80003450:	02e6d73b          	divuw	a4,a3,a4
    80003454:	f8f400a3          	sb	a5,-127(s0)
    80003458:	12a5f463          	bgeu	a1,a0,80003580 <__printf+0x278>
    8000345c:	00a00693          	li	a3,10
    80003460:	00900593          	li	a1,9
    80003464:	02d777bb          	remuw	a5,a4,a3
    80003468:	02079793          	slli	a5,a5,0x20
    8000346c:	0207d793          	srli	a5,a5,0x20
    80003470:	00fd87b3          	add	a5,s11,a5
    80003474:	0007c503          	lbu	a0,0(a5)
    80003478:	02d757bb          	divuw	a5,a4,a3
    8000347c:	f8a40123          	sb	a0,-126(s0)
    80003480:	48e5f263          	bgeu	a1,a4,80003904 <__printf+0x5fc>
    80003484:	06300513          	li	a0,99
    80003488:	02d7f5bb          	remuw	a1,a5,a3
    8000348c:	02059593          	slli	a1,a1,0x20
    80003490:	0205d593          	srli	a1,a1,0x20
    80003494:	00bd85b3          	add	a1,s11,a1
    80003498:	0005c583          	lbu	a1,0(a1)
    8000349c:	02d7d7bb          	divuw	a5,a5,a3
    800034a0:	f8b401a3          	sb	a1,-125(s0)
    800034a4:	48e57263          	bgeu	a0,a4,80003928 <__printf+0x620>
    800034a8:	3e700513          	li	a0,999
    800034ac:	02d7f5bb          	remuw	a1,a5,a3
    800034b0:	02059593          	slli	a1,a1,0x20
    800034b4:	0205d593          	srli	a1,a1,0x20
    800034b8:	00bd85b3          	add	a1,s11,a1
    800034bc:	0005c583          	lbu	a1,0(a1)
    800034c0:	02d7d7bb          	divuw	a5,a5,a3
    800034c4:	f8b40223          	sb	a1,-124(s0)
    800034c8:	46e57663          	bgeu	a0,a4,80003934 <__printf+0x62c>
    800034cc:	02d7f5bb          	remuw	a1,a5,a3
    800034d0:	02059593          	slli	a1,a1,0x20
    800034d4:	0205d593          	srli	a1,a1,0x20
    800034d8:	00bd85b3          	add	a1,s11,a1
    800034dc:	0005c583          	lbu	a1,0(a1)
    800034e0:	02d7d7bb          	divuw	a5,a5,a3
    800034e4:	f8b402a3          	sb	a1,-123(s0)
    800034e8:	46ea7863          	bgeu	s4,a4,80003958 <__printf+0x650>
    800034ec:	02d7f5bb          	remuw	a1,a5,a3
    800034f0:	02059593          	slli	a1,a1,0x20
    800034f4:	0205d593          	srli	a1,a1,0x20
    800034f8:	00bd85b3          	add	a1,s11,a1
    800034fc:	0005c583          	lbu	a1,0(a1)
    80003500:	02d7d7bb          	divuw	a5,a5,a3
    80003504:	f8b40323          	sb	a1,-122(s0)
    80003508:	3eeaf863          	bgeu	s5,a4,800038f8 <__printf+0x5f0>
    8000350c:	02d7f5bb          	remuw	a1,a5,a3
    80003510:	02059593          	slli	a1,a1,0x20
    80003514:	0205d593          	srli	a1,a1,0x20
    80003518:	00bd85b3          	add	a1,s11,a1
    8000351c:	0005c583          	lbu	a1,0(a1)
    80003520:	02d7d7bb          	divuw	a5,a5,a3
    80003524:	f8b403a3          	sb	a1,-121(s0)
    80003528:	42eb7e63          	bgeu	s6,a4,80003964 <__printf+0x65c>
    8000352c:	02d7f5bb          	remuw	a1,a5,a3
    80003530:	02059593          	slli	a1,a1,0x20
    80003534:	0205d593          	srli	a1,a1,0x20
    80003538:	00bd85b3          	add	a1,s11,a1
    8000353c:	0005c583          	lbu	a1,0(a1)
    80003540:	02d7d7bb          	divuw	a5,a5,a3
    80003544:	f8b40423          	sb	a1,-120(s0)
    80003548:	42ebfc63          	bgeu	s7,a4,80003980 <__printf+0x678>
    8000354c:	02079793          	slli	a5,a5,0x20
    80003550:	0207d793          	srli	a5,a5,0x20
    80003554:	00fd8db3          	add	s11,s11,a5
    80003558:	000dc703          	lbu	a4,0(s11)
    8000355c:	00a00793          	li	a5,10
    80003560:	00900c93          	li	s9,9
    80003564:	f8e404a3          	sb	a4,-119(s0)
    80003568:	00065c63          	bgez	a2,80003580 <__printf+0x278>
    8000356c:	f9040713          	addi	a4,s0,-112
    80003570:	00f70733          	add	a4,a4,a5
    80003574:	02d00693          	li	a3,45
    80003578:	fed70823          	sb	a3,-16(a4)
    8000357c:	00078c93          	mv	s9,a5
    80003580:	f8040793          	addi	a5,s0,-128
    80003584:	01978cb3          	add	s9,a5,s9
    80003588:	f7f40d13          	addi	s10,s0,-129
    8000358c:	000cc503          	lbu	a0,0(s9)
    80003590:	fffc8c93          	addi	s9,s9,-1
    80003594:	00000097          	auipc	ra,0x0
    80003598:	b90080e7          	jalr	-1136(ra) # 80003124 <consputc>
    8000359c:	ffac98e3          	bne	s9,s10,8000358c <__printf+0x284>
    800035a0:	00094503          	lbu	a0,0(s2)
    800035a4:	e00514e3          	bnez	a0,800033ac <__printf+0xa4>
    800035a8:	1a0c1663          	bnez	s8,80003754 <__printf+0x44c>
    800035ac:	08813083          	ld	ra,136(sp)
    800035b0:	08013403          	ld	s0,128(sp)
    800035b4:	07813483          	ld	s1,120(sp)
    800035b8:	07013903          	ld	s2,112(sp)
    800035bc:	06813983          	ld	s3,104(sp)
    800035c0:	06013a03          	ld	s4,96(sp)
    800035c4:	05813a83          	ld	s5,88(sp)
    800035c8:	05013b03          	ld	s6,80(sp)
    800035cc:	04813b83          	ld	s7,72(sp)
    800035d0:	04013c03          	ld	s8,64(sp)
    800035d4:	03813c83          	ld	s9,56(sp)
    800035d8:	03013d03          	ld	s10,48(sp)
    800035dc:	02813d83          	ld	s11,40(sp)
    800035e0:	0d010113          	addi	sp,sp,208
    800035e4:	00008067          	ret
    800035e8:	07300713          	li	a4,115
    800035ec:	1ce78a63          	beq	a5,a4,800037c0 <__printf+0x4b8>
    800035f0:	07800713          	li	a4,120
    800035f4:	1ee79e63          	bne	a5,a4,800037f0 <__printf+0x4e8>
    800035f8:	f7843783          	ld	a5,-136(s0)
    800035fc:	0007a703          	lw	a4,0(a5)
    80003600:	00878793          	addi	a5,a5,8
    80003604:	f6f43c23          	sd	a5,-136(s0)
    80003608:	28074263          	bltz	a4,8000388c <__printf+0x584>
    8000360c:	00002d97          	auipc	s11,0x2
    80003610:	b74d8d93          	addi	s11,s11,-1164 # 80005180 <digits>
    80003614:	00f77793          	andi	a5,a4,15
    80003618:	00fd87b3          	add	a5,s11,a5
    8000361c:	0007c683          	lbu	a3,0(a5)
    80003620:	00f00613          	li	a2,15
    80003624:	0007079b          	sext.w	a5,a4
    80003628:	f8d40023          	sb	a3,-128(s0)
    8000362c:	0047559b          	srliw	a1,a4,0x4
    80003630:	0047569b          	srliw	a3,a4,0x4
    80003634:	00000c93          	li	s9,0
    80003638:	0ee65063          	bge	a2,a4,80003718 <__printf+0x410>
    8000363c:	00f6f693          	andi	a3,a3,15
    80003640:	00dd86b3          	add	a3,s11,a3
    80003644:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003648:	0087d79b          	srliw	a5,a5,0x8
    8000364c:	00100c93          	li	s9,1
    80003650:	f8d400a3          	sb	a3,-127(s0)
    80003654:	0cb67263          	bgeu	a2,a1,80003718 <__printf+0x410>
    80003658:	00f7f693          	andi	a3,a5,15
    8000365c:	00dd86b3          	add	a3,s11,a3
    80003660:	0006c583          	lbu	a1,0(a3)
    80003664:	00f00613          	li	a2,15
    80003668:	0047d69b          	srliw	a3,a5,0x4
    8000366c:	f8b40123          	sb	a1,-126(s0)
    80003670:	0047d593          	srli	a1,a5,0x4
    80003674:	28f67e63          	bgeu	a2,a5,80003910 <__printf+0x608>
    80003678:	00f6f693          	andi	a3,a3,15
    8000367c:	00dd86b3          	add	a3,s11,a3
    80003680:	0006c503          	lbu	a0,0(a3)
    80003684:	0087d813          	srli	a6,a5,0x8
    80003688:	0087d69b          	srliw	a3,a5,0x8
    8000368c:	f8a401a3          	sb	a0,-125(s0)
    80003690:	28b67663          	bgeu	a2,a1,8000391c <__printf+0x614>
    80003694:	00f6f693          	andi	a3,a3,15
    80003698:	00dd86b3          	add	a3,s11,a3
    8000369c:	0006c583          	lbu	a1,0(a3)
    800036a0:	00c7d513          	srli	a0,a5,0xc
    800036a4:	00c7d69b          	srliw	a3,a5,0xc
    800036a8:	f8b40223          	sb	a1,-124(s0)
    800036ac:	29067a63          	bgeu	a2,a6,80003940 <__printf+0x638>
    800036b0:	00f6f693          	andi	a3,a3,15
    800036b4:	00dd86b3          	add	a3,s11,a3
    800036b8:	0006c583          	lbu	a1,0(a3)
    800036bc:	0107d813          	srli	a6,a5,0x10
    800036c0:	0107d69b          	srliw	a3,a5,0x10
    800036c4:	f8b402a3          	sb	a1,-123(s0)
    800036c8:	28a67263          	bgeu	a2,a0,8000394c <__printf+0x644>
    800036cc:	00f6f693          	andi	a3,a3,15
    800036d0:	00dd86b3          	add	a3,s11,a3
    800036d4:	0006c683          	lbu	a3,0(a3)
    800036d8:	0147d79b          	srliw	a5,a5,0x14
    800036dc:	f8d40323          	sb	a3,-122(s0)
    800036e0:	21067663          	bgeu	a2,a6,800038ec <__printf+0x5e4>
    800036e4:	02079793          	slli	a5,a5,0x20
    800036e8:	0207d793          	srli	a5,a5,0x20
    800036ec:	00fd8db3          	add	s11,s11,a5
    800036f0:	000dc683          	lbu	a3,0(s11)
    800036f4:	00800793          	li	a5,8
    800036f8:	00700c93          	li	s9,7
    800036fc:	f8d403a3          	sb	a3,-121(s0)
    80003700:	00075c63          	bgez	a4,80003718 <__printf+0x410>
    80003704:	f9040713          	addi	a4,s0,-112
    80003708:	00f70733          	add	a4,a4,a5
    8000370c:	02d00693          	li	a3,45
    80003710:	fed70823          	sb	a3,-16(a4)
    80003714:	00078c93          	mv	s9,a5
    80003718:	f8040793          	addi	a5,s0,-128
    8000371c:	01978cb3          	add	s9,a5,s9
    80003720:	f7f40d13          	addi	s10,s0,-129
    80003724:	000cc503          	lbu	a0,0(s9)
    80003728:	fffc8c93          	addi	s9,s9,-1
    8000372c:	00000097          	auipc	ra,0x0
    80003730:	9f8080e7          	jalr	-1544(ra) # 80003124 <consputc>
    80003734:	ff9d18e3          	bne	s10,s9,80003724 <__printf+0x41c>
    80003738:	0100006f          	j	80003748 <__printf+0x440>
    8000373c:	00000097          	auipc	ra,0x0
    80003740:	9e8080e7          	jalr	-1560(ra) # 80003124 <consputc>
    80003744:	000c8493          	mv	s1,s9
    80003748:	00094503          	lbu	a0,0(s2)
    8000374c:	c60510e3          	bnez	a0,800033ac <__printf+0xa4>
    80003750:	e40c0ee3          	beqz	s8,800035ac <__printf+0x2a4>
    80003754:	00003517          	auipc	a0,0x3
    80003758:	3dc50513          	addi	a0,a0,988 # 80006b30 <pr>
    8000375c:	00001097          	auipc	ra,0x1
    80003760:	94c080e7          	jalr	-1716(ra) # 800040a8 <release>
    80003764:	e49ff06f          	j	800035ac <__printf+0x2a4>
    80003768:	f7843783          	ld	a5,-136(s0)
    8000376c:	03000513          	li	a0,48
    80003770:	01000d13          	li	s10,16
    80003774:	00878713          	addi	a4,a5,8
    80003778:	0007bc83          	ld	s9,0(a5)
    8000377c:	f6e43c23          	sd	a4,-136(s0)
    80003780:	00000097          	auipc	ra,0x0
    80003784:	9a4080e7          	jalr	-1628(ra) # 80003124 <consputc>
    80003788:	07800513          	li	a0,120
    8000378c:	00000097          	auipc	ra,0x0
    80003790:	998080e7          	jalr	-1640(ra) # 80003124 <consputc>
    80003794:	00002d97          	auipc	s11,0x2
    80003798:	9ecd8d93          	addi	s11,s11,-1556 # 80005180 <digits>
    8000379c:	03ccd793          	srli	a5,s9,0x3c
    800037a0:	00fd87b3          	add	a5,s11,a5
    800037a4:	0007c503          	lbu	a0,0(a5)
    800037a8:	fffd0d1b          	addiw	s10,s10,-1
    800037ac:	004c9c93          	slli	s9,s9,0x4
    800037b0:	00000097          	auipc	ra,0x0
    800037b4:	974080e7          	jalr	-1676(ra) # 80003124 <consputc>
    800037b8:	fe0d12e3          	bnez	s10,8000379c <__printf+0x494>
    800037bc:	f8dff06f          	j	80003748 <__printf+0x440>
    800037c0:	f7843783          	ld	a5,-136(s0)
    800037c4:	0007bc83          	ld	s9,0(a5)
    800037c8:	00878793          	addi	a5,a5,8
    800037cc:	f6f43c23          	sd	a5,-136(s0)
    800037d0:	000c9a63          	bnez	s9,800037e4 <__printf+0x4dc>
    800037d4:	1080006f          	j	800038dc <__printf+0x5d4>
    800037d8:	001c8c93          	addi	s9,s9,1
    800037dc:	00000097          	auipc	ra,0x0
    800037e0:	948080e7          	jalr	-1720(ra) # 80003124 <consputc>
    800037e4:	000cc503          	lbu	a0,0(s9)
    800037e8:	fe0518e3          	bnez	a0,800037d8 <__printf+0x4d0>
    800037ec:	f5dff06f          	j	80003748 <__printf+0x440>
    800037f0:	02500513          	li	a0,37
    800037f4:	00000097          	auipc	ra,0x0
    800037f8:	930080e7          	jalr	-1744(ra) # 80003124 <consputc>
    800037fc:	000c8513          	mv	a0,s9
    80003800:	00000097          	auipc	ra,0x0
    80003804:	924080e7          	jalr	-1756(ra) # 80003124 <consputc>
    80003808:	f41ff06f          	j	80003748 <__printf+0x440>
    8000380c:	02500513          	li	a0,37
    80003810:	00000097          	auipc	ra,0x0
    80003814:	914080e7          	jalr	-1772(ra) # 80003124 <consputc>
    80003818:	f31ff06f          	j	80003748 <__printf+0x440>
    8000381c:	00030513          	mv	a0,t1
    80003820:	00000097          	auipc	ra,0x0
    80003824:	7bc080e7          	jalr	1980(ra) # 80003fdc <acquire>
    80003828:	b4dff06f          	j	80003374 <__printf+0x6c>
    8000382c:	40c0053b          	negw	a0,a2
    80003830:	00a00713          	li	a4,10
    80003834:	02e576bb          	remuw	a3,a0,a4
    80003838:	00002d97          	auipc	s11,0x2
    8000383c:	948d8d93          	addi	s11,s11,-1720 # 80005180 <digits>
    80003840:	ff700593          	li	a1,-9
    80003844:	02069693          	slli	a3,a3,0x20
    80003848:	0206d693          	srli	a3,a3,0x20
    8000384c:	00dd86b3          	add	a3,s11,a3
    80003850:	0006c683          	lbu	a3,0(a3)
    80003854:	02e557bb          	divuw	a5,a0,a4
    80003858:	f8d40023          	sb	a3,-128(s0)
    8000385c:	10b65e63          	bge	a2,a1,80003978 <__printf+0x670>
    80003860:	06300593          	li	a1,99
    80003864:	02e7f6bb          	remuw	a3,a5,a4
    80003868:	02069693          	slli	a3,a3,0x20
    8000386c:	0206d693          	srli	a3,a3,0x20
    80003870:	00dd86b3          	add	a3,s11,a3
    80003874:	0006c683          	lbu	a3,0(a3)
    80003878:	02e7d73b          	divuw	a4,a5,a4
    8000387c:	00200793          	li	a5,2
    80003880:	f8d400a3          	sb	a3,-127(s0)
    80003884:	bca5ece3          	bltu	a1,a0,8000345c <__printf+0x154>
    80003888:	ce5ff06f          	j	8000356c <__printf+0x264>
    8000388c:	40e007bb          	negw	a5,a4
    80003890:	00002d97          	auipc	s11,0x2
    80003894:	8f0d8d93          	addi	s11,s11,-1808 # 80005180 <digits>
    80003898:	00f7f693          	andi	a3,a5,15
    8000389c:	00dd86b3          	add	a3,s11,a3
    800038a0:	0006c583          	lbu	a1,0(a3)
    800038a4:	ff100613          	li	a2,-15
    800038a8:	0047d69b          	srliw	a3,a5,0x4
    800038ac:	f8b40023          	sb	a1,-128(s0)
    800038b0:	0047d59b          	srliw	a1,a5,0x4
    800038b4:	0ac75e63          	bge	a4,a2,80003970 <__printf+0x668>
    800038b8:	00f6f693          	andi	a3,a3,15
    800038bc:	00dd86b3          	add	a3,s11,a3
    800038c0:	0006c603          	lbu	a2,0(a3)
    800038c4:	00f00693          	li	a3,15
    800038c8:	0087d79b          	srliw	a5,a5,0x8
    800038cc:	f8c400a3          	sb	a2,-127(s0)
    800038d0:	d8b6e4e3          	bltu	a3,a1,80003658 <__printf+0x350>
    800038d4:	00200793          	li	a5,2
    800038d8:	e2dff06f          	j	80003704 <__printf+0x3fc>
    800038dc:	00002c97          	auipc	s9,0x2
    800038e0:	884c8c93          	addi	s9,s9,-1916 # 80005160 <_ZN15MemoryAllocator11HEADER_SIZEE+0x140>
    800038e4:	02800513          	li	a0,40
    800038e8:	ef1ff06f          	j	800037d8 <__printf+0x4d0>
    800038ec:	00700793          	li	a5,7
    800038f0:	00600c93          	li	s9,6
    800038f4:	e0dff06f          	j	80003700 <__printf+0x3f8>
    800038f8:	00700793          	li	a5,7
    800038fc:	00600c93          	li	s9,6
    80003900:	c69ff06f          	j	80003568 <__printf+0x260>
    80003904:	00300793          	li	a5,3
    80003908:	00200c93          	li	s9,2
    8000390c:	c5dff06f          	j	80003568 <__printf+0x260>
    80003910:	00300793          	li	a5,3
    80003914:	00200c93          	li	s9,2
    80003918:	de9ff06f          	j	80003700 <__printf+0x3f8>
    8000391c:	00400793          	li	a5,4
    80003920:	00300c93          	li	s9,3
    80003924:	dddff06f          	j	80003700 <__printf+0x3f8>
    80003928:	00400793          	li	a5,4
    8000392c:	00300c93          	li	s9,3
    80003930:	c39ff06f          	j	80003568 <__printf+0x260>
    80003934:	00500793          	li	a5,5
    80003938:	00400c93          	li	s9,4
    8000393c:	c2dff06f          	j	80003568 <__printf+0x260>
    80003940:	00500793          	li	a5,5
    80003944:	00400c93          	li	s9,4
    80003948:	db9ff06f          	j	80003700 <__printf+0x3f8>
    8000394c:	00600793          	li	a5,6
    80003950:	00500c93          	li	s9,5
    80003954:	dadff06f          	j	80003700 <__printf+0x3f8>
    80003958:	00600793          	li	a5,6
    8000395c:	00500c93          	li	s9,5
    80003960:	c09ff06f          	j	80003568 <__printf+0x260>
    80003964:	00800793          	li	a5,8
    80003968:	00700c93          	li	s9,7
    8000396c:	bfdff06f          	j	80003568 <__printf+0x260>
    80003970:	00100793          	li	a5,1
    80003974:	d91ff06f          	j	80003704 <__printf+0x3fc>
    80003978:	00100793          	li	a5,1
    8000397c:	bf1ff06f          	j	8000356c <__printf+0x264>
    80003980:	00900793          	li	a5,9
    80003984:	00800c93          	li	s9,8
    80003988:	be1ff06f          	j	80003568 <__printf+0x260>
    8000398c:	00001517          	auipc	a0,0x1
    80003990:	7dc50513          	addi	a0,a0,2012 # 80005168 <_ZN15MemoryAllocator11HEADER_SIZEE+0x148>
    80003994:	00000097          	auipc	ra,0x0
    80003998:	918080e7          	jalr	-1768(ra) # 800032ac <panic>

000000008000399c <printfinit>:
    8000399c:	fe010113          	addi	sp,sp,-32
    800039a0:	00813823          	sd	s0,16(sp)
    800039a4:	00913423          	sd	s1,8(sp)
    800039a8:	00113c23          	sd	ra,24(sp)
    800039ac:	02010413          	addi	s0,sp,32
    800039b0:	00003497          	auipc	s1,0x3
    800039b4:	18048493          	addi	s1,s1,384 # 80006b30 <pr>
    800039b8:	00048513          	mv	a0,s1
    800039bc:	00001597          	auipc	a1,0x1
    800039c0:	7bc58593          	addi	a1,a1,1980 # 80005178 <_ZN15MemoryAllocator11HEADER_SIZEE+0x158>
    800039c4:	00000097          	auipc	ra,0x0
    800039c8:	5f4080e7          	jalr	1524(ra) # 80003fb8 <initlock>
    800039cc:	01813083          	ld	ra,24(sp)
    800039d0:	01013403          	ld	s0,16(sp)
    800039d4:	0004ac23          	sw	zero,24(s1)
    800039d8:	00813483          	ld	s1,8(sp)
    800039dc:	02010113          	addi	sp,sp,32
    800039e0:	00008067          	ret

00000000800039e4 <uartinit>:
    800039e4:	ff010113          	addi	sp,sp,-16
    800039e8:	00813423          	sd	s0,8(sp)
    800039ec:	01010413          	addi	s0,sp,16
    800039f0:	100007b7          	lui	a5,0x10000
    800039f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800039f8:	f8000713          	li	a4,-128
    800039fc:	00e781a3          	sb	a4,3(a5)
    80003a00:	00300713          	li	a4,3
    80003a04:	00e78023          	sb	a4,0(a5)
    80003a08:	000780a3          	sb	zero,1(a5)
    80003a0c:	00e781a3          	sb	a4,3(a5)
    80003a10:	00700693          	li	a3,7
    80003a14:	00d78123          	sb	a3,2(a5)
    80003a18:	00e780a3          	sb	a4,1(a5)
    80003a1c:	00813403          	ld	s0,8(sp)
    80003a20:	01010113          	addi	sp,sp,16
    80003a24:	00008067          	ret

0000000080003a28 <uartputc>:
    80003a28:	00002797          	auipc	a5,0x2
    80003a2c:	e907a783          	lw	a5,-368(a5) # 800058b8 <panicked>
    80003a30:	00078463          	beqz	a5,80003a38 <uartputc+0x10>
    80003a34:	0000006f          	j	80003a34 <uartputc+0xc>
    80003a38:	fd010113          	addi	sp,sp,-48
    80003a3c:	02813023          	sd	s0,32(sp)
    80003a40:	00913c23          	sd	s1,24(sp)
    80003a44:	01213823          	sd	s2,16(sp)
    80003a48:	01313423          	sd	s3,8(sp)
    80003a4c:	02113423          	sd	ra,40(sp)
    80003a50:	03010413          	addi	s0,sp,48
    80003a54:	00002917          	auipc	s2,0x2
    80003a58:	e6c90913          	addi	s2,s2,-404 # 800058c0 <uart_tx_r>
    80003a5c:	00093783          	ld	a5,0(s2)
    80003a60:	00002497          	auipc	s1,0x2
    80003a64:	e6848493          	addi	s1,s1,-408 # 800058c8 <uart_tx_w>
    80003a68:	0004b703          	ld	a4,0(s1)
    80003a6c:	02078693          	addi	a3,a5,32
    80003a70:	00050993          	mv	s3,a0
    80003a74:	02e69c63          	bne	a3,a4,80003aac <uartputc+0x84>
    80003a78:	00001097          	auipc	ra,0x1
    80003a7c:	834080e7          	jalr	-1996(ra) # 800042ac <push_on>
    80003a80:	00093783          	ld	a5,0(s2)
    80003a84:	0004b703          	ld	a4,0(s1)
    80003a88:	02078793          	addi	a5,a5,32
    80003a8c:	00e79463          	bne	a5,a4,80003a94 <uartputc+0x6c>
    80003a90:	0000006f          	j	80003a90 <uartputc+0x68>
    80003a94:	00001097          	auipc	ra,0x1
    80003a98:	88c080e7          	jalr	-1908(ra) # 80004320 <pop_on>
    80003a9c:	00093783          	ld	a5,0(s2)
    80003aa0:	0004b703          	ld	a4,0(s1)
    80003aa4:	02078693          	addi	a3,a5,32
    80003aa8:	fce688e3          	beq	a3,a4,80003a78 <uartputc+0x50>
    80003aac:	01f77693          	andi	a3,a4,31
    80003ab0:	00003597          	auipc	a1,0x3
    80003ab4:	0a058593          	addi	a1,a1,160 # 80006b50 <uart_tx_buf>
    80003ab8:	00d586b3          	add	a3,a1,a3
    80003abc:	00170713          	addi	a4,a4,1
    80003ac0:	01368023          	sb	s3,0(a3)
    80003ac4:	00e4b023          	sd	a4,0(s1)
    80003ac8:	10000637          	lui	a2,0x10000
    80003acc:	02f71063          	bne	a4,a5,80003aec <uartputc+0xc4>
    80003ad0:	0340006f          	j	80003b04 <uartputc+0xdc>
    80003ad4:	00074703          	lbu	a4,0(a4)
    80003ad8:	00f93023          	sd	a5,0(s2)
    80003adc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003ae0:	00093783          	ld	a5,0(s2)
    80003ae4:	0004b703          	ld	a4,0(s1)
    80003ae8:	00f70e63          	beq	a4,a5,80003b04 <uartputc+0xdc>
    80003aec:	00564683          	lbu	a3,5(a2)
    80003af0:	01f7f713          	andi	a4,a5,31
    80003af4:	00e58733          	add	a4,a1,a4
    80003af8:	0206f693          	andi	a3,a3,32
    80003afc:	00178793          	addi	a5,a5,1
    80003b00:	fc069ae3          	bnez	a3,80003ad4 <uartputc+0xac>
    80003b04:	02813083          	ld	ra,40(sp)
    80003b08:	02013403          	ld	s0,32(sp)
    80003b0c:	01813483          	ld	s1,24(sp)
    80003b10:	01013903          	ld	s2,16(sp)
    80003b14:	00813983          	ld	s3,8(sp)
    80003b18:	03010113          	addi	sp,sp,48
    80003b1c:	00008067          	ret

0000000080003b20 <uartputc_sync>:
    80003b20:	ff010113          	addi	sp,sp,-16
    80003b24:	00813423          	sd	s0,8(sp)
    80003b28:	01010413          	addi	s0,sp,16
    80003b2c:	00002717          	auipc	a4,0x2
    80003b30:	d8c72703          	lw	a4,-628(a4) # 800058b8 <panicked>
    80003b34:	02071663          	bnez	a4,80003b60 <uartputc_sync+0x40>
    80003b38:	00050793          	mv	a5,a0
    80003b3c:	100006b7          	lui	a3,0x10000
    80003b40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003b44:	02077713          	andi	a4,a4,32
    80003b48:	fe070ce3          	beqz	a4,80003b40 <uartputc_sync+0x20>
    80003b4c:	0ff7f793          	andi	a5,a5,255
    80003b50:	00f68023          	sb	a5,0(a3)
    80003b54:	00813403          	ld	s0,8(sp)
    80003b58:	01010113          	addi	sp,sp,16
    80003b5c:	00008067          	ret
    80003b60:	0000006f          	j	80003b60 <uartputc_sync+0x40>

0000000080003b64 <uartstart>:
    80003b64:	ff010113          	addi	sp,sp,-16
    80003b68:	00813423          	sd	s0,8(sp)
    80003b6c:	01010413          	addi	s0,sp,16
    80003b70:	00002617          	auipc	a2,0x2
    80003b74:	d5060613          	addi	a2,a2,-688 # 800058c0 <uart_tx_r>
    80003b78:	00002517          	auipc	a0,0x2
    80003b7c:	d5050513          	addi	a0,a0,-688 # 800058c8 <uart_tx_w>
    80003b80:	00063783          	ld	a5,0(a2)
    80003b84:	00053703          	ld	a4,0(a0)
    80003b88:	04f70263          	beq	a4,a5,80003bcc <uartstart+0x68>
    80003b8c:	100005b7          	lui	a1,0x10000
    80003b90:	00003817          	auipc	a6,0x3
    80003b94:	fc080813          	addi	a6,a6,-64 # 80006b50 <uart_tx_buf>
    80003b98:	01c0006f          	j	80003bb4 <uartstart+0x50>
    80003b9c:	0006c703          	lbu	a4,0(a3)
    80003ba0:	00f63023          	sd	a5,0(a2)
    80003ba4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003ba8:	00063783          	ld	a5,0(a2)
    80003bac:	00053703          	ld	a4,0(a0)
    80003bb0:	00f70e63          	beq	a4,a5,80003bcc <uartstart+0x68>
    80003bb4:	01f7f713          	andi	a4,a5,31
    80003bb8:	00e806b3          	add	a3,a6,a4
    80003bbc:	0055c703          	lbu	a4,5(a1)
    80003bc0:	00178793          	addi	a5,a5,1
    80003bc4:	02077713          	andi	a4,a4,32
    80003bc8:	fc071ae3          	bnez	a4,80003b9c <uartstart+0x38>
    80003bcc:	00813403          	ld	s0,8(sp)
    80003bd0:	01010113          	addi	sp,sp,16
    80003bd4:	00008067          	ret

0000000080003bd8 <uartgetc>:
    80003bd8:	ff010113          	addi	sp,sp,-16
    80003bdc:	00813423          	sd	s0,8(sp)
    80003be0:	01010413          	addi	s0,sp,16
    80003be4:	10000737          	lui	a4,0x10000
    80003be8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003bec:	0017f793          	andi	a5,a5,1
    80003bf0:	00078c63          	beqz	a5,80003c08 <uartgetc+0x30>
    80003bf4:	00074503          	lbu	a0,0(a4)
    80003bf8:	0ff57513          	andi	a0,a0,255
    80003bfc:	00813403          	ld	s0,8(sp)
    80003c00:	01010113          	addi	sp,sp,16
    80003c04:	00008067          	ret
    80003c08:	fff00513          	li	a0,-1
    80003c0c:	ff1ff06f          	j	80003bfc <uartgetc+0x24>

0000000080003c10 <uartintr>:
    80003c10:	100007b7          	lui	a5,0x10000
    80003c14:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003c18:	0017f793          	andi	a5,a5,1
    80003c1c:	0a078463          	beqz	a5,80003cc4 <uartintr+0xb4>
    80003c20:	fe010113          	addi	sp,sp,-32
    80003c24:	00813823          	sd	s0,16(sp)
    80003c28:	00913423          	sd	s1,8(sp)
    80003c2c:	00113c23          	sd	ra,24(sp)
    80003c30:	02010413          	addi	s0,sp,32
    80003c34:	100004b7          	lui	s1,0x10000
    80003c38:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003c3c:	0ff57513          	andi	a0,a0,255
    80003c40:	fffff097          	auipc	ra,0xfffff
    80003c44:	534080e7          	jalr	1332(ra) # 80003174 <consoleintr>
    80003c48:	0054c783          	lbu	a5,5(s1)
    80003c4c:	0017f793          	andi	a5,a5,1
    80003c50:	fe0794e3          	bnez	a5,80003c38 <uartintr+0x28>
    80003c54:	00002617          	auipc	a2,0x2
    80003c58:	c6c60613          	addi	a2,a2,-916 # 800058c0 <uart_tx_r>
    80003c5c:	00002517          	auipc	a0,0x2
    80003c60:	c6c50513          	addi	a0,a0,-916 # 800058c8 <uart_tx_w>
    80003c64:	00063783          	ld	a5,0(a2)
    80003c68:	00053703          	ld	a4,0(a0)
    80003c6c:	04f70263          	beq	a4,a5,80003cb0 <uartintr+0xa0>
    80003c70:	100005b7          	lui	a1,0x10000
    80003c74:	00003817          	auipc	a6,0x3
    80003c78:	edc80813          	addi	a6,a6,-292 # 80006b50 <uart_tx_buf>
    80003c7c:	01c0006f          	j	80003c98 <uartintr+0x88>
    80003c80:	0006c703          	lbu	a4,0(a3)
    80003c84:	00f63023          	sd	a5,0(a2)
    80003c88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003c8c:	00063783          	ld	a5,0(a2)
    80003c90:	00053703          	ld	a4,0(a0)
    80003c94:	00f70e63          	beq	a4,a5,80003cb0 <uartintr+0xa0>
    80003c98:	01f7f713          	andi	a4,a5,31
    80003c9c:	00e806b3          	add	a3,a6,a4
    80003ca0:	0055c703          	lbu	a4,5(a1)
    80003ca4:	00178793          	addi	a5,a5,1
    80003ca8:	02077713          	andi	a4,a4,32
    80003cac:	fc071ae3          	bnez	a4,80003c80 <uartintr+0x70>
    80003cb0:	01813083          	ld	ra,24(sp)
    80003cb4:	01013403          	ld	s0,16(sp)
    80003cb8:	00813483          	ld	s1,8(sp)
    80003cbc:	02010113          	addi	sp,sp,32
    80003cc0:	00008067          	ret
    80003cc4:	00002617          	auipc	a2,0x2
    80003cc8:	bfc60613          	addi	a2,a2,-1028 # 800058c0 <uart_tx_r>
    80003ccc:	00002517          	auipc	a0,0x2
    80003cd0:	bfc50513          	addi	a0,a0,-1028 # 800058c8 <uart_tx_w>
    80003cd4:	00063783          	ld	a5,0(a2)
    80003cd8:	00053703          	ld	a4,0(a0)
    80003cdc:	04f70263          	beq	a4,a5,80003d20 <uartintr+0x110>
    80003ce0:	100005b7          	lui	a1,0x10000
    80003ce4:	00003817          	auipc	a6,0x3
    80003ce8:	e6c80813          	addi	a6,a6,-404 # 80006b50 <uart_tx_buf>
    80003cec:	01c0006f          	j	80003d08 <uartintr+0xf8>
    80003cf0:	0006c703          	lbu	a4,0(a3)
    80003cf4:	00f63023          	sd	a5,0(a2)
    80003cf8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003cfc:	00063783          	ld	a5,0(a2)
    80003d00:	00053703          	ld	a4,0(a0)
    80003d04:	02f70063          	beq	a4,a5,80003d24 <uartintr+0x114>
    80003d08:	01f7f713          	andi	a4,a5,31
    80003d0c:	00e806b3          	add	a3,a6,a4
    80003d10:	0055c703          	lbu	a4,5(a1)
    80003d14:	00178793          	addi	a5,a5,1
    80003d18:	02077713          	andi	a4,a4,32
    80003d1c:	fc071ae3          	bnez	a4,80003cf0 <uartintr+0xe0>
    80003d20:	00008067          	ret
    80003d24:	00008067          	ret

0000000080003d28 <kinit>:
    80003d28:	fc010113          	addi	sp,sp,-64
    80003d2c:	02913423          	sd	s1,40(sp)
    80003d30:	fffff7b7          	lui	a5,0xfffff
    80003d34:	00004497          	auipc	s1,0x4
    80003d38:	e3b48493          	addi	s1,s1,-453 # 80007b6f <end+0xfff>
    80003d3c:	02813823          	sd	s0,48(sp)
    80003d40:	01313c23          	sd	s3,24(sp)
    80003d44:	00f4f4b3          	and	s1,s1,a5
    80003d48:	02113c23          	sd	ra,56(sp)
    80003d4c:	03213023          	sd	s2,32(sp)
    80003d50:	01413823          	sd	s4,16(sp)
    80003d54:	01513423          	sd	s5,8(sp)
    80003d58:	04010413          	addi	s0,sp,64
    80003d5c:	000017b7          	lui	a5,0x1
    80003d60:	01100993          	li	s3,17
    80003d64:	00f487b3          	add	a5,s1,a5
    80003d68:	01b99993          	slli	s3,s3,0x1b
    80003d6c:	06f9e063          	bltu	s3,a5,80003dcc <kinit+0xa4>
    80003d70:	00003a97          	auipc	s5,0x3
    80003d74:	e00a8a93          	addi	s5,s5,-512 # 80006b70 <end>
    80003d78:	0754ec63          	bltu	s1,s5,80003df0 <kinit+0xc8>
    80003d7c:	0734fa63          	bgeu	s1,s3,80003df0 <kinit+0xc8>
    80003d80:	00088a37          	lui	s4,0x88
    80003d84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003d88:	00002917          	auipc	s2,0x2
    80003d8c:	b4890913          	addi	s2,s2,-1208 # 800058d0 <kmem>
    80003d90:	00ca1a13          	slli	s4,s4,0xc
    80003d94:	0140006f          	j	80003da8 <kinit+0x80>
    80003d98:	000017b7          	lui	a5,0x1
    80003d9c:	00f484b3          	add	s1,s1,a5
    80003da0:	0554e863          	bltu	s1,s5,80003df0 <kinit+0xc8>
    80003da4:	0534f663          	bgeu	s1,s3,80003df0 <kinit+0xc8>
    80003da8:	00001637          	lui	a2,0x1
    80003dac:	00100593          	li	a1,1
    80003db0:	00048513          	mv	a0,s1
    80003db4:	00000097          	auipc	ra,0x0
    80003db8:	5e4080e7          	jalr	1508(ra) # 80004398 <__memset>
    80003dbc:	00093783          	ld	a5,0(s2)
    80003dc0:	00f4b023          	sd	a5,0(s1)
    80003dc4:	00993023          	sd	s1,0(s2)
    80003dc8:	fd4498e3          	bne	s1,s4,80003d98 <kinit+0x70>
    80003dcc:	03813083          	ld	ra,56(sp)
    80003dd0:	03013403          	ld	s0,48(sp)
    80003dd4:	02813483          	ld	s1,40(sp)
    80003dd8:	02013903          	ld	s2,32(sp)
    80003ddc:	01813983          	ld	s3,24(sp)
    80003de0:	01013a03          	ld	s4,16(sp)
    80003de4:	00813a83          	ld	s5,8(sp)
    80003de8:	04010113          	addi	sp,sp,64
    80003dec:	00008067          	ret
    80003df0:	00001517          	auipc	a0,0x1
    80003df4:	3a850513          	addi	a0,a0,936 # 80005198 <digits+0x18>
    80003df8:	fffff097          	auipc	ra,0xfffff
    80003dfc:	4b4080e7          	jalr	1204(ra) # 800032ac <panic>

0000000080003e00 <freerange>:
    80003e00:	fc010113          	addi	sp,sp,-64
    80003e04:	000017b7          	lui	a5,0x1
    80003e08:	02913423          	sd	s1,40(sp)
    80003e0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003e10:	009504b3          	add	s1,a0,s1
    80003e14:	fffff537          	lui	a0,0xfffff
    80003e18:	02813823          	sd	s0,48(sp)
    80003e1c:	02113c23          	sd	ra,56(sp)
    80003e20:	03213023          	sd	s2,32(sp)
    80003e24:	01313c23          	sd	s3,24(sp)
    80003e28:	01413823          	sd	s4,16(sp)
    80003e2c:	01513423          	sd	s5,8(sp)
    80003e30:	01613023          	sd	s6,0(sp)
    80003e34:	04010413          	addi	s0,sp,64
    80003e38:	00a4f4b3          	and	s1,s1,a0
    80003e3c:	00f487b3          	add	a5,s1,a5
    80003e40:	06f5e463          	bltu	a1,a5,80003ea8 <freerange+0xa8>
    80003e44:	00003a97          	auipc	s5,0x3
    80003e48:	d2ca8a93          	addi	s5,s5,-724 # 80006b70 <end>
    80003e4c:	0954e263          	bltu	s1,s5,80003ed0 <freerange+0xd0>
    80003e50:	01100993          	li	s3,17
    80003e54:	01b99993          	slli	s3,s3,0x1b
    80003e58:	0734fc63          	bgeu	s1,s3,80003ed0 <freerange+0xd0>
    80003e5c:	00058a13          	mv	s4,a1
    80003e60:	00002917          	auipc	s2,0x2
    80003e64:	a7090913          	addi	s2,s2,-1424 # 800058d0 <kmem>
    80003e68:	00002b37          	lui	s6,0x2
    80003e6c:	0140006f          	j	80003e80 <freerange+0x80>
    80003e70:	000017b7          	lui	a5,0x1
    80003e74:	00f484b3          	add	s1,s1,a5
    80003e78:	0554ec63          	bltu	s1,s5,80003ed0 <freerange+0xd0>
    80003e7c:	0534fa63          	bgeu	s1,s3,80003ed0 <freerange+0xd0>
    80003e80:	00001637          	lui	a2,0x1
    80003e84:	00100593          	li	a1,1
    80003e88:	00048513          	mv	a0,s1
    80003e8c:	00000097          	auipc	ra,0x0
    80003e90:	50c080e7          	jalr	1292(ra) # 80004398 <__memset>
    80003e94:	00093703          	ld	a4,0(s2)
    80003e98:	016487b3          	add	a5,s1,s6
    80003e9c:	00e4b023          	sd	a4,0(s1)
    80003ea0:	00993023          	sd	s1,0(s2)
    80003ea4:	fcfa76e3          	bgeu	s4,a5,80003e70 <freerange+0x70>
    80003ea8:	03813083          	ld	ra,56(sp)
    80003eac:	03013403          	ld	s0,48(sp)
    80003eb0:	02813483          	ld	s1,40(sp)
    80003eb4:	02013903          	ld	s2,32(sp)
    80003eb8:	01813983          	ld	s3,24(sp)
    80003ebc:	01013a03          	ld	s4,16(sp)
    80003ec0:	00813a83          	ld	s5,8(sp)
    80003ec4:	00013b03          	ld	s6,0(sp)
    80003ec8:	04010113          	addi	sp,sp,64
    80003ecc:	00008067          	ret
    80003ed0:	00001517          	auipc	a0,0x1
    80003ed4:	2c850513          	addi	a0,a0,712 # 80005198 <digits+0x18>
    80003ed8:	fffff097          	auipc	ra,0xfffff
    80003edc:	3d4080e7          	jalr	980(ra) # 800032ac <panic>

0000000080003ee0 <kfree>:
    80003ee0:	fe010113          	addi	sp,sp,-32
    80003ee4:	00813823          	sd	s0,16(sp)
    80003ee8:	00113c23          	sd	ra,24(sp)
    80003eec:	00913423          	sd	s1,8(sp)
    80003ef0:	02010413          	addi	s0,sp,32
    80003ef4:	03451793          	slli	a5,a0,0x34
    80003ef8:	04079c63          	bnez	a5,80003f50 <kfree+0x70>
    80003efc:	00003797          	auipc	a5,0x3
    80003f00:	c7478793          	addi	a5,a5,-908 # 80006b70 <end>
    80003f04:	00050493          	mv	s1,a0
    80003f08:	04f56463          	bltu	a0,a5,80003f50 <kfree+0x70>
    80003f0c:	01100793          	li	a5,17
    80003f10:	01b79793          	slli	a5,a5,0x1b
    80003f14:	02f57e63          	bgeu	a0,a5,80003f50 <kfree+0x70>
    80003f18:	00001637          	lui	a2,0x1
    80003f1c:	00100593          	li	a1,1
    80003f20:	00000097          	auipc	ra,0x0
    80003f24:	478080e7          	jalr	1144(ra) # 80004398 <__memset>
    80003f28:	00002797          	auipc	a5,0x2
    80003f2c:	9a878793          	addi	a5,a5,-1624 # 800058d0 <kmem>
    80003f30:	0007b703          	ld	a4,0(a5)
    80003f34:	01813083          	ld	ra,24(sp)
    80003f38:	01013403          	ld	s0,16(sp)
    80003f3c:	00e4b023          	sd	a4,0(s1)
    80003f40:	0097b023          	sd	s1,0(a5)
    80003f44:	00813483          	ld	s1,8(sp)
    80003f48:	02010113          	addi	sp,sp,32
    80003f4c:	00008067          	ret
    80003f50:	00001517          	auipc	a0,0x1
    80003f54:	24850513          	addi	a0,a0,584 # 80005198 <digits+0x18>
    80003f58:	fffff097          	auipc	ra,0xfffff
    80003f5c:	354080e7          	jalr	852(ra) # 800032ac <panic>

0000000080003f60 <kalloc>:
    80003f60:	fe010113          	addi	sp,sp,-32
    80003f64:	00813823          	sd	s0,16(sp)
    80003f68:	00913423          	sd	s1,8(sp)
    80003f6c:	00113c23          	sd	ra,24(sp)
    80003f70:	02010413          	addi	s0,sp,32
    80003f74:	00002797          	auipc	a5,0x2
    80003f78:	95c78793          	addi	a5,a5,-1700 # 800058d0 <kmem>
    80003f7c:	0007b483          	ld	s1,0(a5)
    80003f80:	02048063          	beqz	s1,80003fa0 <kalloc+0x40>
    80003f84:	0004b703          	ld	a4,0(s1)
    80003f88:	00001637          	lui	a2,0x1
    80003f8c:	00500593          	li	a1,5
    80003f90:	00048513          	mv	a0,s1
    80003f94:	00e7b023          	sd	a4,0(a5)
    80003f98:	00000097          	auipc	ra,0x0
    80003f9c:	400080e7          	jalr	1024(ra) # 80004398 <__memset>
    80003fa0:	01813083          	ld	ra,24(sp)
    80003fa4:	01013403          	ld	s0,16(sp)
    80003fa8:	00048513          	mv	a0,s1
    80003fac:	00813483          	ld	s1,8(sp)
    80003fb0:	02010113          	addi	sp,sp,32
    80003fb4:	00008067          	ret

0000000080003fb8 <initlock>:
    80003fb8:	ff010113          	addi	sp,sp,-16
    80003fbc:	00813423          	sd	s0,8(sp)
    80003fc0:	01010413          	addi	s0,sp,16
    80003fc4:	00813403          	ld	s0,8(sp)
    80003fc8:	00b53423          	sd	a1,8(a0)
    80003fcc:	00052023          	sw	zero,0(a0)
    80003fd0:	00053823          	sd	zero,16(a0)
    80003fd4:	01010113          	addi	sp,sp,16
    80003fd8:	00008067          	ret

0000000080003fdc <acquire>:
    80003fdc:	fe010113          	addi	sp,sp,-32
    80003fe0:	00813823          	sd	s0,16(sp)
    80003fe4:	00913423          	sd	s1,8(sp)
    80003fe8:	00113c23          	sd	ra,24(sp)
    80003fec:	01213023          	sd	s2,0(sp)
    80003ff0:	02010413          	addi	s0,sp,32
    80003ff4:	00050493          	mv	s1,a0
    80003ff8:	10002973          	csrr	s2,sstatus
    80003ffc:	100027f3          	csrr	a5,sstatus
    80004000:	ffd7f793          	andi	a5,a5,-3
    80004004:	10079073          	csrw	sstatus,a5
    80004008:	fffff097          	auipc	ra,0xfffff
    8000400c:	8e0080e7          	jalr	-1824(ra) # 800028e8 <mycpu>
    80004010:	07852783          	lw	a5,120(a0)
    80004014:	06078e63          	beqz	a5,80004090 <acquire+0xb4>
    80004018:	fffff097          	auipc	ra,0xfffff
    8000401c:	8d0080e7          	jalr	-1840(ra) # 800028e8 <mycpu>
    80004020:	07852783          	lw	a5,120(a0)
    80004024:	0004a703          	lw	a4,0(s1)
    80004028:	0017879b          	addiw	a5,a5,1
    8000402c:	06f52c23          	sw	a5,120(a0)
    80004030:	04071063          	bnez	a4,80004070 <acquire+0x94>
    80004034:	00100713          	li	a4,1
    80004038:	00070793          	mv	a5,a4
    8000403c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004040:	0007879b          	sext.w	a5,a5
    80004044:	fe079ae3          	bnez	a5,80004038 <acquire+0x5c>
    80004048:	0ff0000f          	fence
    8000404c:	fffff097          	auipc	ra,0xfffff
    80004050:	89c080e7          	jalr	-1892(ra) # 800028e8 <mycpu>
    80004054:	01813083          	ld	ra,24(sp)
    80004058:	01013403          	ld	s0,16(sp)
    8000405c:	00a4b823          	sd	a0,16(s1)
    80004060:	00013903          	ld	s2,0(sp)
    80004064:	00813483          	ld	s1,8(sp)
    80004068:	02010113          	addi	sp,sp,32
    8000406c:	00008067          	ret
    80004070:	0104b903          	ld	s2,16(s1)
    80004074:	fffff097          	auipc	ra,0xfffff
    80004078:	874080e7          	jalr	-1932(ra) # 800028e8 <mycpu>
    8000407c:	faa91ce3          	bne	s2,a0,80004034 <acquire+0x58>
    80004080:	00001517          	auipc	a0,0x1
    80004084:	12050513          	addi	a0,a0,288 # 800051a0 <digits+0x20>
    80004088:	fffff097          	auipc	ra,0xfffff
    8000408c:	224080e7          	jalr	548(ra) # 800032ac <panic>
    80004090:	00195913          	srli	s2,s2,0x1
    80004094:	fffff097          	auipc	ra,0xfffff
    80004098:	854080e7          	jalr	-1964(ra) # 800028e8 <mycpu>
    8000409c:	00197913          	andi	s2,s2,1
    800040a0:	07252e23          	sw	s2,124(a0)
    800040a4:	f75ff06f          	j	80004018 <acquire+0x3c>

00000000800040a8 <release>:
    800040a8:	fe010113          	addi	sp,sp,-32
    800040ac:	00813823          	sd	s0,16(sp)
    800040b0:	00113c23          	sd	ra,24(sp)
    800040b4:	00913423          	sd	s1,8(sp)
    800040b8:	01213023          	sd	s2,0(sp)
    800040bc:	02010413          	addi	s0,sp,32
    800040c0:	00052783          	lw	a5,0(a0)
    800040c4:	00079a63          	bnez	a5,800040d8 <release+0x30>
    800040c8:	00001517          	auipc	a0,0x1
    800040cc:	0e050513          	addi	a0,a0,224 # 800051a8 <digits+0x28>
    800040d0:	fffff097          	auipc	ra,0xfffff
    800040d4:	1dc080e7          	jalr	476(ra) # 800032ac <panic>
    800040d8:	01053903          	ld	s2,16(a0)
    800040dc:	00050493          	mv	s1,a0
    800040e0:	fffff097          	auipc	ra,0xfffff
    800040e4:	808080e7          	jalr	-2040(ra) # 800028e8 <mycpu>
    800040e8:	fea910e3          	bne	s2,a0,800040c8 <release+0x20>
    800040ec:	0004b823          	sd	zero,16(s1)
    800040f0:	0ff0000f          	fence
    800040f4:	0f50000f          	fence	iorw,ow
    800040f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800040fc:	ffffe097          	auipc	ra,0xffffe
    80004100:	7ec080e7          	jalr	2028(ra) # 800028e8 <mycpu>
    80004104:	100027f3          	csrr	a5,sstatus
    80004108:	0027f793          	andi	a5,a5,2
    8000410c:	04079a63          	bnez	a5,80004160 <release+0xb8>
    80004110:	07852783          	lw	a5,120(a0)
    80004114:	02f05e63          	blez	a5,80004150 <release+0xa8>
    80004118:	fff7871b          	addiw	a4,a5,-1
    8000411c:	06e52c23          	sw	a4,120(a0)
    80004120:	00071c63          	bnez	a4,80004138 <release+0x90>
    80004124:	07c52783          	lw	a5,124(a0)
    80004128:	00078863          	beqz	a5,80004138 <release+0x90>
    8000412c:	100027f3          	csrr	a5,sstatus
    80004130:	0027e793          	ori	a5,a5,2
    80004134:	10079073          	csrw	sstatus,a5
    80004138:	01813083          	ld	ra,24(sp)
    8000413c:	01013403          	ld	s0,16(sp)
    80004140:	00813483          	ld	s1,8(sp)
    80004144:	00013903          	ld	s2,0(sp)
    80004148:	02010113          	addi	sp,sp,32
    8000414c:	00008067          	ret
    80004150:	00001517          	auipc	a0,0x1
    80004154:	07850513          	addi	a0,a0,120 # 800051c8 <digits+0x48>
    80004158:	fffff097          	auipc	ra,0xfffff
    8000415c:	154080e7          	jalr	340(ra) # 800032ac <panic>
    80004160:	00001517          	auipc	a0,0x1
    80004164:	05050513          	addi	a0,a0,80 # 800051b0 <digits+0x30>
    80004168:	fffff097          	auipc	ra,0xfffff
    8000416c:	144080e7          	jalr	324(ra) # 800032ac <panic>

0000000080004170 <holding>:
    80004170:	00052783          	lw	a5,0(a0)
    80004174:	00079663          	bnez	a5,80004180 <holding+0x10>
    80004178:	00000513          	li	a0,0
    8000417c:	00008067          	ret
    80004180:	fe010113          	addi	sp,sp,-32
    80004184:	00813823          	sd	s0,16(sp)
    80004188:	00913423          	sd	s1,8(sp)
    8000418c:	00113c23          	sd	ra,24(sp)
    80004190:	02010413          	addi	s0,sp,32
    80004194:	01053483          	ld	s1,16(a0)
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	750080e7          	jalr	1872(ra) # 800028e8 <mycpu>
    800041a0:	01813083          	ld	ra,24(sp)
    800041a4:	01013403          	ld	s0,16(sp)
    800041a8:	40a48533          	sub	a0,s1,a0
    800041ac:	00153513          	seqz	a0,a0
    800041b0:	00813483          	ld	s1,8(sp)
    800041b4:	02010113          	addi	sp,sp,32
    800041b8:	00008067          	ret

00000000800041bc <push_off>:
    800041bc:	fe010113          	addi	sp,sp,-32
    800041c0:	00813823          	sd	s0,16(sp)
    800041c4:	00113c23          	sd	ra,24(sp)
    800041c8:	00913423          	sd	s1,8(sp)
    800041cc:	02010413          	addi	s0,sp,32
    800041d0:	100024f3          	csrr	s1,sstatus
    800041d4:	100027f3          	csrr	a5,sstatus
    800041d8:	ffd7f793          	andi	a5,a5,-3
    800041dc:	10079073          	csrw	sstatus,a5
    800041e0:	ffffe097          	auipc	ra,0xffffe
    800041e4:	708080e7          	jalr	1800(ra) # 800028e8 <mycpu>
    800041e8:	07852783          	lw	a5,120(a0)
    800041ec:	02078663          	beqz	a5,80004218 <push_off+0x5c>
    800041f0:	ffffe097          	auipc	ra,0xffffe
    800041f4:	6f8080e7          	jalr	1784(ra) # 800028e8 <mycpu>
    800041f8:	07852783          	lw	a5,120(a0)
    800041fc:	01813083          	ld	ra,24(sp)
    80004200:	01013403          	ld	s0,16(sp)
    80004204:	0017879b          	addiw	a5,a5,1
    80004208:	06f52c23          	sw	a5,120(a0)
    8000420c:	00813483          	ld	s1,8(sp)
    80004210:	02010113          	addi	sp,sp,32
    80004214:	00008067          	ret
    80004218:	0014d493          	srli	s1,s1,0x1
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	6cc080e7          	jalr	1740(ra) # 800028e8 <mycpu>
    80004224:	0014f493          	andi	s1,s1,1
    80004228:	06952e23          	sw	s1,124(a0)
    8000422c:	fc5ff06f          	j	800041f0 <push_off+0x34>

0000000080004230 <pop_off>:
    80004230:	ff010113          	addi	sp,sp,-16
    80004234:	00813023          	sd	s0,0(sp)
    80004238:	00113423          	sd	ra,8(sp)
    8000423c:	01010413          	addi	s0,sp,16
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	6a8080e7          	jalr	1704(ra) # 800028e8 <mycpu>
    80004248:	100027f3          	csrr	a5,sstatus
    8000424c:	0027f793          	andi	a5,a5,2
    80004250:	04079663          	bnez	a5,8000429c <pop_off+0x6c>
    80004254:	07852783          	lw	a5,120(a0)
    80004258:	02f05a63          	blez	a5,8000428c <pop_off+0x5c>
    8000425c:	fff7871b          	addiw	a4,a5,-1
    80004260:	06e52c23          	sw	a4,120(a0)
    80004264:	00071c63          	bnez	a4,8000427c <pop_off+0x4c>
    80004268:	07c52783          	lw	a5,124(a0)
    8000426c:	00078863          	beqz	a5,8000427c <pop_off+0x4c>
    80004270:	100027f3          	csrr	a5,sstatus
    80004274:	0027e793          	ori	a5,a5,2
    80004278:	10079073          	csrw	sstatus,a5
    8000427c:	00813083          	ld	ra,8(sp)
    80004280:	00013403          	ld	s0,0(sp)
    80004284:	01010113          	addi	sp,sp,16
    80004288:	00008067          	ret
    8000428c:	00001517          	auipc	a0,0x1
    80004290:	f3c50513          	addi	a0,a0,-196 # 800051c8 <digits+0x48>
    80004294:	fffff097          	auipc	ra,0xfffff
    80004298:	018080e7          	jalr	24(ra) # 800032ac <panic>
    8000429c:	00001517          	auipc	a0,0x1
    800042a0:	f1450513          	addi	a0,a0,-236 # 800051b0 <digits+0x30>
    800042a4:	fffff097          	auipc	ra,0xfffff
    800042a8:	008080e7          	jalr	8(ra) # 800032ac <panic>

00000000800042ac <push_on>:
    800042ac:	fe010113          	addi	sp,sp,-32
    800042b0:	00813823          	sd	s0,16(sp)
    800042b4:	00113c23          	sd	ra,24(sp)
    800042b8:	00913423          	sd	s1,8(sp)
    800042bc:	02010413          	addi	s0,sp,32
    800042c0:	100024f3          	csrr	s1,sstatus
    800042c4:	100027f3          	csrr	a5,sstatus
    800042c8:	0027e793          	ori	a5,a5,2
    800042cc:	10079073          	csrw	sstatus,a5
    800042d0:	ffffe097          	auipc	ra,0xffffe
    800042d4:	618080e7          	jalr	1560(ra) # 800028e8 <mycpu>
    800042d8:	07852783          	lw	a5,120(a0)
    800042dc:	02078663          	beqz	a5,80004308 <push_on+0x5c>
    800042e0:	ffffe097          	auipc	ra,0xffffe
    800042e4:	608080e7          	jalr	1544(ra) # 800028e8 <mycpu>
    800042e8:	07852783          	lw	a5,120(a0)
    800042ec:	01813083          	ld	ra,24(sp)
    800042f0:	01013403          	ld	s0,16(sp)
    800042f4:	0017879b          	addiw	a5,a5,1
    800042f8:	06f52c23          	sw	a5,120(a0)
    800042fc:	00813483          	ld	s1,8(sp)
    80004300:	02010113          	addi	sp,sp,32
    80004304:	00008067          	ret
    80004308:	0014d493          	srli	s1,s1,0x1
    8000430c:	ffffe097          	auipc	ra,0xffffe
    80004310:	5dc080e7          	jalr	1500(ra) # 800028e8 <mycpu>
    80004314:	0014f493          	andi	s1,s1,1
    80004318:	06952e23          	sw	s1,124(a0)
    8000431c:	fc5ff06f          	j	800042e0 <push_on+0x34>

0000000080004320 <pop_on>:
    80004320:	ff010113          	addi	sp,sp,-16
    80004324:	00813023          	sd	s0,0(sp)
    80004328:	00113423          	sd	ra,8(sp)
    8000432c:	01010413          	addi	s0,sp,16
    80004330:	ffffe097          	auipc	ra,0xffffe
    80004334:	5b8080e7          	jalr	1464(ra) # 800028e8 <mycpu>
    80004338:	100027f3          	csrr	a5,sstatus
    8000433c:	0027f793          	andi	a5,a5,2
    80004340:	04078463          	beqz	a5,80004388 <pop_on+0x68>
    80004344:	07852783          	lw	a5,120(a0)
    80004348:	02f05863          	blez	a5,80004378 <pop_on+0x58>
    8000434c:	fff7879b          	addiw	a5,a5,-1
    80004350:	06f52c23          	sw	a5,120(a0)
    80004354:	07853783          	ld	a5,120(a0)
    80004358:	00079863          	bnez	a5,80004368 <pop_on+0x48>
    8000435c:	100027f3          	csrr	a5,sstatus
    80004360:	ffd7f793          	andi	a5,a5,-3
    80004364:	10079073          	csrw	sstatus,a5
    80004368:	00813083          	ld	ra,8(sp)
    8000436c:	00013403          	ld	s0,0(sp)
    80004370:	01010113          	addi	sp,sp,16
    80004374:	00008067          	ret
    80004378:	00001517          	auipc	a0,0x1
    8000437c:	e7850513          	addi	a0,a0,-392 # 800051f0 <digits+0x70>
    80004380:	fffff097          	auipc	ra,0xfffff
    80004384:	f2c080e7          	jalr	-212(ra) # 800032ac <panic>
    80004388:	00001517          	auipc	a0,0x1
    8000438c:	e4850513          	addi	a0,a0,-440 # 800051d0 <digits+0x50>
    80004390:	fffff097          	auipc	ra,0xfffff
    80004394:	f1c080e7          	jalr	-228(ra) # 800032ac <panic>

0000000080004398 <__memset>:
    80004398:	ff010113          	addi	sp,sp,-16
    8000439c:	00813423          	sd	s0,8(sp)
    800043a0:	01010413          	addi	s0,sp,16
    800043a4:	1a060e63          	beqz	a2,80004560 <__memset+0x1c8>
    800043a8:	40a007b3          	neg	a5,a0
    800043ac:	0077f793          	andi	a5,a5,7
    800043b0:	00778693          	addi	a3,a5,7
    800043b4:	00b00813          	li	a6,11
    800043b8:	0ff5f593          	andi	a1,a1,255
    800043bc:	fff6071b          	addiw	a4,a2,-1
    800043c0:	1b06e663          	bltu	a3,a6,8000456c <__memset+0x1d4>
    800043c4:	1cd76463          	bltu	a4,a3,8000458c <__memset+0x1f4>
    800043c8:	1a078e63          	beqz	a5,80004584 <__memset+0x1ec>
    800043cc:	00b50023          	sb	a1,0(a0)
    800043d0:	00100713          	li	a4,1
    800043d4:	1ae78463          	beq	a5,a4,8000457c <__memset+0x1e4>
    800043d8:	00b500a3          	sb	a1,1(a0)
    800043dc:	00200713          	li	a4,2
    800043e0:	1ae78a63          	beq	a5,a4,80004594 <__memset+0x1fc>
    800043e4:	00b50123          	sb	a1,2(a0)
    800043e8:	00300713          	li	a4,3
    800043ec:	18e78463          	beq	a5,a4,80004574 <__memset+0x1dc>
    800043f0:	00b501a3          	sb	a1,3(a0)
    800043f4:	00400713          	li	a4,4
    800043f8:	1ae78263          	beq	a5,a4,8000459c <__memset+0x204>
    800043fc:	00b50223          	sb	a1,4(a0)
    80004400:	00500713          	li	a4,5
    80004404:	1ae78063          	beq	a5,a4,800045a4 <__memset+0x20c>
    80004408:	00b502a3          	sb	a1,5(a0)
    8000440c:	00700713          	li	a4,7
    80004410:	18e79e63          	bne	a5,a4,800045ac <__memset+0x214>
    80004414:	00b50323          	sb	a1,6(a0)
    80004418:	00700e93          	li	t4,7
    8000441c:	00859713          	slli	a4,a1,0x8
    80004420:	00e5e733          	or	a4,a1,a4
    80004424:	01059e13          	slli	t3,a1,0x10
    80004428:	01c76e33          	or	t3,a4,t3
    8000442c:	01859313          	slli	t1,a1,0x18
    80004430:	006e6333          	or	t1,t3,t1
    80004434:	02059893          	slli	a7,a1,0x20
    80004438:	40f60e3b          	subw	t3,a2,a5
    8000443c:	011368b3          	or	a7,t1,a7
    80004440:	02859813          	slli	a6,a1,0x28
    80004444:	0108e833          	or	a6,a7,a6
    80004448:	03059693          	slli	a3,a1,0x30
    8000444c:	003e589b          	srliw	a7,t3,0x3
    80004450:	00d866b3          	or	a3,a6,a3
    80004454:	03859713          	slli	a4,a1,0x38
    80004458:	00389813          	slli	a6,a7,0x3
    8000445c:	00f507b3          	add	a5,a0,a5
    80004460:	00e6e733          	or	a4,a3,a4
    80004464:	000e089b          	sext.w	a7,t3
    80004468:	00f806b3          	add	a3,a6,a5
    8000446c:	00e7b023          	sd	a4,0(a5)
    80004470:	00878793          	addi	a5,a5,8
    80004474:	fed79ce3          	bne	a5,a3,8000446c <__memset+0xd4>
    80004478:	ff8e7793          	andi	a5,t3,-8
    8000447c:	0007871b          	sext.w	a4,a5
    80004480:	01d787bb          	addw	a5,a5,t4
    80004484:	0ce88e63          	beq	a7,a4,80004560 <__memset+0x1c8>
    80004488:	00f50733          	add	a4,a0,a5
    8000448c:	00b70023          	sb	a1,0(a4)
    80004490:	0017871b          	addiw	a4,a5,1
    80004494:	0cc77663          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    80004498:	00e50733          	add	a4,a0,a4
    8000449c:	00b70023          	sb	a1,0(a4)
    800044a0:	0027871b          	addiw	a4,a5,2
    800044a4:	0ac77e63          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    800044a8:	00e50733          	add	a4,a0,a4
    800044ac:	00b70023          	sb	a1,0(a4)
    800044b0:	0037871b          	addiw	a4,a5,3
    800044b4:	0ac77663          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    800044b8:	00e50733          	add	a4,a0,a4
    800044bc:	00b70023          	sb	a1,0(a4)
    800044c0:	0047871b          	addiw	a4,a5,4
    800044c4:	08c77e63          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    800044c8:	00e50733          	add	a4,a0,a4
    800044cc:	00b70023          	sb	a1,0(a4)
    800044d0:	0057871b          	addiw	a4,a5,5
    800044d4:	08c77663          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    800044d8:	00e50733          	add	a4,a0,a4
    800044dc:	00b70023          	sb	a1,0(a4)
    800044e0:	0067871b          	addiw	a4,a5,6
    800044e4:	06c77e63          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    800044e8:	00e50733          	add	a4,a0,a4
    800044ec:	00b70023          	sb	a1,0(a4)
    800044f0:	0077871b          	addiw	a4,a5,7
    800044f4:	06c77663          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    800044f8:	00e50733          	add	a4,a0,a4
    800044fc:	00b70023          	sb	a1,0(a4)
    80004500:	0087871b          	addiw	a4,a5,8
    80004504:	04c77e63          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    80004508:	00e50733          	add	a4,a0,a4
    8000450c:	00b70023          	sb	a1,0(a4)
    80004510:	0097871b          	addiw	a4,a5,9
    80004514:	04c77663          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    80004518:	00e50733          	add	a4,a0,a4
    8000451c:	00b70023          	sb	a1,0(a4)
    80004520:	00a7871b          	addiw	a4,a5,10
    80004524:	02c77e63          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    80004528:	00e50733          	add	a4,a0,a4
    8000452c:	00b70023          	sb	a1,0(a4)
    80004530:	00b7871b          	addiw	a4,a5,11
    80004534:	02c77663          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    80004538:	00e50733          	add	a4,a0,a4
    8000453c:	00b70023          	sb	a1,0(a4)
    80004540:	00c7871b          	addiw	a4,a5,12
    80004544:	00c77e63          	bgeu	a4,a2,80004560 <__memset+0x1c8>
    80004548:	00e50733          	add	a4,a0,a4
    8000454c:	00b70023          	sb	a1,0(a4)
    80004550:	00d7879b          	addiw	a5,a5,13
    80004554:	00c7f663          	bgeu	a5,a2,80004560 <__memset+0x1c8>
    80004558:	00f507b3          	add	a5,a0,a5
    8000455c:	00b78023          	sb	a1,0(a5)
    80004560:	00813403          	ld	s0,8(sp)
    80004564:	01010113          	addi	sp,sp,16
    80004568:	00008067          	ret
    8000456c:	00b00693          	li	a3,11
    80004570:	e55ff06f          	j	800043c4 <__memset+0x2c>
    80004574:	00300e93          	li	t4,3
    80004578:	ea5ff06f          	j	8000441c <__memset+0x84>
    8000457c:	00100e93          	li	t4,1
    80004580:	e9dff06f          	j	8000441c <__memset+0x84>
    80004584:	00000e93          	li	t4,0
    80004588:	e95ff06f          	j	8000441c <__memset+0x84>
    8000458c:	00000793          	li	a5,0
    80004590:	ef9ff06f          	j	80004488 <__memset+0xf0>
    80004594:	00200e93          	li	t4,2
    80004598:	e85ff06f          	j	8000441c <__memset+0x84>
    8000459c:	00400e93          	li	t4,4
    800045a0:	e7dff06f          	j	8000441c <__memset+0x84>
    800045a4:	00500e93          	li	t4,5
    800045a8:	e75ff06f          	j	8000441c <__memset+0x84>
    800045ac:	00600e93          	li	t4,6
    800045b0:	e6dff06f          	j	8000441c <__memset+0x84>

00000000800045b4 <__memmove>:
    800045b4:	ff010113          	addi	sp,sp,-16
    800045b8:	00813423          	sd	s0,8(sp)
    800045bc:	01010413          	addi	s0,sp,16
    800045c0:	0e060863          	beqz	a2,800046b0 <__memmove+0xfc>
    800045c4:	fff6069b          	addiw	a3,a2,-1
    800045c8:	0006881b          	sext.w	a6,a3
    800045cc:	0ea5e863          	bltu	a1,a0,800046bc <__memmove+0x108>
    800045d0:	00758713          	addi	a4,a1,7
    800045d4:	00a5e7b3          	or	a5,a1,a0
    800045d8:	40a70733          	sub	a4,a4,a0
    800045dc:	0077f793          	andi	a5,a5,7
    800045e0:	00f73713          	sltiu	a4,a4,15
    800045e4:	00174713          	xori	a4,a4,1
    800045e8:	0017b793          	seqz	a5,a5
    800045ec:	00e7f7b3          	and	a5,a5,a4
    800045f0:	10078863          	beqz	a5,80004700 <__memmove+0x14c>
    800045f4:	00900793          	li	a5,9
    800045f8:	1107f463          	bgeu	a5,a6,80004700 <__memmove+0x14c>
    800045fc:	0036581b          	srliw	a6,a2,0x3
    80004600:	fff8081b          	addiw	a6,a6,-1
    80004604:	02081813          	slli	a6,a6,0x20
    80004608:	01d85893          	srli	a7,a6,0x1d
    8000460c:	00858813          	addi	a6,a1,8
    80004610:	00058793          	mv	a5,a1
    80004614:	00050713          	mv	a4,a0
    80004618:	01088833          	add	a6,a7,a6
    8000461c:	0007b883          	ld	a7,0(a5)
    80004620:	00878793          	addi	a5,a5,8
    80004624:	00870713          	addi	a4,a4,8
    80004628:	ff173c23          	sd	a7,-8(a4)
    8000462c:	ff0798e3          	bne	a5,a6,8000461c <__memmove+0x68>
    80004630:	ff867713          	andi	a4,a2,-8
    80004634:	02071793          	slli	a5,a4,0x20
    80004638:	0207d793          	srli	a5,a5,0x20
    8000463c:	00f585b3          	add	a1,a1,a5
    80004640:	40e686bb          	subw	a3,a3,a4
    80004644:	00f507b3          	add	a5,a0,a5
    80004648:	06e60463          	beq	a2,a4,800046b0 <__memmove+0xfc>
    8000464c:	0005c703          	lbu	a4,0(a1)
    80004650:	00e78023          	sb	a4,0(a5)
    80004654:	04068e63          	beqz	a3,800046b0 <__memmove+0xfc>
    80004658:	0015c603          	lbu	a2,1(a1)
    8000465c:	00100713          	li	a4,1
    80004660:	00c780a3          	sb	a2,1(a5)
    80004664:	04e68663          	beq	a3,a4,800046b0 <__memmove+0xfc>
    80004668:	0025c603          	lbu	a2,2(a1)
    8000466c:	00200713          	li	a4,2
    80004670:	00c78123          	sb	a2,2(a5)
    80004674:	02e68e63          	beq	a3,a4,800046b0 <__memmove+0xfc>
    80004678:	0035c603          	lbu	a2,3(a1)
    8000467c:	00300713          	li	a4,3
    80004680:	00c781a3          	sb	a2,3(a5)
    80004684:	02e68663          	beq	a3,a4,800046b0 <__memmove+0xfc>
    80004688:	0045c603          	lbu	a2,4(a1)
    8000468c:	00400713          	li	a4,4
    80004690:	00c78223          	sb	a2,4(a5)
    80004694:	00e68e63          	beq	a3,a4,800046b0 <__memmove+0xfc>
    80004698:	0055c603          	lbu	a2,5(a1)
    8000469c:	00500713          	li	a4,5
    800046a0:	00c782a3          	sb	a2,5(a5)
    800046a4:	00e68663          	beq	a3,a4,800046b0 <__memmove+0xfc>
    800046a8:	0065c703          	lbu	a4,6(a1)
    800046ac:	00e78323          	sb	a4,6(a5)
    800046b0:	00813403          	ld	s0,8(sp)
    800046b4:	01010113          	addi	sp,sp,16
    800046b8:	00008067          	ret
    800046bc:	02061713          	slli	a4,a2,0x20
    800046c0:	02075713          	srli	a4,a4,0x20
    800046c4:	00e587b3          	add	a5,a1,a4
    800046c8:	f0f574e3          	bgeu	a0,a5,800045d0 <__memmove+0x1c>
    800046cc:	02069613          	slli	a2,a3,0x20
    800046d0:	02065613          	srli	a2,a2,0x20
    800046d4:	fff64613          	not	a2,a2
    800046d8:	00e50733          	add	a4,a0,a4
    800046dc:	00c78633          	add	a2,a5,a2
    800046e0:	fff7c683          	lbu	a3,-1(a5)
    800046e4:	fff78793          	addi	a5,a5,-1
    800046e8:	fff70713          	addi	a4,a4,-1
    800046ec:	00d70023          	sb	a3,0(a4)
    800046f0:	fec798e3          	bne	a5,a2,800046e0 <__memmove+0x12c>
    800046f4:	00813403          	ld	s0,8(sp)
    800046f8:	01010113          	addi	sp,sp,16
    800046fc:	00008067          	ret
    80004700:	02069713          	slli	a4,a3,0x20
    80004704:	02075713          	srli	a4,a4,0x20
    80004708:	00170713          	addi	a4,a4,1
    8000470c:	00e50733          	add	a4,a0,a4
    80004710:	00050793          	mv	a5,a0
    80004714:	0005c683          	lbu	a3,0(a1)
    80004718:	00178793          	addi	a5,a5,1
    8000471c:	00158593          	addi	a1,a1,1
    80004720:	fed78fa3          	sb	a3,-1(a5)
    80004724:	fee798e3          	bne	a5,a4,80004714 <__memmove+0x160>
    80004728:	f89ff06f          	j	800046b0 <__memmove+0xfc>

000000008000472c <__putc>:
    8000472c:	fe010113          	addi	sp,sp,-32
    80004730:	00813823          	sd	s0,16(sp)
    80004734:	00113c23          	sd	ra,24(sp)
    80004738:	02010413          	addi	s0,sp,32
    8000473c:	00050793          	mv	a5,a0
    80004740:	fef40593          	addi	a1,s0,-17
    80004744:	00100613          	li	a2,1
    80004748:	00000513          	li	a0,0
    8000474c:	fef407a3          	sb	a5,-17(s0)
    80004750:	fffff097          	auipc	ra,0xfffff
    80004754:	b3c080e7          	jalr	-1220(ra) # 8000328c <console_write>
    80004758:	01813083          	ld	ra,24(sp)
    8000475c:	01013403          	ld	s0,16(sp)
    80004760:	02010113          	addi	sp,sp,32
    80004764:	00008067          	ret

0000000080004768 <__getc>:
    80004768:	fe010113          	addi	sp,sp,-32
    8000476c:	00813823          	sd	s0,16(sp)
    80004770:	00113c23          	sd	ra,24(sp)
    80004774:	02010413          	addi	s0,sp,32
    80004778:	fe840593          	addi	a1,s0,-24
    8000477c:	00100613          	li	a2,1
    80004780:	00000513          	li	a0,0
    80004784:	fffff097          	auipc	ra,0xfffff
    80004788:	ae8080e7          	jalr	-1304(ra) # 8000326c <console_read>
    8000478c:	fe844503          	lbu	a0,-24(s0)
    80004790:	01813083          	ld	ra,24(sp)
    80004794:	01013403          	ld	s0,16(sp)
    80004798:	02010113          	addi	sp,sp,32
    8000479c:	00008067          	ret

00000000800047a0 <console_handler>:
    800047a0:	fe010113          	addi	sp,sp,-32
    800047a4:	00813823          	sd	s0,16(sp)
    800047a8:	00113c23          	sd	ra,24(sp)
    800047ac:	00913423          	sd	s1,8(sp)
    800047b0:	02010413          	addi	s0,sp,32
    800047b4:	14202773          	csrr	a4,scause
    800047b8:	100027f3          	csrr	a5,sstatus
    800047bc:	0027f793          	andi	a5,a5,2
    800047c0:	06079e63          	bnez	a5,8000483c <console_handler+0x9c>
    800047c4:	00074c63          	bltz	a4,800047dc <console_handler+0x3c>
    800047c8:	01813083          	ld	ra,24(sp)
    800047cc:	01013403          	ld	s0,16(sp)
    800047d0:	00813483          	ld	s1,8(sp)
    800047d4:	02010113          	addi	sp,sp,32
    800047d8:	00008067          	ret
    800047dc:	0ff77713          	andi	a4,a4,255
    800047e0:	00900793          	li	a5,9
    800047e4:	fef712e3          	bne	a4,a5,800047c8 <console_handler+0x28>
    800047e8:	ffffe097          	auipc	ra,0xffffe
    800047ec:	6dc080e7          	jalr	1756(ra) # 80002ec4 <plic_claim>
    800047f0:	00a00793          	li	a5,10
    800047f4:	00050493          	mv	s1,a0
    800047f8:	02f50c63          	beq	a0,a5,80004830 <console_handler+0x90>
    800047fc:	fc0506e3          	beqz	a0,800047c8 <console_handler+0x28>
    80004800:	00050593          	mv	a1,a0
    80004804:	00001517          	auipc	a0,0x1
    80004808:	8f450513          	addi	a0,a0,-1804 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    8000480c:	fffff097          	auipc	ra,0xfffff
    80004810:	afc080e7          	jalr	-1284(ra) # 80003308 <__printf>
    80004814:	01013403          	ld	s0,16(sp)
    80004818:	01813083          	ld	ra,24(sp)
    8000481c:	00048513          	mv	a0,s1
    80004820:	00813483          	ld	s1,8(sp)
    80004824:	02010113          	addi	sp,sp,32
    80004828:	ffffe317          	auipc	t1,0xffffe
    8000482c:	6d430067          	jr	1748(t1) # 80002efc <plic_complete>
    80004830:	fffff097          	auipc	ra,0xfffff
    80004834:	3e0080e7          	jalr	992(ra) # 80003c10 <uartintr>
    80004838:	fddff06f          	j	80004814 <console_handler+0x74>
    8000483c:	00001517          	auipc	a0,0x1
    80004840:	9bc50513          	addi	a0,a0,-1604 # 800051f8 <digits+0x78>
    80004844:	fffff097          	auipc	ra,0xfffff
    80004848:	a68080e7          	jalr	-1432(ra) # 800032ac <panic>
	...
