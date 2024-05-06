
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	8d813103          	ld	sp,-1832(sp) # 800058d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	6a0020ef          	jal	ra,800026bc <start>

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
    800010b0:	0e8010ef          	jal	ra,80002198 <_ZN17interruptHandlers20handleSupervisorTrapEv>
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
    800011c0:	0b4010ef          	jal	ra,80002274 <_ZN17interruptHandlers20handleTimerInterruptEv>
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
    800012d0:	77d000ef          	jal	ra,8000224c <_ZN17interruptHandlers22handleConsoleInterruptEv>
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

0000000080001c24 <_Z41__static_initialization_and_destruction_0ii>:
    return readyQueue->pop();
}

void Scheduler::put(TCB * data) {
    readyQueue->push(data);
}
    80001c24:	00100793          	li	a5,1
    80001c28:	00f50463          	beq	a0,a5,80001c30 <_Z41__static_initialization_and_destruction_0ii+0xc>
    80001c2c:	00008067          	ret
    80001c30:	000107b7          	lui	a5,0x10
    80001c34:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001c38:	fef59ae3          	bne	a1,a5,80001c2c <_Z41__static_initialization_and_destruction_0ii+0x8>
    80001c3c:	ff010113          	addi	sp,sp,-16
    80001c40:	00113423          	sd	ra,8(sp)
    80001c44:	00813023          	sd	s0,0(sp)
    80001c48:	01010413          	addi	s0,sp,16
Queue<TCB>* Scheduler::readyQueue = new Queue<TCB>();
    80001c4c:	02000513          	li	a0,32
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	4a8080e7          	jalr	1192(ra) # 800020f8 <_Znwm>
    80001c58:	00053023          	sd	zero,0(a0)
    80001c5c:	00050423          	sb	zero,8(a0)
    80001c60:	00053823          	sd	zero,16(a0)
    80001c64:	00053c23          	sd	zero,24(a0)
    80001c68:	00004797          	auipc	a5,0x4
    80001c6c:	cca7b423          	sd	a0,-824(a5) # 80005930 <_ZN9Scheduler10readyQueueE>
}
    80001c70:	00813083          	ld	ra,8(sp)
    80001c74:	00013403          	ld	s0,0(sp)
    80001c78:	01010113          	addi	sp,sp,16
    80001c7c:	00008067          	ret

0000000080001c80 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80001c80:	ff010113          	addi	sp,sp,-16
    80001c84:	00113423          	sd	ra,8(sp)
    80001c88:	00813023          	sd	s0,0(sp)
    80001c8c:	01010413          	addi	s0,sp,16
    return readyQueue->pop();
    80001c90:	00004517          	auipc	a0,0x4
    80001c94:	ca053503          	ld	a0,-864(a0) # 80005930 <_ZN9Scheduler10readyQueueE>
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	0a8080e7          	jalr	168(ra) # 80001d40 <_ZN5QueueI3TCBE3popEv>
}
    80001ca0:	00813083          	ld	ra,8(sp)
    80001ca4:	00013403          	ld	s0,0(sp)
    80001ca8:	01010113          	addi	sp,sp,16
    80001cac:	00008067          	ret

0000000080001cb0 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB * data) {
    80001cb0:	ff010113          	addi	sp,sp,-16
    80001cb4:	00113423          	sd	ra,8(sp)
    80001cb8:	00813023          	sd	s0,0(sp)
    80001cbc:	01010413          	addi	s0,sp,16
    80001cc0:	00050593          	mv	a1,a0
    readyQueue->push(data);
    80001cc4:	00004517          	auipc	a0,0x4
    80001cc8:	c6c53503          	ld	a0,-916(a0) # 80005930 <_ZN9Scheduler10readyQueueE>
    80001ccc:	00000097          	auipc	ra,0x0
    80001cd0:	148080e7          	jalr	328(ra) # 80001e14 <_ZN5QueueI3TCBE4pushEPS0_>
}
    80001cd4:	00813083          	ld	ra,8(sp)
    80001cd8:	00013403          	ld	s0,0(sp)
    80001cdc:	01010113          	addi	sp,sp,16
    80001ce0:	00008067          	ret

0000000080001ce4 <_GLOBAL__sub_I__ZN9Scheduler10readyQueueE>:
    80001ce4:	ff010113          	addi	sp,sp,-16
    80001ce8:	00113423          	sd	ra,8(sp)
    80001cec:	00813023          	sd	s0,0(sp)
    80001cf0:	01010413          	addi	s0,sp,16
    80001cf4:	000105b7          	lui	a1,0x10
    80001cf8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001cfc:	00100513          	li	a0,1
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	f24080e7          	jalr	-220(ra) # 80001c24 <_Z41__static_initialization_and_destruction_0ii>
    80001d08:	00813083          	ld	ra,8(sp)
    80001d0c:	00013403          	ld	s0,0(sp)
    80001d10:	01010113          	addi	sp,sp,16
    80001d14:	00008067          	ret

0000000080001d18 <_ZN5QueueI3TCBE4NodedlEPv>:
    p->lastNodeAddr -= (uint64)sizeof(Node);
    return (void*)p->lastNodeAddr;
}

template<typename T>
void Queue<T>::Node::operator delete(void* p) {
    80001d18:	ff010113          	addi	sp,sp,-16
    80001d1c:	00113423          	sd	ra,8(sp)
    80001d20:	00813023          	sd	s0,0(sp)
    80001d24:	01010413          	addi	s0,sp,16
    // page won't be freed if pointer doesn't point to its beginning
    mem_free(p);
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	674080e7          	jalr	1652(ra) # 8000139c <_Z8mem_freePv>
}
    80001d30:	00813083          	ld	ra,8(sp)
    80001d34:	00013403          	ld	s0,0(sp)
    80001d38:	01010113          	addi	sp,sp,16
    80001d3c:	00008067          	ret

0000000080001d40 <_ZN5QueueI3TCBE3popEv>:
T *Queue<T>::pop() {
    80001d40:	fe010113          	addi	sp,sp,-32
    80001d44:	00113c23          	sd	ra,24(sp)
    80001d48:	00813823          	sd	s0,16(sp)
    80001d4c:	00913423          	sd	s1,8(sp)
    80001d50:	02010413          	addi	s0,sp,32
    80001d54:	00050793          	mv	a5,a0
    if(!head) return nullptr;
    80001d58:	01053503          	ld	a0,16(a0)
    80001d5c:	04050063          	beqz	a0,80001d9c <_ZN5QueueI3TCBE3popEv+0x5c>
    T* data = node->data;
    80001d60:	00853483          	ld	s1,8(a0)
    head = head->next;
    80001d64:	00053703          	ld	a4,0(a0)
    80001d68:	00e7b823          	sd	a4,16(a5)
    if (node == last)
    80001d6c:	0187b703          	ld	a4,24(a5)
    80001d70:	02e50263          	beq	a0,a4,80001d94 <_ZN5QueueI3TCBE3popEv+0x54>
    delete node;
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	fa4080e7          	jalr	-92(ra) # 80001d18 <_ZN5QueueI3TCBE4NodedlEPv>
}
    80001d7c:	00048513          	mv	a0,s1
    80001d80:	01813083          	ld	ra,24(sp)
    80001d84:	01013403          	ld	s0,16(sp)
    80001d88:	00813483          	ld	s1,8(sp)
    80001d8c:	02010113          	addi	sp,sp,32
    80001d90:	00008067          	ret
        last = nullptr;
    80001d94:	0007bc23          	sd	zero,24(a5)
    80001d98:	fddff06f          	j	80001d74 <_ZN5QueueI3TCBE3popEv+0x34>
    if(!head) return nullptr;
    80001d9c:	00050493          	mv	s1,a0
    80001da0:	fddff06f          	j	80001d7c <_ZN5QueueI3TCBE3popEv+0x3c>

0000000080001da4 <_ZN5QueueI3TCBE4NodenwEmPS1_>:
void *Queue<T>::Node::operator new(size_t sz, Queue<T>* p) {
    80001da4:	fe010113          	addi	sp,sp,-32
    80001da8:	00113c23          	sd	ra,24(sp)
    80001dac:	00813823          	sd	s0,16(sp)
    80001db0:	00913423          	sd	s1,8(sp)
    80001db4:	02010413          	addi	s0,sp,32
    if (sz > MEM_BLOCK_SIZE)
    80001db8:	04000793          	li	a5,64
    80001dbc:	02a7ea63          	bltu	a5,a0,80001df0 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x4c>
    80001dc0:	00058493          	mv	s1,a1
    if (p->lastNodeAddr % MEM_BLOCK_SIZE == 0) {
    80001dc4:	0005b783          	ld	a5,0(a1)
    80001dc8:	03f7f793          	andi	a5,a5,63
    80001dcc:	02078863          	beqz	a5,80001dfc <_ZN5QueueI3TCBE4NodenwEmPS1_+0x58>
    p->lastNodeAddr -= (uint64)sizeof(Node);
    80001dd0:	0004b503          	ld	a0,0(s1)
    80001dd4:	ff050513          	addi	a0,a0,-16
    80001dd8:	00a4b023          	sd	a0,0(s1)
}
    80001ddc:	01813083          	ld	ra,24(sp)
    80001de0:	01013403          	ld	s0,16(sp)
    80001de4:	00813483          	ld	s1,8(sp)
    80001de8:	02010113          	addi	sp,sp,32
    80001dec:	00008067          	ret
        return mem_alloc(sz);
    80001df0:	fffff097          	auipc	ra,0xfffff
    80001df4:	578080e7          	jalr	1400(ra) # 80001368 <_Z9mem_allocm>
    80001df8:	fe5ff06f          	j	80001ddc <_ZN5QueueI3TCBE4NodenwEmPS1_+0x38>
        void* ptr = mem_alloc(MEM_BLOCK_SIZE);
    80001dfc:	04000513          	li	a0,64
    80001e00:	fffff097          	auipc	ra,0xfffff
    80001e04:	568080e7          	jalr	1384(ra) # 80001368 <_Z9mem_allocm>
        p->lastNodeAddr = (uint64) ptr + MEM_BLOCK_SIZE;
    80001e08:	04050513          	addi	a0,a0,64
    80001e0c:	00a4b023          	sd	a0,0(s1)
    80001e10:	fc1ff06f          	j	80001dd0 <_ZN5QueueI3TCBE4NodenwEmPS1_+0x2c>

0000000080001e14 <_ZN5QueueI3TCBE4pushEPS0_>:
void Queue<T>::push(T *data) {
    80001e14:	fe010113          	addi	sp,sp,-32
    80001e18:	00113c23          	sd	ra,24(sp)
    80001e1c:	00813823          	sd	s0,16(sp)
    80001e20:	00913423          	sd	s1,8(sp)
    80001e24:	01213023          	sd	s2,0(sp)
    80001e28:	02010413          	addi	s0,sp,32
    80001e2c:	00050493          	mv	s1,a0
    80001e30:	00058913          	mv	s2,a1
    Node* node = new(this) Node();
    80001e34:	00050593          	mv	a1,a0
    80001e38:	01000513          	li	a0,16
    80001e3c:	00000097          	auipc	ra,0x0
    80001e40:	f68080e7          	jalr	-152(ra) # 80001da4 <_ZN5QueueI3TCBE4NodenwEmPS1_>
    80001e44:	00053023          	sd	zero,0(a0)
    node->data = data;
    80001e48:	01253423          	sd	s2,8(a0)
    if (!head) {
    80001e4c:	0104b783          	ld	a5,16(s1)
    80001e50:	02078463          	beqz	a5,80001e78 <_ZN5QueueI3TCBE4pushEPS0_+0x64>
    last->next = node;
    80001e54:	0184b783          	ld	a5,24(s1)
    80001e58:	00a7b023          	sd	a0,0(a5)
    last = node;
    80001e5c:	00a4bc23          	sd	a0,24(s1)
}
    80001e60:	01813083          	ld	ra,24(sp)
    80001e64:	01013403          	ld	s0,16(sp)
    80001e68:	00813483          	ld	s1,8(sp)
    80001e6c:	00013903          	ld	s2,0(sp)
    80001e70:	02010113          	addi	sp,sp,32
    80001e74:	00008067          	ret
        head = last = node;
    80001e78:	00a4bc23          	sd	a0,24(s1)
    80001e7c:	00a4b823          	sd	a0,16(s1)
        return;
    80001e80:	fe1ff06f          	j	80001e60 <_ZN5QueueI3TCBE4pushEPS0_+0x4c>

0000000080001e84 <main>:
    uint64 a = 0;
    explicit TCB(int k) : i(k) {}
};


int main() {
    80001e84:	fc010113          	addi	sp,sp,-64
    80001e88:	02113c23          	sd	ra,56(sp)
    80001e8c:	02813823          	sd	s0,48(sp)
    80001e90:	02913423          	sd	s1,40(sp)
    80001e94:	03213023          	sd	s2,32(sp)
    80001e98:	01313c23          	sd	s3,24(sp)
    80001e9c:	01413823          	sd	s4,16(sp)
    80001ea0:	01513423          	sd	s5,8(sp)
    80001ea4:	04010413          	addi	s0,sp,64

    RiscV::stvecW((uint64)&RiscV::setStvecTable | 0x01);
    80001ea8:	fffff797          	auipc	a5,0xfffff
    80001eac:	15878793          	addi	a5,a5,344 # 80001000 <_ZN5RiscV13setStvecTableEv>
    80001eb0:	0017e793          	ori	a5,a5,1
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001eb4:	10579073          	csrw	stvec,a5



    TCB* th1 = new TCB(55);
    80001eb8:	01800513          	li	a0,24
    80001ebc:	00000097          	auipc	ra,0x0
    80001ec0:	23c080e7          	jalr	572(ra) # 800020f8 <_Znwm>
    80001ec4:	00050a93          	mv	s5,a0
    explicit TCB(int k) : i(k) {}
    80001ec8:	03700793          	li	a5,55
    80001ecc:	00f53023          	sd	a5,0(a0)
    80001ed0:	00053423          	sd	zero,8(a0)
    80001ed4:	00053823          	sd	zero,16(a0)
    TCB* th2 = new TCB(2);
    80001ed8:	01800513          	li	a0,24
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	21c080e7          	jalr	540(ra) # 800020f8 <_Znwm>
    80001ee4:	00050a13          	mv	s4,a0
    explicit TCB(int k) : i(k) {}
    80001ee8:	00200793          	li	a5,2
    80001eec:	00f53023          	sd	a5,0(a0)
    80001ef0:	00053423          	sd	zero,8(a0)
    80001ef4:	00053823          	sd	zero,16(a0)
    TCB* th3 = new TCB(3);
    80001ef8:	01800513          	li	a0,24
    80001efc:	00000097          	auipc	ra,0x0
    80001f00:	1fc080e7          	jalr	508(ra) # 800020f8 <_Znwm>
    80001f04:	00050993          	mv	s3,a0
    explicit TCB(int k) : i(k) {}
    80001f08:	00300793          	li	a5,3
    80001f0c:	00f53023          	sd	a5,0(a0)
    80001f10:	00053423          	sd	zero,8(a0)
    80001f14:	00053823          	sd	zero,16(a0)
    TCB* th4 = new TCB(4);
    80001f18:	01800513          	li	a0,24
    80001f1c:	00000097          	auipc	ra,0x0
    80001f20:	1dc080e7          	jalr	476(ra) # 800020f8 <_Znwm>
    80001f24:	00050913          	mv	s2,a0
    explicit TCB(int k) : i(k) {}
    80001f28:	00400793          	li	a5,4
    80001f2c:	00f53023          	sd	a5,0(a0)
    80001f30:	00053423          	sd	zero,8(a0)
    80001f34:	00053823          	sd	zero,16(a0)
    TCB* th5 = new TCB(5);
    80001f38:	01800513          	li	a0,24
    80001f3c:	00000097          	auipc	ra,0x0
    80001f40:	1bc080e7          	jalr	444(ra) # 800020f8 <_Znwm>
    80001f44:	00050493          	mv	s1,a0
    explicit TCB(int k) : i(k) {}
    80001f48:	00500793          	li	a5,5
    80001f4c:	00f53023          	sd	a5,0(a0)
    80001f50:	00053423          	sd	zero,8(a0)
    80001f54:	00053823          	sd	zero,16(a0)

    Scheduler::put(th1);
    80001f58:	000a8513          	mv	a0,s5
    80001f5c:	00000097          	auipc	ra,0x0
    80001f60:	d54080e7          	jalr	-684(ra) # 80001cb0 <_ZN9Scheduler3putEP3TCB>
    Scheduler::put(th2);
    80001f64:	000a0513          	mv	a0,s4
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	d48080e7          	jalr	-696(ra) # 80001cb0 <_ZN9Scheduler3putEP3TCB>
    Scheduler::put(th3);
    80001f70:	00098513          	mv	a0,s3
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	d3c080e7          	jalr	-708(ra) # 80001cb0 <_ZN9Scheduler3putEP3TCB>
    Scheduler::put(th4);
    80001f7c:	00090513          	mv	a0,s2
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	d30080e7          	jalr	-720(ra) # 80001cb0 <_ZN9Scheduler3putEP3TCB>
    Scheduler::put(th5);
    80001f88:	00048513          	mv	a0,s1
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	d24080e7          	jalr	-732(ra) # 80001cb0 <_ZN9Scheduler3putEP3TCB>

    __putc((char)Scheduler::get()->i); __putc('\n');
    80001f94:	00000097          	auipc	ra,0x0
    80001f98:	cec080e7          	jalr	-788(ra) # 80001c80 <_ZN9Scheduler3getEv>
    80001f9c:	00054503          	lbu	a0,0(a0)
    80001fa0:	00002097          	auipc	ra,0x2
    80001fa4:	7dc080e7          	jalr	2012(ra) # 8000477c <__putc>
    80001fa8:	00a00513          	li	a0,10
    80001fac:	00002097          	auipc	ra,0x2
    80001fb0:	7d0080e7          	jalr	2000(ra) # 8000477c <__putc>
    __putc((char)Scheduler::get()->i); __putc('\n');
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	ccc080e7          	jalr	-820(ra) # 80001c80 <_ZN9Scheduler3getEv>
    80001fbc:	00054503          	lbu	a0,0(a0)
    80001fc0:	00002097          	auipc	ra,0x2
    80001fc4:	7bc080e7          	jalr	1980(ra) # 8000477c <__putc>
    80001fc8:	00a00513          	li	a0,10
    80001fcc:	00002097          	auipc	ra,0x2
    80001fd0:	7b0080e7          	jalr	1968(ra) # 8000477c <__putc>
    __putc((char)Scheduler::get()->i); __putc('\n');
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	cac080e7          	jalr	-852(ra) # 80001c80 <_ZN9Scheduler3getEv>
    80001fdc:	00054503          	lbu	a0,0(a0)
    80001fe0:	00002097          	auipc	ra,0x2
    80001fe4:	79c080e7          	jalr	1948(ra) # 8000477c <__putc>
    80001fe8:	00a00513          	li	a0,10
    80001fec:	00002097          	auipc	ra,0x2
    80001ff0:	790080e7          	jalr	1936(ra) # 8000477c <__putc>
    __putc((char)Scheduler::get()->i); __putc('\n');
    80001ff4:	00000097          	auipc	ra,0x0
    80001ff8:	c8c080e7          	jalr	-884(ra) # 80001c80 <_ZN9Scheduler3getEv>
    80001ffc:	00054503          	lbu	a0,0(a0)
    80002000:	00002097          	auipc	ra,0x2
    80002004:	77c080e7          	jalr	1916(ra) # 8000477c <__putc>
    80002008:	00a00513          	li	a0,10
    8000200c:	00002097          	auipc	ra,0x2
    80002010:	770080e7          	jalr	1904(ra) # 8000477c <__putc>
    __putc((char)Scheduler::get()->i); __putc('\n');
    80002014:	00000097          	auipc	ra,0x0
    80002018:	c6c080e7          	jalr	-916(ra) # 80001c80 <_ZN9Scheduler3getEv>
    8000201c:	00054503          	lbu	a0,0(a0)
    80002020:	00002097          	auipc	ra,0x2
    80002024:	75c080e7          	jalr	1884(ra) # 8000477c <__putc>
    80002028:	00a00513          	li	a0,10
    8000202c:	00002097          	auipc	ra,0x2
    80002030:	750080e7          	jalr	1872(ra) # 8000477c <__putc>


    int* ptr = (int*)mem_alloc(10*sizeof(int));
    80002034:	02800513          	li	a0,40
    80002038:	fffff097          	auipc	ra,0xfffff
    8000203c:	330080e7          	jalr	816(ra) # 80001368 <_Z9mem_allocm>
    for(int i=0; i<10; i++) ptr[i] = 0;
    80002040:	00000793          	li	a5,0
    80002044:	00900713          	li	a4,9
    80002048:	00f74c63          	blt	a4,a5,80002060 <main+0x1dc>
    8000204c:	00279713          	slli	a4,a5,0x2
    80002050:	00e50733          	add	a4,a0,a4
    80002054:	00072023          	sw	zero,0(a4)
    80002058:	0017879b          	addiw	a5,a5,1
    8000205c:	fe9ff06f          	j	80002044 <main+0x1c0>
    mem_free(ptr);
    80002060:	fffff097          	auipc	ra,0xfffff
    80002064:	33c080e7          	jalr	828(ra) # 8000139c <_Z8mem_freePv>

    delete th1;
    80002068:	000a8863          	beqz	s5,80002078 <main+0x1f4>
    8000206c:	000a8513          	mv	a0,s5
    80002070:	00000097          	auipc	ra,0x0
    80002074:	0d8080e7          	jalr	216(ra) # 80002148 <_ZdlPv>
    delete th2;
    80002078:	000a0863          	beqz	s4,80002088 <main+0x204>
    8000207c:	000a0513          	mv	a0,s4
    80002080:	00000097          	auipc	ra,0x0
    80002084:	0c8080e7          	jalr	200(ra) # 80002148 <_ZdlPv>
    delete th3;
    80002088:	00098863          	beqz	s3,80002098 <main+0x214>
    8000208c:	00098513          	mv	a0,s3
    80002090:	00000097          	auipc	ra,0x0
    80002094:	0b8080e7          	jalr	184(ra) # 80002148 <_ZdlPv>
    delete th4;
    80002098:	00090863          	beqz	s2,800020a8 <main+0x224>
    8000209c:	00090513          	mv	a0,s2
    800020a0:	00000097          	auipc	ra,0x0
    800020a4:	0a8080e7          	jalr	168(ra) # 80002148 <_ZdlPv>
    delete th5;
    800020a8:	00048863          	beqz	s1,800020b8 <main+0x234>
    800020ac:	00048513          	mv	a0,s1
    800020b0:	00000097          	auipc	ra,0x0
    800020b4:	098080e7          	jalr	152(ra) # 80002148 <_ZdlPv>

    return 0;
}
    800020b8:	00000513          	li	a0,0
    800020bc:	03813083          	ld	ra,56(sp)
    800020c0:	03013403          	ld	s0,48(sp)
    800020c4:	02813483          	ld	s1,40(sp)
    800020c8:	02013903          	ld	s2,32(sp)
    800020cc:	01813983          	ld	s3,24(sp)
    800020d0:	01013a03          	ld	s4,16(sp)
    800020d4:	00813a83          	ld	s5,8(sp)
    800020d8:	04010113          	addi	sp,sp,64
    800020dc:	00008067          	ret
    static void setStvecTable(){}
    800020e0:	ff010113          	addi	sp,sp,-16
    800020e4:	00813423          	sd	s0,8(sp)
    800020e8:	01010413          	addi	s0,sp,16
    800020ec:	00813403          	ld	s0,8(sp)
    800020f0:	01010113          	addi	sp,sp,16
    800020f4:	00008067          	ret

00000000800020f8 <_Znwm>:
// Created by os on 5/4/24.
//

#include "../h/syscall_cpp.h"

void *operator new(size_t n) {
    800020f8:	ff010113          	addi	sp,sp,-16
    800020fc:	00113423          	sd	ra,8(sp)
    80002100:	00813023          	sd	s0,0(sp)
    80002104:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80002108:	fffff097          	auipc	ra,0xfffff
    8000210c:	260080e7          	jalr	608(ra) # 80001368 <_Z9mem_allocm>
}
    80002110:	00813083          	ld	ra,8(sp)
    80002114:	00013403          	ld	s0,0(sp)
    80002118:	01010113          	addi	sp,sp,16
    8000211c:	00008067          	ret

0000000080002120 <_Znam>:

void *operator new[](size_t n) {
    80002120:	ff010113          	addi	sp,sp,-16
    80002124:	00113423          	sd	ra,8(sp)
    80002128:	00813023          	sd	s0,0(sp)
    8000212c:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80002130:	fffff097          	auipc	ra,0xfffff
    80002134:	238080e7          	jalr	568(ra) # 80001368 <_Z9mem_allocm>
}
    80002138:	00813083          	ld	ra,8(sp)
    8000213c:	00013403          	ld	s0,0(sp)
    80002140:	01010113          	addi	sp,sp,16
    80002144:	00008067          	ret

0000000080002148 <_ZdlPv>:

void operator delete(void *p) noexcept {
    80002148:	ff010113          	addi	sp,sp,-16
    8000214c:	00113423          	sd	ra,8(sp)
    80002150:	00813023          	sd	s0,0(sp)
    80002154:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002158:	fffff097          	auipc	ra,0xfffff
    8000215c:	244080e7          	jalr	580(ra) # 8000139c <_Z8mem_freePv>
}
    80002160:	00813083          	ld	ra,8(sp)
    80002164:	00013403          	ld	s0,0(sp)
    80002168:	01010113          	addi	sp,sp,16
    8000216c:	00008067          	ret

0000000080002170 <_ZdaPv>:

void operator delete[](void *p) noexcept {
    80002170:	ff010113          	addi	sp,sp,-16
    80002174:	00113423          	sd	ra,8(sp)
    80002178:	00813023          	sd	s0,0(sp)
    8000217c:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002180:	fffff097          	auipc	ra,0xfffff
    80002184:	21c080e7          	jalr	540(ra) # 8000139c <_Z8mem_freePv>
    80002188:	00813083          	ld	ra,8(sp)
    8000218c:	00013403          	ld	s0,0(sp)
    80002190:	01010113          	addi	sp,sp,16
    80002194:	00008067          	ret

0000000080002198 <_ZN17interruptHandlers20handleSupervisorTrapEv>:
#include "../h/MemoryAllocator.h"
#include "../h/RiscV.h"

namespace interruptHandlers {

    void handleSupervisorTrap() {
    80002198:	fc010113          	addi	sp,sp,-64
    8000219c:	02113c23          	sd	ra,56(sp)
    800021a0:	02813823          	sd	s0,48(sp)
    800021a4:	04010413          	addi	s0,sp,64
    static void mc_sip(BitMaskSip mask);
};

inline uint64 RiscV::scauseR() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800021a8:	142027f3          	csrr	a5,scause
    800021ac:	fcf43023          	sd	a5,-64(s0)
    return scause;
    800021b0:	fc043783          	ld	a5,-64(s0)
        uint64 scause = RiscV::scauseR();
        // not ecall interruption
        if (scause != (uint64) (1 << 3) && scause != (uint64) (1 << 3 | 0x01)) {
    800021b4:	ff878793          	addi	a5,a5,-8
    800021b8:	00100713          	li	a4,1
    800021bc:	04f76863          	bltu	a4,a5,8000220c <_ZN17interruptHandlers20handleSupervisorTrapEv+0x74>
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 RiscV::sepcR() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800021c0:	141027f3          	csrr	a5,sepc
    800021c4:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800021c8:	fd843783          	ld	a5,-40(s0)
            return;
        }

        // interrupt from UserMode(0x08) or KernelMode(0x09)
        // retVal is passed implicitly by changing a0 on stack
        uint64 volatile sepc = RiscV::sepcR() + 4;
    800021cc:	00478793          	addi	a5,a5,4
    800021d0:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("mv a1, %0" : : "r"(val));
}

inline uint64 RiscV::sstatusR() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800021d4:	100027f3          	csrr	a5,sstatus
    800021d8:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800021dc:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sstatus = RiscV::sstatusR();
    800021e0:	fef43023          	sd	a5,-32(s0)
    __asm__ volatile ("mv %0, a0" : "=r"(a0));
    800021e4:	00050793          	mv	a5,a0
    800021e8:	fcf43423          	sd	a5,-56(s0)
    return a0;
    800021ec:	fc843783          	ld	a5,-56(s0)
        uint64 codeOp = RiscV::a0R();
        uint64 retVal;

        switch (codeOp) {
    800021f0:	02e78663          	beq	a5,a4,8000221c <_ZN17interruptHandlers20handleSupervisorTrapEv+0x84>
    800021f4:	00200713          	li	a4,2
    800021f8:	02e78e63          	beq	a5,a4,80002234 <_ZN17interruptHandlers20handleSupervisorTrapEv+0x9c>
                break;
            default:
                break;
        }

        RiscV::sstatusW(sstatus);
    800021fc:	fe043783          	ld	a5,-32(s0)
}

inline void RiscV::sstatusW(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002200:	10079073          	csrw	sstatus,a5
        RiscV::sepcW(sepc);
    80002204:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002208:	14179073          	csrw	sepc,a5

    }
    8000220c:	03813083          	ld	ra,56(sp)
    80002210:	03013403          	ld	s0,48(sp)
    80002214:	04010113          	addi	sp,sp,64
    80002218:	00008067          	ret
                __asm__ volatile ("mv %0, a1" : "=r" (size));
    8000221c:	00058513          	mv	a0,a1
                retVal = (uint64) MemoryAllocator::mem_alloc(size);
    80002220:	00000097          	auipc	ra,0x0
    80002224:	114080e7          	jalr	276(ra) # 80002334 <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    80002228:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(sp)");
    8000222c:	04513823          	sd	t0,80(sp)
                break;
    80002230:	fcdff06f          	j	800021fc <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>
                __asm__ volatile ("mv %0, a1" : "=r"(ptr));
    80002234:	00058513          	mv	a0,a1
                retVal = MemoryAllocator::mem_free(ptr);
    80002238:	00000097          	auipc	ra,0x0
    8000223c:	250080e7          	jalr	592(ra) # 80002488 <_ZN15MemoryAllocator8mem_freeEPv>
                __asm__ volatile ("mv t0, %0" : : "r"(retVal));
    80002240:	00050293          	mv	t0,a0
                __asm__ volatile ("sd t0, 80(sp)");
    80002244:	04513823          	sd	t0,80(sp)
                break;
    80002248:	fb5ff06f          	j	800021fc <_ZN17interruptHandlers20handleSupervisorTrapEv+0x64>

000000008000224c <_ZN17interruptHandlers22handleConsoleInterruptEv>:

    void handleConsoleInterrupt() {
    8000224c:	ff010113          	addi	sp,sp,-16
    80002250:	00113423          	sd	ra,8(sp)
    80002254:	00813023          	sd	s0,0(sp)
    80002258:	01010413          	addi	s0,sp,16
        console_handler();
    8000225c:	00002097          	auipc	ra,0x2
    80002260:	594080e7          	jalr	1428(ra) # 800047f0 <console_handler>
    }
    80002264:	00813083          	ld	ra,8(sp)
    80002268:	00013403          	ld	s0,0(sp)
    8000226c:	01010113          	addi	sp,sp,16
    80002270:	00008067          	ret

0000000080002274 <_ZN17interruptHandlers20handleTimerInterruptEv>:

    void handleTimerInterrupt() {
    80002274:	ff010113          	addi	sp,sp,-16
    80002278:	00813423          	sd	s0,8(sp)
    8000227c:	01010413          	addi	s0,sp,16
inline void RiscV::ms_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"((uint64)mask));
}

inline void RiscV::mc_sip(RiscV::BitMaskSip mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"((uint64)mask));
    80002280:	00200793          	li	a5,2
    80002284:	1447b073          	csrc	sip,a5
        /*uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        TCB::dispatch();
        w_sstatus(sstatus);
        w_sepc(sepc);*/
    }
    80002288:	00813403          	ld	s0,8(sp)
    8000228c:	01010113          	addi	sp,sp,16
    80002290:	00008067          	ret

0000000080002294 <_ZN15MemoryAllocator7initMemEv>:
const uint64 MemoryAllocator::HEADER_SIZE = (uint64)
        ((sizeof(AVLTree) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
bool MemoryAllocator::initialised = false;


void MemoryAllocator::initMem() {
    80002294:	ff010113          	addi	sp,sp,-16
    80002298:	00813423          	sd	s0,8(sp)
    8000229c:	01010413          	addi	s0,sp,16
    if (MemoryAllocator::initialised) return;
    800022a0:	00003797          	auipc	a5,0x3
    800022a4:	6987c783          	lbu	a5,1688(a5) # 80005938 <_ZN15MemoryAllocator11initialisedE>
    800022a8:	08079063          	bnez	a5,80002328 <_ZN15MemoryAllocator7initMemEv+0x94>

    MemoryAllocator::startAddr = (((uint64)HEAP_START_ADDR + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800022ac:	00003797          	auipc	a5,0x3
    800022b0:	6247b783          	ld	a5,1572(a5) # 800058d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800022b4:	0007b783          	ld	a5,0(a5)
    800022b8:	03f78793          	addi	a5,a5,63
    800022bc:	fc07f793          	andi	a5,a5,-64
    800022c0:	00003717          	auipc	a4,0x3
    800022c4:	67870713          	addi	a4,a4,1656 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    800022c8:	00f73423          	sd	a5,8(a4)
    MemoryAllocator::endAddr = ((uint64)HEAP_END_ADDR / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    800022cc:	00003697          	auipc	a3,0x3
    800022d0:	6146b683          	ld	a3,1556(a3) # 800058e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800022d4:	0006b683          	ld	a3,0(a3)
    800022d8:	fc06f693          	andi	a3,a3,-64
    800022dc:	00d73823          	sd	a3,16(a4)

    MemoryAllocator::free = (AVLTree*) MemoryAllocator::startAddr;
    800022e0:	00f73c23          	sd	a5,24(a4)
        resetAll();
        this->sz = sz;
    }

    void resetAll(RESET_FLAGS flags = NO_FLAG) {
        left = right = parent = next = prev = sameSize = nullptr; height = 0;
    800022e4:	0007bc23          	sd	zero,24(a5)
    800022e8:	0207b423          	sd	zero,40(a5)
    800022ec:	0207b023          	sd	zero,32(a5)
    800022f0:	0007b823          	sd	zero,16(a5)
    800022f4:	0007b423          	sd	zero,8(a5)
    800022f8:	0007b023          	sd	zero,0(a5)
    800022fc:	0207ac23          	sw	zero,56(a5)
    MemoryAllocator::free->resetAll();
    MemoryAllocator::free->isFree = true;
    80002300:	01873683          	ld	a3,24(a4)
    80002304:	00100613          	li	a2,1
    80002308:	02c68e23          	sb	a2,60(a3)
    MemoryAllocator::free->sz =
            (size_t) (MemoryAllocator::endAddr - MemoryAllocator::startAddr - MemoryAllocator::HEADER_SIZE);
    8000230c:	01073783          	ld	a5,16(a4)
    80002310:	00873583          	ld	a1,8(a4)
    80002314:	40b787b3          	sub	a5,a5,a1
    80002318:	fc078793          	addi	a5,a5,-64
    MemoryAllocator::free->sz =
    8000231c:	02f6b823          	sd	a5,48(a3)
    MemoryAllocator::first = MemoryAllocator::free;
    80002320:	02d73023          	sd	a3,32(a4)
    MemoryAllocator::initialised = true;
    80002324:	00c70023          	sb	a2,0(a4)
}
    80002328:	00813403          	ld	s0,8(sp)
    8000232c:	01010113          	addi	sp,sp,16
    80002330:	00008067          	ret

0000000080002334 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    80002334:	fd010113          	addi	sp,sp,-48
    80002338:	02113423          	sd	ra,40(sp)
    8000233c:	02813023          	sd	s0,32(sp)
    80002340:	00913c23          	sd	s1,24(sp)
    80002344:	01213823          	sd	s2,16(sp)
    80002348:	01313423          	sd	s3,8(sp)
    8000234c:	03010413          	addi	s0,sp,48
    if (size <= 0) return nullptr;
    80002350:	12050863          	beqz	a0,80002480 <_ZN15MemoryAllocator9mem_allocEm+0x14c>
    80002354:	00050493          	mv	s1,a0
    if (!MemoryAllocator::initialised)
    80002358:	00003797          	auipc	a5,0x3
    8000235c:	5e07c783          	lbu	a5,1504(a5) # 80005938 <_ZN15MemoryAllocator11initialisedE>
    80002360:	08078e63          	beqz	a5,800023fc <_ZN15MemoryAllocator9mem_allocEm+0xc8>
        MemoryAllocator::initMem();

    size = ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;
    80002364:	03f48493          	addi	s1,s1,63
    80002368:	fc04f493          	andi	s1,s1,-64

    AVLTree* freeSeg = AVLTree::findFreeSeg(MemoryAllocator::free, size);
    8000236c:	00048593          	mv	a1,s1
    80002370:	00003517          	auipc	a0,0x3
    80002374:	5e053503          	ld	a0,1504(a0) # 80005950 <_ZN15MemoryAllocator4freeE>
    80002378:	fffff097          	auipc	ra,0xfffff
    8000237c:	054080e7          	jalr	84(ra) # 800013cc <_ZN7AVLTree11findFreeSegEPS_m>
    80002380:	00050913          	mv	s2,a0
    if (!freeSeg) return nullptr;
    80002384:	04050c63          	beqz	a0,800023dc <_ZN15MemoryAllocator9mem_allocEm+0xa8>

    MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, freeSeg);
    80002388:	00003997          	auipc	s3,0x3
    8000238c:	5b098993          	addi	s3,s3,1456 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    80002390:	00050593          	mv	a1,a0
    80002394:	0189b503          	ld	a0,24(s3)
    80002398:	fffff097          	auipc	ra,0xfffff
    8000239c:	4f4080e7          	jalr	1268(ra) # 8000188c <_ZN7AVLTree6removeEPS_S0_>
    800023a0:	00a9bc23          	sd	a0,24(s3)

    if (size + MEM_BLOCK_SIZE + HEADER_SIZE <= freeSeg->sz
    800023a4:	08048793          	addi	a5,s1,128
    800023a8:	03093703          	ld	a4,48(s2)
    800023ac:	00f76663          	bltu	a4,a5,800023b8 <_ZN15MemoryAllocator9mem_allocEm+0x84>
                && size + MEM_BLOCK_SIZE + HEADER_SIZE >= size) { //overflow check
    800023b0:	f7f00793          	li	a5,-129
    800023b4:	0497fa63          	bgeu	a5,s1,80002408 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
        freeSeg->sz = size;
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
        newFreeSeg->isFree = true;
    } else {
        MemoryAllocator::first = AVLTree::removeLL(freeSeg, MemoryAllocator::first);
    800023b8:	00003497          	auipc	s1,0x3
    800023bc:	58048493          	addi	s1,s1,1408 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    800023c0:	0204b583          	ld	a1,32(s1)
    800023c4:	00090513          	mv	a0,s2
    800023c8:	fffff097          	auipc	ra,0xfffff
    800023cc:	748080e7          	jalr	1864(ra) # 80001b10 <_ZN7AVLTree8removeLLEPS_S0_>
    800023d0:	02a4b023          	sd	a0,32(s1)
    }
    freeSeg->isFree = false;
    800023d4:	02090e23          	sb	zero,60(s2)
    return (void*) ((uint64)freeSeg + HEADER_SIZE);
    800023d8:	04090913          	addi	s2,s2,64
}
    800023dc:	00090513          	mv	a0,s2
    800023e0:	02813083          	ld	ra,40(sp)
    800023e4:	02013403          	ld	s0,32(sp)
    800023e8:	01813483          	ld	s1,24(sp)
    800023ec:	01013903          	ld	s2,16(sp)
    800023f0:	00813983          	ld	s3,8(sp)
    800023f4:	03010113          	addi	sp,sp,48
    800023f8:	00008067          	ret
        MemoryAllocator::initMem();
    800023fc:	00000097          	auipc	ra,0x0
    80002400:	e98080e7          	jalr	-360(ra) # 80002294 <_ZN15MemoryAllocator7initMemEv>
    80002404:	f61ff06f          	j	80002364 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        AVLTree* newFreeSeg = (AVLTree*) ((uint64)freeSeg + size + HEADER_SIZE);
    80002408:	009907b3          	add	a5,s2,s1
    8000240c:	04078993          	addi	s3,a5,64
    80002410:	0407bc23          	sd	zero,88(a5)
    80002414:	0607b423          	sd	zero,104(a5)
    80002418:	0607b023          	sd	zero,96(a5)
    8000241c:	0407b823          	sd	zero,80(a5)
    80002420:	0407b423          	sd	zero,72(a5)
    80002424:	0407b023          	sd	zero,64(a5)
    80002428:	0607ac23          	sw	zero,120(a5)
        newFreeSeg->sz = freeSeg->sz - size - HEADER_SIZE;
    8000242c:	03093783          	ld	a5,48(s2)
    80002430:	409787b3          	sub	a5,a5,s1
    80002434:	fc078793          	addi	a5,a5,-64
    80002438:	02f9b823          	sd	a5,48(s3)
        freeSeg->sz = size;
    8000243c:	02993823          	sd	s1,48(s2)
        MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, newFreeSeg);
    80002440:	00003497          	auipc	s1,0x3
    80002444:	4f848493          	addi	s1,s1,1272 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    80002448:	00098593          	mv	a1,s3
    8000244c:	0184b503          	ld	a0,24(s1)
    80002450:	fffff097          	auipc	ra,0xfffff
    80002454:	3a8080e7          	jalr	936(ra) # 800017f8 <_ZN7AVLTree6insertEPS_S0_>
    80002458:	00a4bc23          	sd	a0,24(s1)
        MemoryAllocator::first = AVLTree::swapLL(freeSeg, newFreeSeg, MemoryAllocator::first);
    8000245c:	0204b603          	ld	a2,32(s1)
    80002460:	00098593          	mv	a1,s3
    80002464:	00090513          	mv	a0,s2
    80002468:	fffff097          	auipc	ra,0xfffff
    8000246c:	638080e7          	jalr	1592(ra) # 80001aa0 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    80002470:	02a4b023          	sd	a0,32(s1)
        newFreeSeg->isFree = true;
    80002474:	00100793          	li	a5,1
    80002478:	02f98e23          	sb	a5,60(s3)
    8000247c:	f59ff06f          	j	800023d4 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
    if (size <= 0) return nullptr;
    80002480:	00000913          	li	s2,0
    80002484:	f59ff06f          	j	800023dc <_ZN15MemoryAllocator9mem_allocEm+0xa8>

0000000080002488 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *ptr) {

    if (!ptr) return -1;
    80002488:	20050a63          	beqz	a0,8000269c <_ZN15MemoryAllocator8mem_freeEPv+0x214>
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesnt point to beginning of block (its faulty)
    8000248c:	03f57713          	andi	a4,a0,63
    80002490:	20071a63          	bnez	a4,800026a4 <_ZN15MemoryAllocator8mem_freeEPv+0x21c>
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    80002494:	00003717          	auipc	a4,0x3
    80002498:	4b473703          	ld	a4,1204(a4) # 80005948 <_ZN15MemoryAllocator7endAddrE>
    8000249c:	20e57863          	bgeu	a0,a4,800026ac <_ZN15MemoryAllocator8mem_freeEPv+0x224>
    800024a0:	00003717          	auipc	a4,0x3
    800024a4:	4a073703          	ld	a4,1184(a4) # 80005940 <_ZN15MemoryAllocator9startAddrE>
    800024a8:	20e56663          	bltu	a0,a4,800026b4 <_ZN15MemoryAllocator8mem_freeEPv+0x22c>
int MemoryAllocator::mem_free(void *ptr) {
    800024ac:	fc010113          	addi	sp,sp,-64
    800024b0:	02113c23          	sd	ra,56(sp)
    800024b4:	02813823          	sd	s0,48(sp)
    800024b8:	02913423          	sd	s1,40(sp)
    800024bc:	03213023          	sd	s2,32(sp)
    800024c0:	01313c23          	sd	s3,24(sp)
    800024c4:	01413823          	sd	s4,16(sp)
    800024c8:	01513423          	sd	s5,8(sp)
    800024cc:	04010413          	addi	s0,sp,64

    AVLTree* cur = (AVLTree*) ((uint64)ptr - HEADER_SIZE); cur->resetAll(AVLTree::SAVE_SZ); cur->isFree = true;
    800024d0:	fc050913          	addi	s2,a0,-64
    800024d4:	00090993          	mv	s3,s2
    800024d8:	00093c23          	sd	zero,24(s2)
    800024dc:	02093423          	sd	zero,40(s2)
    800024e0:	02093023          	sd	zero,32(s2)
    800024e4:	00093823          	sd	zero,16(s2)
    800024e8:	00093423          	sd	zero,8(s2)
    800024ec:	fc053023          	sd	zero,-64(a0)
    800024f0:	02092c23          	sw	zero,56(s2)
    800024f4:	00100793          	li	a5,1
    800024f8:	02f90e23          	sb	a5,60(s2)
    AVLTree* aft = ((uint64)cur + cur->sz + HEADER_SIZE >= MemoryAllocator::endAddr) ? nullptr :
    800024fc:	03093483          	ld	s1,48(s2)
    80002500:	009904b3          	add	s1,s2,s1
    80002504:	04048493          	addi	s1,s1,64
    80002508:	00003797          	auipc	a5,0x3
    8000250c:	4407b783          	ld	a5,1088(a5) # 80005948 <_ZN15MemoryAllocator7endAddrE>
    80002510:	04f4f863          	bgeu	s1,a5,80002560 <_ZN15MemoryAllocator8mem_freeEPv+0xd8>
    80002514:	00048a13          	mv	s4,s1
            (AVLTree*) ((uint64)cur + cur->sz + HEADER_SIZE);
    AVLTree* toSwap = nullptr;

    if (aft && aft->isFree) {
    80002518:	04048663          	beqz	s1,80002564 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    8000251c:	03c4c783          	lbu	a5,60(s1)
    80002520:	00079663          	bnez	a5,8000252c <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    AVLTree* toSwap = nullptr;
    80002524:	00000a13          	li	s4,0
    80002528:	03c0006f          	j	80002564 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, aft);
    8000252c:	00003a97          	auipc	s5,0x3
    80002530:	40ca8a93          	addi	s5,s5,1036 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    80002534:	00048593          	mv	a1,s1
    80002538:	018ab503          	ld	a0,24(s5)
    8000253c:	fffff097          	auipc	ra,0xfffff
    80002540:	350080e7          	jalr	848(ra) # 8000188c <_ZN7AVLTree6removeEPS_S0_>
    80002544:	00aabc23          	sd	a0,24(s5)
        cur->sz += aft->sz + HEADER_SIZE;
    80002548:	0304b783          	ld	a5,48(s1)
    8000254c:	03093703          	ld	a4,48(s2)
    80002550:	00e787b3          	add	a5,a5,a4
    80002554:	04078793          	addi	a5,a5,64
    80002558:	02f93823          	sd	a5,48(s2)
        toSwap = aft;
    8000255c:	0080006f          	j	80002564 <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
    AVLTree* toSwap = nullptr;
    80002560:	00000a13          	li	s4,0
    }

    AVLTree* prev = MemoryAllocator::first;
    80002564:	00003497          	auipc	s1,0x3
    80002568:	3f44b483          	ld	s1,1012(s1) # 80005958 <_ZN15MemoryAllocator5firstE>
    8000256c:	0080006f          	j	80002574 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    for(;prev && prev->next && ((uint64)prev->next + prev->next->sz + HEADER_SIZE < (uint64)cur); prev = prev->next);
    80002570:	00070493          	mv	s1,a4
    80002574:	00048e63          	beqz	s1,80002590 <_ZN15MemoryAllocator8mem_freeEPv+0x108>
    80002578:	0204b703          	ld	a4,32(s1)
    8000257c:	00070a63          	beqz	a4,80002590 <_ZN15MemoryAllocator8mem_freeEPv+0x108>
    80002580:	03073783          	ld	a5,48(a4)
    80002584:	00f707b3          	add	a5,a4,a5
    80002588:	04078793          	addi	a5,a5,64
    8000258c:	ff27e2e3          	bltu	a5,s2,80002570 <_ZN15MemoryAllocator8mem_freeEPv+0xe8>

    if (prev && (uint64)prev + prev->sz + HEADER_SIZE == (uint64)cur) {
    80002590:	00048a63          	beqz	s1,800025a4 <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
    80002594:	0304b783          	ld	a5,48(s1)
    80002598:	00f487b3          	add	a5,s1,a5
    8000259c:	04078793          	addi	a5,a5,64
    800025a0:	06f90663          	beq	s2,a5,8000260c <_ZN15MemoryAllocator8mem_freeEPv+0x184>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
        toSwap = (toSwap) ? toSwap : prev;
        cur = prev;
    }

    MemoryAllocator::free = AVLTree::insert(MemoryAllocator::free, cur);
    800025a4:	00003497          	auipc	s1,0x3
    800025a8:	39448493          	addi	s1,s1,916 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    800025ac:	00098593          	mv	a1,s3
    800025b0:	0184b503          	ld	a0,24(s1)
    800025b4:	fffff097          	auipc	ra,0xfffff
    800025b8:	244080e7          	jalr	580(ra) # 800017f8 <_ZN7AVLTree6insertEPS_S0_>
    800025bc:	00a4bc23          	sd	a0,24(s1)
    MemoryAllocator::first = (toSwap) ? AVLTree::swapLL(toSwap, cur, MemoryAllocator::first) :
    800025c0:	0c0a0263          	beqz	s4,80002684 <_ZN15MemoryAllocator8mem_freeEPv+0x1fc>
    800025c4:	00003617          	auipc	a2,0x3
    800025c8:	39463603          	ld	a2,916(a2) # 80005958 <_ZN15MemoryAllocator5firstE>
    800025cc:	00098593          	mv	a1,s3
    800025d0:	000a0513          	mv	a0,s4
    800025d4:	fffff097          	auipc	ra,0xfffff
    800025d8:	4cc080e7          	jalr	1228(ra) # 80001aa0 <_ZN7AVLTree6swapLLEPS_S0_S0_>
    800025dc:	00003797          	auipc	a5,0x3
    800025e0:	36a7be23          	sd	a0,892(a5) # 80005958 <_ZN15MemoryAllocator5firstE>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    return 0;
    800025e4:	00000513          	li	a0,0
}
    800025e8:	03813083          	ld	ra,56(sp)
    800025ec:	03013403          	ld	s0,48(sp)
    800025f0:	02813483          	ld	s1,40(sp)
    800025f4:	02013903          	ld	s2,32(sp)
    800025f8:	01813983          	ld	s3,24(sp)
    800025fc:	01013a03          	ld	s4,16(sp)
    80002600:	00813a83          	ld	s5,8(sp)
    80002604:	04010113          	addi	sp,sp,64
    80002608:	00008067          	ret
        MemoryAllocator::free = AVLTree::remove(MemoryAllocator::free, prev);
    8000260c:	00003997          	auipc	s3,0x3
    80002610:	32c98993          	addi	s3,s3,812 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    80002614:	00048593          	mv	a1,s1
    80002618:	0189b503          	ld	a0,24(s3)
    8000261c:	fffff097          	auipc	ra,0xfffff
    80002620:	270080e7          	jalr	624(ra) # 8000188c <_ZN7AVLTree6removeEPS_S0_>
    80002624:	00a9bc23          	sd	a0,24(s3)
        prev->sz += cur->sz + HEADER_SIZE;
    80002628:	03093783          	ld	a5,48(s2)
    8000262c:	0304b703          	ld	a4,48(s1)
    80002630:	00e787b3          	add	a5,a5,a4
    80002634:	04078793          	addi	a5,a5,64
    80002638:	02f4b823          	sd	a5,48(s1)
        prev->isFree = true;
    8000263c:	00100793          	li	a5,1
    80002640:	02f48e23          	sb	a5,60(s1)
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    80002644:	020a0663          	beqz	s4,80002670 <_ZN15MemoryAllocator8mem_freeEPv+0x1e8>
    80002648:	00048513          	mv	a0,s1
    8000264c:	00003917          	auipc	s2,0x3
    80002650:	2ec90913          	addi	s2,s2,748 # 80005938 <_ZN15MemoryAllocator11initialisedE>
    80002654:	02093583          	ld	a1,32(s2)
    80002658:	fffff097          	auipc	ra,0xfffff
    8000265c:	4b8080e7          	jalr	1208(ra) # 80001b10 <_ZN7AVLTree8removeLLEPS_S0_>
    80002660:	02a93023          	sd	a0,32(s2)
        toSwap = (toSwap) ? toSwap : prev;
    80002664:	000a0a63          	beqz	s4,80002678 <_ZN15MemoryAllocator8mem_freeEPv+0x1f0>
        cur = prev;
    80002668:	00048993          	mv	s3,s1
    8000266c:	f39ff06f          	j	800025a4 <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
        MemoryAllocator::first = AVLTree::removeLL((toSwap) ? prev : nullptr, MemoryAllocator::first);
    80002670:	000a0513          	mv	a0,s4
    80002674:	fd9ff06f          	j	8000264c <_ZN15MemoryAllocator8mem_freeEPv+0x1c4>
        toSwap = (toSwap) ? toSwap : prev;
    80002678:	00048a13          	mv	s4,s1
        cur = prev;
    8000267c:	00048993          	mv	s3,s1
    80002680:	f25ff06f          	j	800025a4 <_ZN15MemoryAllocator8mem_freeEPv+0x11c>
                             AVLTree::insertLL(cur, MemoryAllocator::first);
    80002684:	00003597          	auipc	a1,0x3
    80002688:	2d45b583          	ld	a1,724(a1) # 80005958 <_ZN15MemoryAllocator5firstE>
    8000268c:	00098513          	mv	a0,s3
    80002690:	fffff097          	auipc	ra,0xfffff
    80002694:	508080e7          	jalr	1288(ra) # 80001b98 <_ZN7AVLTree8insertLLEPS_S0_>
    80002698:	f45ff06f          	j	800025dc <_ZN15MemoryAllocator8mem_freeEPv+0x154>
    if (!ptr) return -1;
    8000269c:	fff00513          	li	a0,-1
    800026a0:	00008067          	ret
    if ((uint64)ptr % MEM_BLOCK_SIZE != 0 ) return -2; // ptr doesnt point to beginning of block (its faulty)
    800026a4:	ffe00513          	li	a0,-2
    800026a8:	00008067          	ret
    if ((uint64)ptr >= MemoryAllocator::endAddr || (uint64) ptr < MemoryAllocator::startAddr) return -3; //ptr out of bound
    800026ac:	ffd00513          	li	a0,-3
    800026b0:	00008067          	ret
    800026b4:	ffd00513          	li	a0,-3
}
    800026b8:	00008067          	ret

00000000800026bc <start>:
    800026bc:	ff010113          	addi	sp,sp,-16
    800026c0:	00813423          	sd	s0,8(sp)
    800026c4:	01010413          	addi	s0,sp,16
    800026c8:	300027f3          	csrr	a5,mstatus
    800026cc:	ffffe737          	lui	a4,0xffffe
    800026d0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7c3f>
    800026d4:	00e7f7b3          	and	a5,a5,a4
    800026d8:	00001737          	lui	a4,0x1
    800026dc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800026e0:	00e7e7b3          	or	a5,a5,a4
    800026e4:	30079073          	csrw	mstatus,a5
    800026e8:	00000797          	auipc	a5,0x0
    800026ec:	16078793          	addi	a5,a5,352 # 80002848 <system_main>
    800026f0:	34179073          	csrw	mepc,a5
    800026f4:	00000793          	li	a5,0
    800026f8:	18079073          	csrw	satp,a5
    800026fc:	000107b7          	lui	a5,0x10
    80002700:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002704:	30279073          	csrw	medeleg,a5
    80002708:	30379073          	csrw	mideleg,a5
    8000270c:	104027f3          	csrr	a5,sie
    80002710:	2227e793          	ori	a5,a5,546
    80002714:	10479073          	csrw	sie,a5
    80002718:	fff00793          	li	a5,-1
    8000271c:	00a7d793          	srli	a5,a5,0xa
    80002720:	3b079073          	csrw	pmpaddr0,a5
    80002724:	00f00793          	li	a5,15
    80002728:	3a079073          	csrw	pmpcfg0,a5
    8000272c:	f14027f3          	csrr	a5,mhartid
    80002730:	0200c737          	lui	a4,0x200c
    80002734:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002738:	0007869b          	sext.w	a3,a5
    8000273c:	00269713          	slli	a4,a3,0x2
    80002740:	000f4637          	lui	a2,0xf4
    80002744:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002748:	00d70733          	add	a4,a4,a3
    8000274c:	0037979b          	slliw	a5,a5,0x3
    80002750:	020046b7          	lui	a3,0x2004
    80002754:	00d787b3          	add	a5,a5,a3
    80002758:	00c585b3          	add	a1,a1,a2
    8000275c:	00371693          	slli	a3,a4,0x3
    80002760:	00003717          	auipc	a4,0x3
    80002764:	20070713          	addi	a4,a4,512 # 80005960 <timer_scratch>
    80002768:	00b7b023          	sd	a1,0(a5)
    8000276c:	00d70733          	add	a4,a4,a3
    80002770:	00f73c23          	sd	a5,24(a4)
    80002774:	02c73023          	sd	a2,32(a4)
    80002778:	34071073          	csrw	mscratch,a4
    8000277c:	00000797          	auipc	a5,0x0
    80002780:	6e478793          	addi	a5,a5,1764 # 80002e60 <timervec>
    80002784:	30579073          	csrw	mtvec,a5
    80002788:	300027f3          	csrr	a5,mstatus
    8000278c:	0087e793          	ori	a5,a5,8
    80002790:	30079073          	csrw	mstatus,a5
    80002794:	304027f3          	csrr	a5,mie
    80002798:	0807e793          	ori	a5,a5,128
    8000279c:	30479073          	csrw	mie,a5
    800027a0:	f14027f3          	csrr	a5,mhartid
    800027a4:	0007879b          	sext.w	a5,a5
    800027a8:	00078213          	mv	tp,a5
    800027ac:	30200073          	mret
    800027b0:	00813403          	ld	s0,8(sp)
    800027b4:	01010113          	addi	sp,sp,16
    800027b8:	00008067          	ret

00000000800027bc <timerinit>:
    800027bc:	ff010113          	addi	sp,sp,-16
    800027c0:	00813423          	sd	s0,8(sp)
    800027c4:	01010413          	addi	s0,sp,16
    800027c8:	f14027f3          	csrr	a5,mhartid
    800027cc:	0200c737          	lui	a4,0x200c
    800027d0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800027d4:	0007869b          	sext.w	a3,a5
    800027d8:	00269713          	slli	a4,a3,0x2
    800027dc:	000f4637          	lui	a2,0xf4
    800027e0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800027e4:	00d70733          	add	a4,a4,a3
    800027e8:	0037979b          	slliw	a5,a5,0x3
    800027ec:	020046b7          	lui	a3,0x2004
    800027f0:	00d787b3          	add	a5,a5,a3
    800027f4:	00c585b3          	add	a1,a1,a2
    800027f8:	00371693          	slli	a3,a4,0x3
    800027fc:	00003717          	auipc	a4,0x3
    80002800:	16470713          	addi	a4,a4,356 # 80005960 <timer_scratch>
    80002804:	00b7b023          	sd	a1,0(a5)
    80002808:	00d70733          	add	a4,a4,a3
    8000280c:	00f73c23          	sd	a5,24(a4)
    80002810:	02c73023          	sd	a2,32(a4)
    80002814:	34071073          	csrw	mscratch,a4
    80002818:	00000797          	auipc	a5,0x0
    8000281c:	64878793          	addi	a5,a5,1608 # 80002e60 <timervec>
    80002820:	30579073          	csrw	mtvec,a5
    80002824:	300027f3          	csrr	a5,mstatus
    80002828:	0087e793          	ori	a5,a5,8
    8000282c:	30079073          	csrw	mstatus,a5
    80002830:	304027f3          	csrr	a5,mie
    80002834:	0807e793          	ori	a5,a5,128
    80002838:	30479073          	csrw	mie,a5
    8000283c:	00813403          	ld	s0,8(sp)
    80002840:	01010113          	addi	sp,sp,16
    80002844:	00008067          	ret

0000000080002848 <system_main>:
    80002848:	fe010113          	addi	sp,sp,-32
    8000284c:	00813823          	sd	s0,16(sp)
    80002850:	00913423          	sd	s1,8(sp)
    80002854:	00113c23          	sd	ra,24(sp)
    80002858:	02010413          	addi	s0,sp,32
    8000285c:	00000097          	auipc	ra,0x0
    80002860:	0c4080e7          	jalr	196(ra) # 80002920 <cpuid>
    80002864:	00003497          	auipc	s1,0x3
    80002868:	09c48493          	addi	s1,s1,156 # 80005900 <started>
    8000286c:	02050263          	beqz	a0,80002890 <system_main+0x48>
    80002870:	0004a783          	lw	a5,0(s1)
    80002874:	0007879b          	sext.w	a5,a5
    80002878:	fe078ce3          	beqz	a5,80002870 <system_main+0x28>
    8000287c:	0ff0000f          	fence
    80002880:	00002517          	auipc	a0,0x2
    80002884:	7d850513          	addi	a0,a0,2008 # 80005058 <_ZN15MemoryAllocator11HEADER_SIZEE+0x38>
    80002888:	00001097          	auipc	ra,0x1
    8000288c:	a74080e7          	jalr	-1420(ra) # 800032fc <panic>
    80002890:	00001097          	auipc	ra,0x1
    80002894:	9c8080e7          	jalr	-1592(ra) # 80003258 <consoleinit>
    80002898:	00001097          	auipc	ra,0x1
    8000289c:	154080e7          	jalr	340(ra) # 800039ec <printfinit>
    800028a0:	00003517          	auipc	a0,0x3
    800028a4:	89850513          	addi	a0,a0,-1896 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    800028a8:	00001097          	auipc	ra,0x1
    800028ac:	ab0080e7          	jalr	-1360(ra) # 80003358 <__printf>
    800028b0:	00002517          	auipc	a0,0x2
    800028b4:	77850513          	addi	a0,a0,1912 # 80005028 <_ZN15MemoryAllocator11HEADER_SIZEE+0x8>
    800028b8:	00001097          	auipc	ra,0x1
    800028bc:	aa0080e7          	jalr	-1376(ra) # 80003358 <__printf>
    800028c0:	00003517          	auipc	a0,0x3
    800028c4:	87850513          	addi	a0,a0,-1928 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    800028c8:	00001097          	auipc	ra,0x1
    800028cc:	a90080e7          	jalr	-1392(ra) # 80003358 <__printf>
    800028d0:	00001097          	auipc	ra,0x1
    800028d4:	4a8080e7          	jalr	1192(ra) # 80003d78 <kinit>
    800028d8:	00000097          	auipc	ra,0x0
    800028dc:	148080e7          	jalr	328(ra) # 80002a20 <trapinit>
    800028e0:	00000097          	auipc	ra,0x0
    800028e4:	16c080e7          	jalr	364(ra) # 80002a4c <trapinithart>
    800028e8:	00000097          	auipc	ra,0x0
    800028ec:	5b8080e7          	jalr	1464(ra) # 80002ea0 <plicinit>
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	5d8080e7          	jalr	1496(ra) # 80002ec8 <plicinithart>
    800028f8:	00000097          	auipc	ra,0x0
    800028fc:	078080e7          	jalr	120(ra) # 80002970 <userinit>
    80002900:	0ff0000f          	fence
    80002904:	00100793          	li	a5,1
    80002908:	00002517          	auipc	a0,0x2
    8000290c:	73850513          	addi	a0,a0,1848 # 80005040 <_ZN15MemoryAllocator11HEADER_SIZEE+0x20>
    80002910:	00f4a023          	sw	a5,0(s1)
    80002914:	00001097          	auipc	ra,0x1
    80002918:	a44080e7          	jalr	-1468(ra) # 80003358 <__printf>
    8000291c:	0000006f          	j	8000291c <system_main+0xd4>

0000000080002920 <cpuid>:
    80002920:	ff010113          	addi	sp,sp,-16
    80002924:	00813423          	sd	s0,8(sp)
    80002928:	01010413          	addi	s0,sp,16
    8000292c:	00020513          	mv	a0,tp
    80002930:	00813403          	ld	s0,8(sp)
    80002934:	0005051b          	sext.w	a0,a0
    80002938:	01010113          	addi	sp,sp,16
    8000293c:	00008067          	ret

0000000080002940 <mycpu>:
    80002940:	ff010113          	addi	sp,sp,-16
    80002944:	00813423          	sd	s0,8(sp)
    80002948:	01010413          	addi	s0,sp,16
    8000294c:	00020793          	mv	a5,tp
    80002950:	00813403          	ld	s0,8(sp)
    80002954:	0007879b          	sext.w	a5,a5
    80002958:	00779793          	slli	a5,a5,0x7
    8000295c:	00004517          	auipc	a0,0x4
    80002960:	03450513          	addi	a0,a0,52 # 80006990 <cpus>
    80002964:	00f50533          	add	a0,a0,a5
    80002968:	01010113          	addi	sp,sp,16
    8000296c:	00008067          	ret

0000000080002970 <userinit>:
    80002970:	ff010113          	addi	sp,sp,-16
    80002974:	00813423          	sd	s0,8(sp)
    80002978:	01010413          	addi	s0,sp,16
    8000297c:	00813403          	ld	s0,8(sp)
    80002980:	01010113          	addi	sp,sp,16
    80002984:	fffff317          	auipc	t1,0xfffff
    80002988:	50030067          	jr	1280(t1) # 80001e84 <main>

000000008000298c <either_copyout>:
    8000298c:	ff010113          	addi	sp,sp,-16
    80002990:	00813023          	sd	s0,0(sp)
    80002994:	00113423          	sd	ra,8(sp)
    80002998:	01010413          	addi	s0,sp,16
    8000299c:	02051663          	bnez	a0,800029c8 <either_copyout+0x3c>
    800029a0:	00058513          	mv	a0,a1
    800029a4:	00060593          	mv	a1,a2
    800029a8:	0006861b          	sext.w	a2,a3
    800029ac:	00002097          	auipc	ra,0x2
    800029b0:	c58080e7          	jalr	-936(ra) # 80004604 <__memmove>
    800029b4:	00813083          	ld	ra,8(sp)
    800029b8:	00013403          	ld	s0,0(sp)
    800029bc:	00000513          	li	a0,0
    800029c0:	01010113          	addi	sp,sp,16
    800029c4:	00008067          	ret
    800029c8:	00002517          	auipc	a0,0x2
    800029cc:	6b850513          	addi	a0,a0,1720 # 80005080 <_ZN15MemoryAllocator11HEADER_SIZEE+0x60>
    800029d0:	00001097          	auipc	ra,0x1
    800029d4:	92c080e7          	jalr	-1748(ra) # 800032fc <panic>

00000000800029d8 <either_copyin>:
    800029d8:	ff010113          	addi	sp,sp,-16
    800029dc:	00813023          	sd	s0,0(sp)
    800029e0:	00113423          	sd	ra,8(sp)
    800029e4:	01010413          	addi	s0,sp,16
    800029e8:	02059463          	bnez	a1,80002a10 <either_copyin+0x38>
    800029ec:	00060593          	mv	a1,a2
    800029f0:	0006861b          	sext.w	a2,a3
    800029f4:	00002097          	auipc	ra,0x2
    800029f8:	c10080e7          	jalr	-1008(ra) # 80004604 <__memmove>
    800029fc:	00813083          	ld	ra,8(sp)
    80002a00:	00013403          	ld	s0,0(sp)
    80002a04:	00000513          	li	a0,0
    80002a08:	01010113          	addi	sp,sp,16
    80002a0c:	00008067          	ret
    80002a10:	00002517          	auipc	a0,0x2
    80002a14:	69850513          	addi	a0,a0,1688 # 800050a8 <_ZN15MemoryAllocator11HEADER_SIZEE+0x88>
    80002a18:	00001097          	auipc	ra,0x1
    80002a1c:	8e4080e7          	jalr	-1820(ra) # 800032fc <panic>

0000000080002a20 <trapinit>:
    80002a20:	ff010113          	addi	sp,sp,-16
    80002a24:	00813423          	sd	s0,8(sp)
    80002a28:	01010413          	addi	s0,sp,16
    80002a2c:	00813403          	ld	s0,8(sp)
    80002a30:	00002597          	auipc	a1,0x2
    80002a34:	6a058593          	addi	a1,a1,1696 # 800050d0 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb0>
    80002a38:	00004517          	auipc	a0,0x4
    80002a3c:	fd850513          	addi	a0,a0,-40 # 80006a10 <tickslock>
    80002a40:	01010113          	addi	sp,sp,16
    80002a44:	00001317          	auipc	t1,0x1
    80002a48:	5c430067          	jr	1476(t1) # 80004008 <initlock>

0000000080002a4c <trapinithart>:
    80002a4c:	ff010113          	addi	sp,sp,-16
    80002a50:	00813423          	sd	s0,8(sp)
    80002a54:	01010413          	addi	s0,sp,16
    80002a58:	00000797          	auipc	a5,0x0
    80002a5c:	2f878793          	addi	a5,a5,760 # 80002d50 <kernelvec>
    80002a60:	10579073          	csrw	stvec,a5
    80002a64:	00813403          	ld	s0,8(sp)
    80002a68:	01010113          	addi	sp,sp,16
    80002a6c:	00008067          	ret

0000000080002a70 <usertrap>:
    80002a70:	ff010113          	addi	sp,sp,-16
    80002a74:	00813423          	sd	s0,8(sp)
    80002a78:	01010413          	addi	s0,sp,16
    80002a7c:	00813403          	ld	s0,8(sp)
    80002a80:	01010113          	addi	sp,sp,16
    80002a84:	00008067          	ret

0000000080002a88 <usertrapret>:
    80002a88:	ff010113          	addi	sp,sp,-16
    80002a8c:	00813423          	sd	s0,8(sp)
    80002a90:	01010413          	addi	s0,sp,16
    80002a94:	00813403          	ld	s0,8(sp)
    80002a98:	01010113          	addi	sp,sp,16
    80002a9c:	00008067          	ret

0000000080002aa0 <kerneltrap>:
    80002aa0:	fe010113          	addi	sp,sp,-32
    80002aa4:	00813823          	sd	s0,16(sp)
    80002aa8:	00113c23          	sd	ra,24(sp)
    80002aac:	00913423          	sd	s1,8(sp)
    80002ab0:	02010413          	addi	s0,sp,32
    80002ab4:	142025f3          	csrr	a1,scause
    80002ab8:	100027f3          	csrr	a5,sstatus
    80002abc:	0027f793          	andi	a5,a5,2
    80002ac0:	10079c63          	bnez	a5,80002bd8 <kerneltrap+0x138>
    80002ac4:	142027f3          	csrr	a5,scause
    80002ac8:	0207ce63          	bltz	a5,80002b04 <kerneltrap+0x64>
    80002acc:	00002517          	auipc	a0,0x2
    80002ad0:	64c50513          	addi	a0,a0,1612 # 80005118 <_ZN15MemoryAllocator11HEADER_SIZEE+0xf8>
    80002ad4:	00001097          	auipc	ra,0x1
    80002ad8:	884080e7          	jalr	-1916(ra) # 80003358 <__printf>
    80002adc:	141025f3          	csrr	a1,sepc
    80002ae0:	14302673          	csrr	a2,stval
    80002ae4:	00002517          	auipc	a0,0x2
    80002ae8:	64450513          	addi	a0,a0,1604 # 80005128 <_ZN15MemoryAllocator11HEADER_SIZEE+0x108>
    80002aec:	00001097          	auipc	ra,0x1
    80002af0:	86c080e7          	jalr	-1940(ra) # 80003358 <__printf>
    80002af4:	00002517          	auipc	a0,0x2
    80002af8:	64c50513          	addi	a0,a0,1612 # 80005140 <_ZN15MemoryAllocator11HEADER_SIZEE+0x120>
    80002afc:	00001097          	auipc	ra,0x1
    80002b00:	800080e7          	jalr	-2048(ra) # 800032fc <panic>
    80002b04:	0ff7f713          	andi	a4,a5,255
    80002b08:	00900693          	li	a3,9
    80002b0c:	04d70063          	beq	a4,a3,80002b4c <kerneltrap+0xac>
    80002b10:	fff00713          	li	a4,-1
    80002b14:	03f71713          	slli	a4,a4,0x3f
    80002b18:	00170713          	addi	a4,a4,1
    80002b1c:	fae798e3          	bne	a5,a4,80002acc <kerneltrap+0x2c>
    80002b20:	00000097          	auipc	ra,0x0
    80002b24:	e00080e7          	jalr	-512(ra) # 80002920 <cpuid>
    80002b28:	06050663          	beqz	a0,80002b94 <kerneltrap+0xf4>
    80002b2c:	144027f3          	csrr	a5,sip
    80002b30:	ffd7f793          	andi	a5,a5,-3
    80002b34:	14479073          	csrw	sip,a5
    80002b38:	01813083          	ld	ra,24(sp)
    80002b3c:	01013403          	ld	s0,16(sp)
    80002b40:	00813483          	ld	s1,8(sp)
    80002b44:	02010113          	addi	sp,sp,32
    80002b48:	00008067          	ret
    80002b4c:	00000097          	auipc	ra,0x0
    80002b50:	3c8080e7          	jalr	968(ra) # 80002f14 <plic_claim>
    80002b54:	00a00793          	li	a5,10
    80002b58:	00050493          	mv	s1,a0
    80002b5c:	06f50863          	beq	a0,a5,80002bcc <kerneltrap+0x12c>
    80002b60:	fc050ce3          	beqz	a0,80002b38 <kerneltrap+0x98>
    80002b64:	00050593          	mv	a1,a0
    80002b68:	00002517          	auipc	a0,0x2
    80002b6c:	59050513          	addi	a0,a0,1424 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    80002b70:	00000097          	auipc	ra,0x0
    80002b74:	7e8080e7          	jalr	2024(ra) # 80003358 <__printf>
    80002b78:	01013403          	ld	s0,16(sp)
    80002b7c:	01813083          	ld	ra,24(sp)
    80002b80:	00048513          	mv	a0,s1
    80002b84:	00813483          	ld	s1,8(sp)
    80002b88:	02010113          	addi	sp,sp,32
    80002b8c:	00000317          	auipc	t1,0x0
    80002b90:	3c030067          	jr	960(t1) # 80002f4c <plic_complete>
    80002b94:	00004517          	auipc	a0,0x4
    80002b98:	e7c50513          	addi	a0,a0,-388 # 80006a10 <tickslock>
    80002b9c:	00001097          	auipc	ra,0x1
    80002ba0:	490080e7          	jalr	1168(ra) # 8000402c <acquire>
    80002ba4:	00003717          	auipc	a4,0x3
    80002ba8:	d6070713          	addi	a4,a4,-672 # 80005904 <ticks>
    80002bac:	00072783          	lw	a5,0(a4)
    80002bb0:	00004517          	auipc	a0,0x4
    80002bb4:	e6050513          	addi	a0,a0,-416 # 80006a10 <tickslock>
    80002bb8:	0017879b          	addiw	a5,a5,1
    80002bbc:	00f72023          	sw	a5,0(a4)
    80002bc0:	00001097          	auipc	ra,0x1
    80002bc4:	538080e7          	jalr	1336(ra) # 800040f8 <release>
    80002bc8:	f65ff06f          	j	80002b2c <kerneltrap+0x8c>
    80002bcc:	00001097          	auipc	ra,0x1
    80002bd0:	094080e7          	jalr	148(ra) # 80003c60 <uartintr>
    80002bd4:	fa5ff06f          	j	80002b78 <kerneltrap+0xd8>
    80002bd8:	00002517          	auipc	a0,0x2
    80002bdc:	50050513          	addi	a0,a0,1280 # 800050d8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xb8>
    80002be0:	00000097          	auipc	ra,0x0
    80002be4:	71c080e7          	jalr	1820(ra) # 800032fc <panic>

0000000080002be8 <clockintr>:
    80002be8:	fe010113          	addi	sp,sp,-32
    80002bec:	00813823          	sd	s0,16(sp)
    80002bf0:	00913423          	sd	s1,8(sp)
    80002bf4:	00113c23          	sd	ra,24(sp)
    80002bf8:	02010413          	addi	s0,sp,32
    80002bfc:	00004497          	auipc	s1,0x4
    80002c00:	e1448493          	addi	s1,s1,-492 # 80006a10 <tickslock>
    80002c04:	00048513          	mv	a0,s1
    80002c08:	00001097          	auipc	ra,0x1
    80002c0c:	424080e7          	jalr	1060(ra) # 8000402c <acquire>
    80002c10:	00003717          	auipc	a4,0x3
    80002c14:	cf470713          	addi	a4,a4,-780 # 80005904 <ticks>
    80002c18:	00072783          	lw	a5,0(a4)
    80002c1c:	01013403          	ld	s0,16(sp)
    80002c20:	01813083          	ld	ra,24(sp)
    80002c24:	00048513          	mv	a0,s1
    80002c28:	0017879b          	addiw	a5,a5,1
    80002c2c:	00813483          	ld	s1,8(sp)
    80002c30:	00f72023          	sw	a5,0(a4)
    80002c34:	02010113          	addi	sp,sp,32
    80002c38:	00001317          	auipc	t1,0x1
    80002c3c:	4c030067          	jr	1216(t1) # 800040f8 <release>

0000000080002c40 <devintr>:
    80002c40:	142027f3          	csrr	a5,scause
    80002c44:	00000513          	li	a0,0
    80002c48:	0007c463          	bltz	a5,80002c50 <devintr+0x10>
    80002c4c:	00008067          	ret
    80002c50:	fe010113          	addi	sp,sp,-32
    80002c54:	00813823          	sd	s0,16(sp)
    80002c58:	00113c23          	sd	ra,24(sp)
    80002c5c:	00913423          	sd	s1,8(sp)
    80002c60:	02010413          	addi	s0,sp,32
    80002c64:	0ff7f713          	andi	a4,a5,255
    80002c68:	00900693          	li	a3,9
    80002c6c:	04d70c63          	beq	a4,a3,80002cc4 <devintr+0x84>
    80002c70:	fff00713          	li	a4,-1
    80002c74:	03f71713          	slli	a4,a4,0x3f
    80002c78:	00170713          	addi	a4,a4,1
    80002c7c:	00e78c63          	beq	a5,a4,80002c94 <devintr+0x54>
    80002c80:	01813083          	ld	ra,24(sp)
    80002c84:	01013403          	ld	s0,16(sp)
    80002c88:	00813483          	ld	s1,8(sp)
    80002c8c:	02010113          	addi	sp,sp,32
    80002c90:	00008067          	ret
    80002c94:	00000097          	auipc	ra,0x0
    80002c98:	c8c080e7          	jalr	-884(ra) # 80002920 <cpuid>
    80002c9c:	06050663          	beqz	a0,80002d08 <devintr+0xc8>
    80002ca0:	144027f3          	csrr	a5,sip
    80002ca4:	ffd7f793          	andi	a5,a5,-3
    80002ca8:	14479073          	csrw	sip,a5
    80002cac:	01813083          	ld	ra,24(sp)
    80002cb0:	01013403          	ld	s0,16(sp)
    80002cb4:	00813483          	ld	s1,8(sp)
    80002cb8:	00200513          	li	a0,2
    80002cbc:	02010113          	addi	sp,sp,32
    80002cc0:	00008067          	ret
    80002cc4:	00000097          	auipc	ra,0x0
    80002cc8:	250080e7          	jalr	592(ra) # 80002f14 <plic_claim>
    80002ccc:	00a00793          	li	a5,10
    80002cd0:	00050493          	mv	s1,a0
    80002cd4:	06f50663          	beq	a0,a5,80002d40 <devintr+0x100>
    80002cd8:	00100513          	li	a0,1
    80002cdc:	fa0482e3          	beqz	s1,80002c80 <devintr+0x40>
    80002ce0:	00048593          	mv	a1,s1
    80002ce4:	00002517          	auipc	a0,0x2
    80002ce8:	41450513          	addi	a0,a0,1044 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    80002cec:	00000097          	auipc	ra,0x0
    80002cf0:	66c080e7          	jalr	1644(ra) # 80003358 <__printf>
    80002cf4:	00048513          	mv	a0,s1
    80002cf8:	00000097          	auipc	ra,0x0
    80002cfc:	254080e7          	jalr	596(ra) # 80002f4c <plic_complete>
    80002d00:	00100513          	li	a0,1
    80002d04:	f7dff06f          	j	80002c80 <devintr+0x40>
    80002d08:	00004517          	auipc	a0,0x4
    80002d0c:	d0850513          	addi	a0,a0,-760 # 80006a10 <tickslock>
    80002d10:	00001097          	auipc	ra,0x1
    80002d14:	31c080e7          	jalr	796(ra) # 8000402c <acquire>
    80002d18:	00003717          	auipc	a4,0x3
    80002d1c:	bec70713          	addi	a4,a4,-1044 # 80005904 <ticks>
    80002d20:	00072783          	lw	a5,0(a4)
    80002d24:	00004517          	auipc	a0,0x4
    80002d28:	cec50513          	addi	a0,a0,-788 # 80006a10 <tickslock>
    80002d2c:	0017879b          	addiw	a5,a5,1
    80002d30:	00f72023          	sw	a5,0(a4)
    80002d34:	00001097          	auipc	ra,0x1
    80002d38:	3c4080e7          	jalr	964(ra) # 800040f8 <release>
    80002d3c:	f65ff06f          	j	80002ca0 <devintr+0x60>
    80002d40:	00001097          	auipc	ra,0x1
    80002d44:	f20080e7          	jalr	-224(ra) # 80003c60 <uartintr>
    80002d48:	fadff06f          	j	80002cf4 <devintr+0xb4>
    80002d4c:	0000                	unimp
	...

0000000080002d50 <kernelvec>:
    80002d50:	f0010113          	addi	sp,sp,-256
    80002d54:	00113023          	sd	ra,0(sp)
    80002d58:	00213423          	sd	sp,8(sp)
    80002d5c:	00313823          	sd	gp,16(sp)
    80002d60:	00413c23          	sd	tp,24(sp)
    80002d64:	02513023          	sd	t0,32(sp)
    80002d68:	02613423          	sd	t1,40(sp)
    80002d6c:	02713823          	sd	t2,48(sp)
    80002d70:	02813c23          	sd	s0,56(sp)
    80002d74:	04913023          	sd	s1,64(sp)
    80002d78:	04a13423          	sd	a0,72(sp)
    80002d7c:	04b13823          	sd	a1,80(sp)
    80002d80:	04c13c23          	sd	a2,88(sp)
    80002d84:	06d13023          	sd	a3,96(sp)
    80002d88:	06e13423          	sd	a4,104(sp)
    80002d8c:	06f13823          	sd	a5,112(sp)
    80002d90:	07013c23          	sd	a6,120(sp)
    80002d94:	09113023          	sd	a7,128(sp)
    80002d98:	09213423          	sd	s2,136(sp)
    80002d9c:	09313823          	sd	s3,144(sp)
    80002da0:	09413c23          	sd	s4,152(sp)
    80002da4:	0b513023          	sd	s5,160(sp)
    80002da8:	0b613423          	sd	s6,168(sp)
    80002dac:	0b713823          	sd	s7,176(sp)
    80002db0:	0b813c23          	sd	s8,184(sp)
    80002db4:	0d913023          	sd	s9,192(sp)
    80002db8:	0da13423          	sd	s10,200(sp)
    80002dbc:	0db13823          	sd	s11,208(sp)
    80002dc0:	0dc13c23          	sd	t3,216(sp)
    80002dc4:	0fd13023          	sd	t4,224(sp)
    80002dc8:	0fe13423          	sd	t5,232(sp)
    80002dcc:	0ff13823          	sd	t6,240(sp)
    80002dd0:	cd1ff0ef          	jal	ra,80002aa0 <kerneltrap>
    80002dd4:	00013083          	ld	ra,0(sp)
    80002dd8:	00813103          	ld	sp,8(sp)
    80002ddc:	01013183          	ld	gp,16(sp)
    80002de0:	02013283          	ld	t0,32(sp)
    80002de4:	02813303          	ld	t1,40(sp)
    80002de8:	03013383          	ld	t2,48(sp)
    80002dec:	03813403          	ld	s0,56(sp)
    80002df0:	04013483          	ld	s1,64(sp)
    80002df4:	04813503          	ld	a0,72(sp)
    80002df8:	05013583          	ld	a1,80(sp)
    80002dfc:	05813603          	ld	a2,88(sp)
    80002e00:	06013683          	ld	a3,96(sp)
    80002e04:	06813703          	ld	a4,104(sp)
    80002e08:	07013783          	ld	a5,112(sp)
    80002e0c:	07813803          	ld	a6,120(sp)
    80002e10:	08013883          	ld	a7,128(sp)
    80002e14:	08813903          	ld	s2,136(sp)
    80002e18:	09013983          	ld	s3,144(sp)
    80002e1c:	09813a03          	ld	s4,152(sp)
    80002e20:	0a013a83          	ld	s5,160(sp)
    80002e24:	0a813b03          	ld	s6,168(sp)
    80002e28:	0b013b83          	ld	s7,176(sp)
    80002e2c:	0b813c03          	ld	s8,184(sp)
    80002e30:	0c013c83          	ld	s9,192(sp)
    80002e34:	0c813d03          	ld	s10,200(sp)
    80002e38:	0d013d83          	ld	s11,208(sp)
    80002e3c:	0d813e03          	ld	t3,216(sp)
    80002e40:	0e013e83          	ld	t4,224(sp)
    80002e44:	0e813f03          	ld	t5,232(sp)
    80002e48:	0f013f83          	ld	t6,240(sp)
    80002e4c:	10010113          	addi	sp,sp,256
    80002e50:	10200073          	sret
    80002e54:	00000013          	nop
    80002e58:	00000013          	nop
    80002e5c:	00000013          	nop

0000000080002e60 <timervec>:
    80002e60:	34051573          	csrrw	a0,mscratch,a0
    80002e64:	00b53023          	sd	a1,0(a0)
    80002e68:	00c53423          	sd	a2,8(a0)
    80002e6c:	00d53823          	sd	a3,16(a0)
    80002e70:	01853583          	ld	a1,24(a0)
    80002e74:	02053603          	ld	a2,32(a0)
    80002e78:	0005b683          	ld	a3,0(a1)
    80002e7c:	00c686b3          	add	a3,a3,a2
    80002e80:	00d5b023          	sd	a3,0(a1)
    80002e84:	00200593          	li	a1,2
    80002e88:	14459073          	csrw	sip,a1
    80002e8c:	01053683          	ld	a3,16(a0)
    80002e90:	00853603          	ld	a2,8(a0)
    80002e94:	00053583          	ld	a1,0(a0)
    80002e98:	34051573          	csrrw	a0,mscratch,a0
    80002e9c:	30200073          	mret

0000000080002ea0 <plicinit>:
    80002ea0:	ff010113          	addi	sp,sp,-16
    80002ea4:	00813423          	sd	s0,8(sp)
    80002ea8:	01010413          	addi	s0,sp,16
    80002eac:	00813403          	ld	s0,8(sp)
    80002eb0:	0c0007b7          	lui	a5,0xc000
    80002eb4:	00100713          	li	a4,1
    80002eb8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002ebc:	00e7a223          	sw	a4,4(a5)
    80002ec0:	01010113          	addi	sp,sp,16
    80002ec4:	00008067          	ret

0000000080002ec8 <plicinithart>:
    80002ec8:	ff010113          	addi	sp,sp,-16
    80002ecc:	00813023          	sd	s0,0(sp)
    80002ed0:	00113423          	sd	ra,8(sp)
    80002ed4:	01010413          	addi	s0,sp,16
    80002ed8:	00000097          	auipc	ra,0x0
    80002edc:	a48080e7          	jalr	-1464(ra) # 80002920 <cpuid>
    80002ee0:	0085171b          	slliw	a4,a0,0x8
    80002ee4:	0c0027b7          	lui	a5,0xc002
    80002ee8:	00e787b3          	add	a5,a5,a4
    80002eec:	40200713          	li	a4,1026
    80002ef0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002ef4:	00813083          	ld	ra,8(sp)
    80002ef8:	00013403          	ld	s0,0(sp)
    80002efc:	00d5151b          	slliw	a0,a0,0xd
    80002f00:	0c2017b7          	lui	a5,0xc201
    80002f04:	00a78533          	add	a0,a5,a0
    80002f08:	00052023          	sw	zero,0(a0)
    80002f0c:	01010113          	addi	sp,sp,16
    80002f10:	00008067          	ret

0000000080002f14 <plic_claim>:
    80002f14:	ff010113          	addi	sp,sp,-16
    80002f18:	00813023          	sd	s0,0(sp)
    80002f1c:	00113423          	sd	ra,8(sp)
    80002f20:	01010413          	addi	s0,sp,16
    80002f24:	00000097          	auipc	ra,0x0
    80002f28:	9fc080e7          	jalr	-1540(ra) # 80002920 <cpuid>
    80002f2c:	00813083          	ld	ra,8(sp)
    80002f30:	00013403          	ld	s0,0(sp)
    80002f34:	00d5151b          	slliw	a0,a0,0xd
    80002f38:	0c2017b7          	lui	a5,0xc201
    80002f3c:	00a78533          	add	a0,a5,a0
    80002f40:	00452503          	lw	a0,4(a0)
    80002f44:	01010113          	addi	sp,sp,16
    80002f48:	00008067          	ret

0000000080002f4c <plic_complete>:
    80002f4c:	fe010113          	addi	sp,sp,-32
    80002f50:	00813823          	sd	s0,16(sp)
    80002f54:	00913423          	sd	s1,8(sp)
    80002f58:	00113c23          	sd	ra,24(sp)
    80002f5c:	02010413          	addi	s0,sp,32
    80002f60:	00050493          	mv	s1,a0
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	9bc080e7          	jalr	-1604(ra) # 80002920 <cpuid>
    80002f6c:	01813083          	ld	ra,24(sp)
    80002f70:	01013403          	ld	s0,16(sp)
    80002f74:	00d5179b          	slliw	a5,a0,0xd
    80002f78:	0c201737          	lui	a4,0xc201
    80002f7c:	00f707b3          	add	a5,a4,a5
    80002f80:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002f84:	00813483          	ld	s1,8(sp)
    80002f88:	02010113          	addi	sp,sp,32
    80002f8c:	00008067          	ret

0000000080002f90 <consolewrite>:
    80002f90:	fb010113          	addi	sp,sp,-80
    80002f94:	04813023          	sd	s0,64(sp)
    80002f98:	04113423          	sd	ra,72(sp)
    80002f9c:	02913c23          	sd	s1,56(sp)
    80002fa0:	03213823          	sd	s2,48(sp)
    80002fa4:	03313423          	sd	s3,40(sp)
    80002fa8:	03413023          	sd	s4,32(sp)
    80002fac:	01513c23          	sd	s5,24(sp)
    80002fb0:	05010413          	addi	s0,sp,80
    80002fb4:	06c05c63          	blez	a2,8000302c <consolewrite+0x9c>
    80002fb8:	00060993          	mv	s3,a2
    80002fbc:	00050a13          	mv	s4,a0
    80002fc0:	00058493          	mv	s1,a1
    80002fc4:	00000913          	li	s2,0
    80002fc8:	fff00a93          	li	s5,-1
    80002fcc:	01c0006f          	j	80002fe8 <consolewrite+0x58>
    80002fd0:	fbf44503          	lbu	a0,-65(s0)
    80002fd4:	0019091b          	addiw	s2,s2,1
    80002fd8:	00148493          	addi	s1,s1,1
    80002fdc:	00001097          	auipc	ra,0x1
    80002fe0:	a9c080e7          	jalr	-1380(ra) # 80003a78 <uartputc>
    80002fe4:	03298063          	beq	s3,s2,80003004 <consolewrite+0x74>
    80002fe8:	00048613          	mv	a2,s1
    80002fec:	00100693          	li	a3,1
    80002ff0:	000a0593          	mv	a1,s4
    80002ff4:	fbf40513          	addi	a0,s0,-65
    80002ff8:	00000097          	auipc	ra,0x0
    80002ffc:	9e0080e7          	jalr	-1568(ra) # 800029d8 <either_copyin>
    80003000:	fd5518e3          	bne	a0,s5,80002fd0 <consolewrite+0x40>
    80003004:	04813083          	ld	ra,72(sp)
    80003008:	04013403          	ld	s0,64(sp)
    8000300c:	03813483          	ld	s1,56(sp)
    80003010:	02813983          	ld	s3,40(sp)
    80003014:	02013a03          	ld	s4,32(sp)
    80003018:	01813a83          	ld	s5,24(sp)
    8000301c:	00090513          	mv	a0,s2
    80003020:	03013903          	ld	s2,48(sp)
    80003024:	05010113          	addi	sp,sp,80
    80003028:	00008067          	ret
    8000302c:	00000913          	li	s2,0
    80003030:	fd5ff06f          	j	80003004 <consolewrite+0x74>

0000000080003034 <consoleread>:
    80003034:	f9010113          	addi	sp,sp,-112
    80003038:	06813023          	sd	s0,96(sp)
    8000303c:	04913c23          	sd	s1,88(sp)
    80003040:	05213823          	sd	s2,80(sp)
    80003044:	05313423          	sd	s3,72(sp)
    80003048:	05413023          	sd	s4,64(sp)
    8000304c:	03513c23          	sd	s5,56(sp)
    80003050:	03613823          	sd	s6,48(sp)
    80003054:	03713423          	sd	s7,40(sp)
    80003058:	03813023          	sd	s8,32(sp)
    8000305c:	06113423          	sd	ra,104(sp)
    80003060:	01913c23          	sd	s9,24(sp)
    80003064:	07010413          	addi	s0,sp,112
    80003068:	00060b93          	mv	s7,a2
    8000306c:	00050913          	mv	s2,a0
    80003070:	00058c13          	mv	s8,a1
    80003074:	00060b1b          	sext.w	s6,a2
    80003078:	00004497          	auipc	s1,0x4
    8000307c:	9c048493          	addi	s1,s1,-1600 # 80006a38 <cons>
    80003080:	00400993          	li	s3,4
    80003084:	fff00a13          	li	s4,-1
    80003088:	00a00a93          	li	s5,10
    8000308c:	05705e63          	blez	s7,800030e8 <consoleread+0xb4>
    80003090:	09c4a703          	lw	a4,156(s1)
    80003094:	0984a783          	lw	a5,152(s1)
    80003098:	0007071b          	sext.w	a4,a4
    8000309c:	08e78463          	beq	a5,a4,80003124 <consoleread+0xf0>
    800030a0:	07f7f713          	andi	a4,a5,127
    800030a4:	00e48733          	add	a4,s1,a4
    800030a8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800030ac:	0017869b          	addiw	a3,a5,1
    800030b0:	08d4ac23          	sw	a3,152(s1)
    800030b4:	00070c9b          	sext.w	s9,a4
    800030b8:	0b370663          	beq	a4,s3,80003164 <consoleread+0x130>
    800030bc:	00100693          	li	a3,1
    800030c0:	f9f40613          	addi	a2,s0,-97
    800030c4:	000c0593          	mv	a1,s8
    800030c8:	00090513          	mv	a0,s2
    800030cc:	f8e40fa3          	sb	a4,-97(s0)
    800030d0:	00000097          	auipc	ra,0x0
    800030d4:	8bc080e7          	jalr	-1860(ra) # 8000298c <either_copyout>
    800030d8:	01450863          	beq	a0,s4,800030e8 <consoleread+0xb4>
    800030dc:	001c0c13          	addi	s8,s8,1
    800030e0:	fffb8b9b          	addiw	s7,s7,-1
    800030e4:	fb5c94e3          	bne	s9,s5,8000308c <consoleread+0x58>
    800030e8:	000b851b          	sext.w	a0,s7
    800030ec:	06813083          	ld	ra,104(sp)
    800030f0:	06013403          	ld	s0,96(sp)
    800030f4:	05813483          	ld	s1,88(sp)
    800030f8:	05013903          	ld	s2,80(sp)
    800030fc:	04813983          	ld	s3,72(sp)
    80003100:	04013a03          	ld	s4,64(sp)
    80003104:	03813a83          	ld	s5,56(sp)
    80003108:	02813b83          	ld	s7,40(sp)
    8000310c:	02013c03          	ld	s8,32(sp)
    80003110:	01813c83          	ld	s9,24(sp)
    80003114:	40ab053b          	subw	a0,s6,a0
    80003118:	03013b03          	ld	s6,48(sp)
    8000311c:	07010113          	addi	sp,sp,112
    80003120:	00008067          	ret
    80003124:	00001097          	auipc	ra,0x1
    80003128:	1d8080e7          	jalr	472(ra) # 800042fc <push_on>
    8000312c:	0984a703          	lw	a4,152(s1)
    80003130:	09c4a783          	lw	a5,156(s1)
    80003134:	0007879b          	sext.w	a5,a5
    80003138:	fef70ce3          	beq	a4,a5,80003130 <consoleread+0xfc>
    8000313c:	00001097          	auipc	ra,0x1
    80003140:	234080e7          	jalr	564(ra) # 80004370 <pop_on>
    80003144:	0984a783          	lw	a5,152(s1)
    80003148:	07f7f713          	andi	a4,a5,127
    8000314c:	00e48733          	add	a4,s1,a4
    80003150:	01874703          	lbu	a4,24(a4)
    80003154:	0017869b          	addiw	a3,a5,1
    80003158:	08d4ac23          	sw	a3,152(s1)
    8000315c:	00070c9b          	sext.w	s9,a4
    80003160:	f5371ee3          	bne	a4,s3,800030bc <consoleread+0x88>
    80003164:	000b851b          	sext.w	a0,s7
    80003168:	f96bf2e3          	bgeu	s7,s6,800030ec <consoleread+0xb8>
    8000316c:	08f4ac23          	sw	a5,152(s1)
    80003170:	f7dff06f          	j	800030ec <consoleread+0xb8>

0000000080003174 <consputc>:
    80003174:	10000793          	li	a5,256
    80003178:	00f50663          	beq	a0,a5,80003184 <consputc+0x10>
    8000317c:	00001317          	auipc	t1,0x1
    80003180:	9f430067          	jr	-1548(t1) # 80003b70 <uartputc_sync>
    80003184:	ff010113          	addi	sp,sp,-16
    80003188:	00113423          	sd	ra,8(sp)
    8000318c:	00813023          	sd	s0,0(sp)
    80003190:	01010413          	addi	s0,sp,16
    80003194:	00800513          	li	a0,8
    80003198:	00001097          	auipc	ra,0x1
    8000319c:	9d8080e7          	jalr	-1576(ra) # 80003b70 <uartputc_sync>
    800031a0:	02000513          	li	a0,32
    800031a4:	00001097          	auipc	ra,0x1
    800031a8:	9cc080e7          	jalr	-1588(ra) # 80003b70 <uartputc_sync>
    800031ac:	00013403          	ld	s0,0(sp)
    800031b0:	00813083          	ld	ra,8(sp)
    800031b4:	00800513          	li	a0,8
    800031b8:	01010113          	addi	sp,sp,16
    800031bc:	00001317          	auipc	t1,0x1
    800031c0:	9b430067          	jr	-1612(t1) # 80003b70 <uartputc_sync>

00000000800031c4 <consoleintr>:
    800031c4:	fe010113          	addi	sp,sp,-32
    800031c8:	00813823          	sd	s0,16(sp)
    800031cc:	00913423          	sd	s1,8(sp)
    800031d0:	01213023          	sd	s2,0(sp)
    800031d4:	00113c23          	sd	ra,24(sp)
    800031d8:	02010413          	addi	s0,sp,32
    800031dc:	00004917          	auipc	s2,0x4
    800031e0:	85c90913          	addi	s2,s2,-1956 # 80006a38 <cons>
    800031e4:	00050493          	mv	s1,a0
    800031e8:	00090513          	mv	a0,s2
    800031ec:	00001097          	auipc	ra,0x1
    800031f0:	e40080e7          	jalr	-448(ra) # 8000402c <acquire>
    800031f4:	02048c63          	beqz	s1,8000322c <consoleintr+0x68>
    800031f8:	0a092783          	lw	a5,160(s2)
    800031fc:	09892703          	lw	a4,152(s2)
    80003200:	07f00693          	li	a3,127
    80003204:	40e7873b          	subw	a4,a5,a4
    80003208:	02e6e263          	bltu	a3,a4,8000322c <consoleintr+0x68>
    8000320c:	00d00713          	li	a4,13
    80003210:	04e48063          	beq	s1,a4,80003250 <consoleintr+0x8c>
    80003214:	07f7f713          	andi	a4,a5,127
    80003218:	00e90733          	add	a4,s2,a4
    8000321c:	0017879b          	addiw	a5,a5,1
    80003220:	0af92023          	sw	a5,160(s2)
    80003224:	00970c23          	sb	s1,24(a4)
    80003228:	08f92e23          	sw	a5,156(s2)
    8000322c:	01013403          	ld	s0,16(sp)
    80003230:	01813083          	ld	ra,24(sp)
    80003234:	00813483          	ld	s1,8(sp)
    80003238:	00013903          	ld	s2,0(sp)
    8000323c:	00003517          	auipc	a0,0x3
    80003240:	7fc50513          	addi	a0,a0,2044 # 80006a38 <cons>
    80003244:	02010113          	addi	sp,sp,32
    80003248:	00001317          	auipc	t1,0x1
    8000324c:	eb030067          	jr	-336(t1) # 800040f8 <release>
    80003250:	00a00493          	li	s1,10
    80003254:	fc1ff06f          	j	80003214 <consoleintr+0x50>

0000000080003258 <consoleinit>:
    80003258:	fe010113          	addi	sp,sp,-32
    8000325c:	00113c23          	sd	ra,24(sp)
    80003260:	00813823          	sd	s0,16(sp)
    80003264:	00913423          	sd	s1,8(sp)
    80003268:	02010413          	addi	s0,sp,32
    8000326c:	00003497          	auipc	s1,0x3
    80003270:	7cc48493          	addi	s1,s1,1996 # 80006a38 <cons>
    80003274:	00048513          	mv	a0,s1
    80003278:	00002597          	auipc	a1,0x2
    8000327c:	ed858593          	addi	a1,a1,-296 # 80005150 <_ZN15MemoryAllocator11HEADER_SIZEE+0x130>
    80003280:	00001097          	auipc	ra,0x1
    80003284:	d88080e7          	jalr	-632(ra) # 80004008 <initlock>
    80003288:	00000097          	auipc	ra,0x0
    8000328c:	7ac080e7          	jalr	1964(ra) # 80003a34 <uartinit>
    80003290:	01813083          	ld	ra,24(sp)
    80003294:	01013403          	ld	s0,16(sp)
    80003298:	00000797          	auipc	a5,0x0
    8000329c:	d9c78793          	addi	a5,a5,-612 # 80003034 <consoleread>
    800032a0:	0af4bc23          	sd	a5,184(s1)
    800032a4:	00000797          	auipc	a5,0x0
    800032a8:	cec78793          	addi	a5,a5,-788 # 80002f90 <consolewrite>
    800032ac:	0cf4b023          	sd	a5,192(s1)
    800032b0:	00813483          	ld	s1,8(sp)
    800032b4:	02010113          	addi	sp,sp,32
    800032b8:	00008067          	ret

00000000800032bc <console_read>:
    800032bc:	ff010113          	addi	sp,sp,-16
    800032c0:	00813423          	sd	s0,8(sp)
    800032c4:	01010413          	addi	s0,sp,16
    800032c8:	00813403          	ld	s0,8(sp)
    800032cc:	00004317          	auipc	t1,0x4
    800032d0:	82433303          	ld	t1,-2012(t1) # 80006af0 <devsw+0x10>
    800032d4:	01010113          	addi	sp,sp,16
    800032d8:	00030067          	jr	t1

00000000800032dc <console_write>:
    800032dc:	ff010113          	addi	sp,sp,-16
    800032e0:	00813423          	sd	s0,8(sp)
    800032e4:	01010413          	addi	s0,sp,16
    800032e8:	00813403          	ld	s0,8(sp)
    800032ec:	00004317          	auipc	t1,0x4
    800032f0:	80c33303          	ld	t1,-2036(t1) # 80006af8 <devsw+0x18>
    800032f4:	01010113          	addi	sp,sp,16
    800032f8:	00030067          	jr	t1

00000000800032fc <panic>:
    800032fc:	fe010113          	addi	sp,sp,-32
    80003300:	00113c23          	sd	ra,24(sp)
    80003304:	00813823          	sd	s0,16(sp)
    80003308:	00913423          	sd	s1,8(sp)
    8000330c:	02010413          	addi	s0,sp,32
    80003310:	00050493          	mv	s1,a0
    80003314:	00002517          	auipc	a0,0x2
    80003318:	e4450513          	addi	a0,a0,-444 # 80005158 <_ZN15MemoryAllocator11HEADER_SIZEE+0x138>
    8000331c:	00004797          	auipc	a5,0x4
    80003320:	8607ae23          	sw	zero,-1924(a5) # 80006b98 <pr+0x18>
    80003324:	00000097          	auipc	ra,0x0
    80003328:	034080e7          	jalr	52(ra) # 80003358 <__printf>
    8000332c:	00048513          	mv	a0,s1
    80003330:	00000097          	auipc	ra,0x0
    80003334:	028080e7          	jalr	40(ra) # 80003358 <__printf>
    80003338:	00002517          	auipc	a0,0x2
    8000333c:	e0050513          	addi	a0,a0,-512 # 80005138 <_ZN15MemoryAllocator11HEADER_SIZEE+0x118>
    80003340:	00000097          	auipc	ra,0x0
    80003344:	018080e7          	jalr	24(ra) # 80003358 <__printf>
    80003348:	00100793          	li	a5,1
    8000334c:	00002717          	auipc	a4,0x2
    80003350:	5af72e23          	sw	a5,1468(a4) # 80005908 <panicked>
    80003354:	0000006f          	j	80003354 <panic+0x58>

0000000080003358 <__printf>:
    80003358:	f3010113          	addi	sp,sp,-208
    8000335c:	08813023          	sd	s0,128(sp)
    80003360:	07313423          	sd	s3,104(sp)
    80003364:	09010413          	addi	s0,sp,144
    80003368:	05813023          	sd	s8,64(sp)
    8000336c:	08113423          	sd	ra,136(sp)
    80003370:	06913c23          	sd	s1,120(sp)
    80003374:	07213823          	sd	s2,112(sp)
    80003378:	07413023          	sd	s4,96(sp)
    8000337c:	05513c23          	sd	s5,88(sp)
    80003380:	05613823          	sd	s6,80(sp)
    80003384:	05713423          	sd	s7,72(sp)
    80003388:	03913c23          	sd	s9,56(sp)
    8000338c:	03a13823          	sd	s10,48(sp)
    80003390:	03b13423          	sd	s11,40(sp)
    80003394:	00003317          	auipc	t1,0x3
    80003398:	7ec30313          	addi	t1,t1,2028 # 80006b80 <pr>
    8000339c:	01832c03          	lw	s8,24(t1)
    800033a0:	00b43423          	sd	a1,8(s0)
    800033a4:	00c43823          	sd	a2,16(s0)
    800033a8:	00d43c23          	sd	a3,24(s0)
    800033ac:	02e43023          	sd	a4,32(s0)
    800033b0:	02f43423          	sd	a5,40(s0)
    800033b4:	03043823          	sd	a6,48(s0)
    800033b8:	03143c23          	sd	a7,56(s0)
    800033bc:	00050993          	mv	s3,a0
    800033c0:	4a0c1663          	bnez	s8,8000386c <__printf+0x514>
    800033c4:	60098c63          	beqz	s3,800039dc <__printf+0x684>
    800033c8:	0009c503          	lbu	a0,0(s3)
    800033cc:	00840793          	addi	a5,s0,8
    800033d0:	f6f43c23          	sd	a5,-136(s0)
    800033d4:	00000493          	li	s1,0
    800033d8:	22050063          	beqz	a0,800035f8 <__printf+0x2a0>
    800033dc:	00002a37          	lui	s4,0x2
    800033e0:	00018ab7          	lui	s5,0x18
    800033e4:	000f4b37          	lui	s6,0xf4
    800033e8:	00989bb7          	lui	s7,0x989
    800033ec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800033f0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800033f4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800033f8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800033fc:	00148c9b          	addiw	s9,s1,1
    80003400:	02500793          	li	a5,37
    80003404:	01998933          	add	s2,s3,s9
    80003408:	38f51263          	bne	a0,a5,8000378c <__printf+0x434>
    8000340c:	00094783          	lbu	a5,0(s2)
    80003410:	00078c9b          	sext.w	s9,a5
    80003414:	1e078263          	beqz	a5,800035f8 <__printf+0x2a0>
    80003418:	0024849b          	addiw	s1,s1,2
    8000341c:	07000713          	li	a4,112
    80003420:	00998933          	add	s2,s3,s1
    80003424:	38e78a63          	beq	a5,a4,800037b8 <__printf+0x460>
    80003428:	20f76863          	bltu	a4,a5,80003638 <__printf+0x2e0>
    8000342c:	42a78863          	beq	a5,a0,8000385c <__printf+0x504>
    80003430:	06400713          	li	a4,100
    80003434:	40e79663          	bne	a5,a4,80003840 <__printf+0x4e8>
    80003438:	f7843783          	ld	a5,-136(s0)
    8000343c:	0007a603          	lw	a2,0(a5)
    80003440:	00878793          	addi	a5,a5,8
    80003444:	f6f43c23          	sd	a5,-136(s0)
    80003448:	42064a63          	bltz	a2,8000387c <__printf+0x524>
    8000344c:	00a00713          	li	a4,10
    80003450:	02e677bb          	remuw	a5,a2,a4
    80003454:	00002d97          	auipc	s11,0x2
    80003458:	d2cd8d93          	addi	s11,s11,-724 # 80005180 <digits>
    8000345c:	00900593          	li	a1,9
    80003460:	0006051b          	sext.w	a0,a2
    80003464:	00000c93          	li	s9,0
    80003468:	02079793          	slli	a5,a5,0x20
    8000346c:	0207d793          	srli	a5,a5,0x20
    80003470:	00fd87b3          	add	a5,s11,a5
    80003474:	0007c783          	lbu	a5,0(a5)
    80003478:	02e656bb          	divuw	a3,a2,a4
    8000347c:	f8f40023          	sb	a5,-128(s0)
    80003480:	14c5d863          	bge	a1,a2,800035d0 <__printf+0x278>
    80003484:	06300593          	li	a1,99
    80003488:	00100c93          	li	s9,1
    8000348c:	02e6f7bb          	remuw	a5,a3,a4
    80003490:	02079793          	slli	a5,a5,0x20
    80003494:	0207d793          	srli	a5,a5,0x20
    80003498:	00fd87b3          	add	a5,s11,a5
    8000349c:	0007c783          	lbu	a5,0(a5)
    800034a0:	02e6d73b          	divuw	a4,a3,a4
    800034a4:	f8f400a3          	sb	a5,-127(s0)
    800034a8:	12a5f463          	bgeu	a1,a0,800035d0 <__printf+0x278>
    800034ac:	00a00693          	li	a3,10
    800034b0:	00900593          	li	a1,9
    800034b4:	02d777bb          	remuw	a5,a4,a3
    800034b8:	02079793          	slli	a5,a5,0x20
    800034bc:	0207d793          	srli	a5,a5,0x20
    800034c0:	00fd87b3          	add	a5,s11,a5
    800034c4:	0007c503          	lbu	a0,0(a5)
    800034c8:	02d757bb          	divuw	a5,a4,a3
    800034cc:	f8a40123          	sb	a0,-126(s0)
    800034d0:	48e5f263          	bgeu	a1,a4,80003954 <__printf+0x5fc>
    800034d4:	06300513          	li	a0,99
    800034d8:	02d7f5bb          	remuw	a1,a5,a3
    800034dc:	02059593          	slli	a1,a1,0x20
    800034e0:	0205d593          	srli	a1,a1,0x20
    800034e4:	00bd85b3          	add	a1,s11,a1
    800034e8:	0005c583          	lbu	a1,0(a1)
    800034ec:	02d7d7bb          	divuw	a5,a5,a3
    800034f0:	f8b401a3          	sb	a1,-125(s0)
    800034f4:	48e57263          	bgeu	a0,a4,80003978 <__printf+0x620>
    800034f8:	3e700513          	li	a0,999
    800034fc:	02d7f5bb          	remuw	a1,a5,a3
    80003500:	02059593          	slli	a1,a1,0x20
    80003504:	0205d593          	srli	a1,a1,0x20
    80003508:	00bd85b3          	add	a1,s11,a1
    8000350c:	0005c583          	lbu	a1,0(a1)
    80003510:	02d7d7bb          	divuw	a5,a5,a3
    80003514:	f8b40223          	sb	a1,-124(s0)
    80003518:	46e57663          	bgeu	a0,a4,80003984 <__printf+0x62c>
    8000351c:	02d7f5bb          	remuw	a1,a5,a3
    80003520:	02059593          	slli	a1,a1,0x20
    80003524:	0205d593          	srli	a1,a1,0x20
    80003528:	00bd85b3          	add	a1,s11,a1
    8000352c:	0005c583          	lbu	a1,0(a1)
    80003530:	02d7d7bb          	divuw	a5,a5,a3
    80003534:	f8b402a3          	sb	a1,-123(s0)
    80003538:	46ea7863          	bgeu	s4,a4,800039a8 <__printf+0x650>
    8000353c:	02d7f5bb          	remuw	a1,a5,a3
    80003540:	02059593          	slli	a1,a1,0x20
    80003544:	0205d593          	srli	a1,a1,0x20
    80003548:	00bd85b3          	add	a1,s11,a1
    8000354c:	0005c583          	lbu	a1,0(a1)
    80003550:	02d7d7bb          	divuw	a5,a5,a3
    80003554:	f8b40323          	sb	a1,-122(s0)
    80003558:	3eeaf863          	bgeu	s5,a4,80003948 <__printf+0x5f0>
    8000355c:	02d7f5bb          	remuw	a1,a5,a3
    80003560:	02059593          	slli	a1,a1,0x20
    80003564:	0205d593          	srli	a1,a1,0x20
    80003568:	00bd85b3          	add	a1,s11,a1
    8000356c:	0005c583          	lbu	a1,0(a1)
    80003570:	02d7d7bb          	divuw	a5,a5,a3
    80003574:	f8b403a3          	sb	a1,-121(s0)
    80003578:	42eb7e63          	bgeu	s6,a4,800039b4 <__printf+0x65c>
    8000357c:	02d7f5bb          	remuw	a1,a5,a3
    80003580:	02059593          	slli	a1,a1,0x20
    80003584:	0205d593          	srli	a1,a1,0x20
    80003588:	00bd85b3          	add	a1,s11,a1
    8000358c:	0005c583          	lbu	a1,0(a1)
    80003590:	02d7d7bb          	divuw	a5,a5,a3
    80003594:	f8b40423          	sb	a1,-120(s0)
    80003598:	42ebfc63          	bgeu	s7,a4,800039d0 <__printf+0x678>
    8000359c:	02079793          	slli	a5,a5,0x20
    800035a0:	0207d793          	srli	a5,a5,0x20
    800035a4:	00fd8db3          	add	s11,s11,a5
    800035a8:	000dc703          	lbu	a4,0(s11)
    800035ac:	00a00793          	li	a5,10
    800035b0:	00900c93          	li	s9,9
    800035b4:	f8e404a3          	sb	a4,-119(s0)
    800035b8:	00065c63          	bgez	a2,800035d0 <__printf+0x278>
    800035bc:	f9040713          	addi	a4,s0,-112
    800035c0:	00f70733          	add	a4,a4,a5
    800035c4:	02d00693          	li	a3,45
    800035c8:	fed70823          	sb	a3,-16(a4)
    800035cc:	00078c93          	mv	s9,a5
    800035d0:	f8040793          	addi	a5,s0,-128
    800035d4:	01978cb3          	add	s9,a5,s9
    800035d8:	f7f40d13          	addi	s10,s0,-129
    800035dc:	000cc503          	lbu	a0,0(s9)
    800035e0:	fffc8c93          	addi	s9,s9,-1
    800035e4:	00000097          	auipc	ra,0x0
    800035e8:	b90080e7          	jalr	-1136(ra) # 80003174 <consputc>
    800035ec:	ffac98e3          	bne	s9,s10,800035dc <__printf+0x284>
    800035f0:	00094503          	lbu	a0,0(s2)
    800035f4:	e00514e3          	bnez	a0,800033fc <__printf+0xa4>
    800035f8:	1a0c1663          	bnez	s8,800037a4 <__printf+0x44c>
    800035fc:	08813083          	ld	ra,136(sp)
    80003600:	08013403          	ld	s0,128(sp)
    80003604:	07813483          	ld	s1,120(sp)
    80003608:	07013903          	ld	s2,112(sp)
    8000360c:	06813983          	ld	s3,104(sp)
    80003610:	06013a03          	ld	s4,96(sp)
    80003614:	05813a83          	ld	s5,88(sp)
    80003618:	05013b03          	ld	s6,80(sp)
    8000361c:	04813b83          	ld	s7,72(sp)
    80003620:	04013c03          	ld	s8,64(sp)
    80003624:	03813c83          	ld	s9,56(sp)
    80003628:	03013d03          	ld	s10,48(sp)
    8000362c:	02813d83          	ld	s11,40(sp)
    80003630:	0d010113          	addi	sp,sp,208
    80003634:	00008067          	ret
    80003638:	07300713          	li	a4,115
    8000363c:	1ce78a63          	beq	a5,a4,80003810 <__printf+0x4b8>
    80003640:	07800713          	li	a4,120
    80003644:	1ee79e63          	bne	a5,a4,80003840 <__printf+0x4e8>
    80003648:	f7843783          	ld	a5,-136(s0)
    8000364c:	0007a703          	lw	a4,0(a5)
    80003650:	00878793          	addi	a5,a5,8
    80003654:	f6f43c23          	sd	a5,-136(s0)
    80003658:	28074263          	bltz	a4,800038dc <__printf+0x584>
    8000365c:	00002d97          	auipc	s11,0x2
    80003660:	b24d8d93          	addi	s11,s11,-1244 # 80005180 <digits>
    80003664:	00f77793          	andi	a5,a4,15
    80003668:	00fd87b3          	add	a5,s11,a5
    8000366c:	0007c683          	lbu	a3,0(a5)
    80003670:	00f00613          	li	a2,15
    80003674:	0007079b          	sext.w	a5,a4
    80003678:	f8d40023          	sb	a3,-128(s0)
    8000367c:	0047559b          	srliw	a1,a4,0x4
    80003680:	0047569b          	srliw	a3,a4,0x4
    80003684:	00000c93          	li	s9,0
    80003688:	0ee65063          	bge	a2,a4,80003768 <__printf+0x410>
    8000368c:	00f6f693          	andi	a3,a3,15
    80003690:	00dd86b3          	add	a3,s11,a3
    80003694:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003698:	0087d79b          	srliw	a5,a5,0x8
    8000369c:	00100c93          	li	s9,1
    800036a0:	f8d400a3          	sb	a3,-127(s0)
    800036a4:	0cb67263          	bgeu	a2,a1,80003768 <__printf+0x410>
    800036a8:	00f7f693          	andi	a3,a5,15
    800036ac:	00dd86b3          	add	a3,s11,a3
    800036b0:	0006c583          	lbu	a1,0(a3)
    800036b4:	00f00613          	li	a2,15
    800036b8:	0047d69b          	srliw	a3,a5,0x4
    800036bc:	f8b40123          	sb	a1,-126(s0)
    800036c0:	0047d593          	srli	a1,a5,0x4
    800036c4:	28f67e63          	bgeu	a2,a5,80003960 <__printf+0x608>
    800036c8:	00f6f693          	andi	a3,a3,15
    800036cc:	00dd86b3          	add	a3,s11,a3
    800036d0:	0006c503          	lbu	a0,0(a3)
    800036d4:	0087d813          	srli	a6,a5,0x8
    800036d8:	0087d69b          	srliw	a3,a5,0x8
    800036dc:	f8a401a3          	sb	a0,-125(s0)
    800036e0:	28b67663          	bgeu	a2,a1,8000396c <__printf+0x614>
    800036e4:	00f6f693          	andi	a3,a3,15
    800036e8:	00dd86b3          	add	a3,s11,a3
    800036ec:	0006c583          	lbu	a1,0(a3)
    800036f0:	00c7d513          	srli	a0,a5,0xc
    800036f4:	00c7d69b          	srliw	a3,a5,0xc
    800036f8:	f8b40223          	sb	a1,-124(s0)
    800036fc:	29067a63          	bgeu	a2,a6,80003990 <__printf+0x638>
    80003700:	00f6f693          	andi	a3,a3,15
    80003704:	00dd86b3          	add	a3,s11,a3
    80003708:	0006c583          	lbu	a1,0(a3)
    8000370c:	0107d813          	srli	a6,a5,0x10
    80003710:	0107d69b          	srliw	a3,a5,0x10
    80003714:	f8b402a3          	sb	a1,-123(s0)
    80003718:	28a67263          	bgeu	a2,a0,8000399c <__printf+0x644>
    8000371c:	00f6f693          	andi	a3,a3,15
    80003720:	00dd86b3          	add	a3,s11,a3
    80003724:	0006c683          	lbu	a3,0(a3)
    80003728:	0147d79b          	srliw	a5,a5,0x14
    8000372c:	f8d40323          	sb	a3,-122(s0)
    80003730:	21067663          	bgeu	a2,a6,8000393c <__printf+0x5e4>
    80003734:	02079793          	slli	a5,a5,0x20
    80003738:	0207d793          	srli	a5,a5,0x20
    8000373c:	00fd8db3          	add	s11,s11,a5
    80003740:	000dc683          	lbu	a3,0(s11)
    80003744:	00800793          	li	a5,8
    80003748:	00700c93          	li	s9,7
    8000374c:	f8d403a3          	sb	a3,-121(s0)
    80003750:	00075c63          	bgez	a4,80003768 <__printf+0x410>
    80003754:	f9040713          	addi	a4,s0,-112
    80003758:	00f70733          	add	a4,a4,a5
    8000375c:	02d00693          	li	a3,45
    80003760:	fed70823          	sb	a3,-16(a4)
    80003764:	00078c93          	mv	s9,a5
    80003768:	f8040793          	addi	a5,s0,-128
    8000376c:	01978cb3          	add	s9,a5,s9
    80003770:	f7f40d13          	addi	s10,s0,-129
    80003774:	000cc503          	lbu	a0,0(s9)
    80003778:	fffc8c93          	addi	s9,s9,-1
    8000377c:	00000097          	auipc	ra,0x0
    80003780:	9f8080e7          	jalr	-1544(ra) # 80003174 <consputc>
    80003784:	ff9d18e3          	bne	s10,s9,80003774 <__printf+0x41c>
    80003788:	0100006f          	j	80003798 <__printf+0x440>
    8000378c:	00000097          	auipc	ra,0x0
    80003790:	9e8080e7          	jalr	-1560(ra) # 80003174 <consputc>
    80003794:	000c8493          	mv	s1,s9
    80003798:	00094503          	lbu	a0,0(s2)
    8000379c:	c60510e3          	bnez	a0,800033fc <__printf+0xa4>
    800037a0:	e40c0ee3          	beqz	s8,800035fc <__printf+0x2a4>
    800037a4:	00003517          	auipc	a0,0x3
    800037a8:	3dc50513          	addi	a0,a0,988 # 80006b80 <pr>
    800037ac:	00001097          	auipc	ra,0x1
    800037b0:	94c080e7          	jalr	-1716(ra) # 800040f8 <release>
    800037b4:	e49ff06f          	j	800035fc <__printf+0x2a4>
    800037b8:	f7843783          	ld	a5,-136(s0)
    800037bc:	03000513          	li	a0,48
    800037c0:	01000d13          	li	s10,16
    800037c4:	00878713          	addi	a4,a5,8
    800037c8:	0007bc83          	ld	s9,0(a5)
    800037cc:	f6e43c23          	sd	a4,-136(s0)
    800037d0:	00000097          	auipc	ra,0x0
    800037d4:	9a4080e7          	jalr	-1628(ra) # 80003174 <consputc>
    800037d8:	07800513          	li	a0,120
    800037dc:	00000097          	auipc	ra,0x0
    800037e0:	998080e7          	jalr	-1640(ra) # 80003174 <consputc>
    800037e4:	00002d97          	auipc	s11,0x2
    800037e8:	99cd8d93          	addi	s11,s11,-1636 # 80005180 <digits>
    800037ec:	03ccd793          	srli	a5,s9,0x3c
    800037f0:	00fd87b3          	add	a5,s11,a5
    800037f4:	0007c503          	lbu	a0,0(a5)
    800037f8:	fffd0d1b          	addiw	s10,s10,-1
    800037fc:	004c9c93          	slli	s9,s9,0x4
    80003800:	00000097          	auipc	ra,0x0
    80003804:	974080e7          	jalr	-1676(ra) # 80003174 <consputc>
    80003808:	fe0d12e3          	bnez	s10,800037ec <__printf+0x494>
    8000380c:	f8dff06f          	j	80003798 <__printf+0x440>
    80003810:	f7843783          	ld	a5,-136(s0)
    80003814:	0007bc83          	ld	s9,0(a5)
    80003818:	00878793          	addi	a5,a5,8
    8000381c:	f6f43c23          	sd	a5,-136(s0)
    80003820:	000c9a63          	bnez	s9,80003834 <__printf+0x4dc>
    80003824:	1080006f          	j	8000392c <__printf+0x5d4>
    80003828:	001c8c93          	addi	s9,s9,1
    8000382c:	00000097          	auipc	ra,0x0
    80003830:	948080e7          	jalr	-1720(ra) # 80003174 <consputc>
    80003834:	000cc503          	lbu	a0,0(s9)
    80003838:	fe0518e3          	bnez	a0,80003828 <__printf+0x4d0>
    8000383c:	f5dff06f          	j	80003798 <__printf+0x440>
    80003840:	02500513          	li	a0,37
    80003844:	00000097          	auipc	ra,0x0
    80003848:	930080e7          	jalr	-1744(ra) # 80003174 <consputc>
    8000384c:	000c8513          	mv	a0,s9
    80003850:	00000097          	auipc	ra,0x0
    80003854:	924080e7          	jalr	-1756(ra) # 80003174 <consputc>
    80003858:	f41ff06f          	j	80003798 <__printf+0x440>
    8000385c:	02500513          	li	a0,37
    80003860:	00000097          	auipc	ra,0x0
    80003864:	914080e7          	jalr	-1772(ra) # 80003174 <consputc>
    80003868:	f31ff06f          	j	80003798 <__printf+0x440>
    8000386c:	00030513          	mv	a0,t1
    80003870:	00000097          	auipc	ra,0x0
    80003874:	7bc080e7          	jalr	1980(ra) # 8000402c <acquire>
    80003878:	b4dff06f          	j	800033c4 <__printf+0x6c>
    8000387c:	40c0053b          	negw	a0,a2
    80003880:	00a00713          	li	a4,10
    80003884:	02e576bb          	remuw	a3,a0,a4
    80003888:	00002d97          	auipc	s11,0x2
    8000388c:	8f8d8d93          	addi	s11,s11,-1800 # 80005180 <digits>
    80003890:	ff700593          	li	a1,-9
    80003894:	02069693          	slli	a3,a3,0x20
    80003898:	0206d693          	srli	a3,a3,0x20
    8000389c:	00dd86b3          	add	a3,s11,a3
    800038a0:	0006c683          	lbu	a3,0(a3)
    800038a4:	02e557bb          	divuw	a5,a0,a4
    800038a8:	f8d40023          	sb	a3,-128(s0)
    800038ac:	10b65e63          	bge	a2,a1,800039c8 <__printf+0x670>
    800038b0:	06300593          	li	a1,99
    800038b4:	02e7f6bb          	remuw	a3,a5,a4
    800038b8:	02069693          	slli	a3,a3,0x20
    800038bc:	0206d693          	srli	a3,a3,0x20
    800038c0:	00dd86b3          	add	a3,s11,a3
    800038c4:	0006c683          	lbu	a3,0(a3)
    800038c8:	02e7d73b          	divuw	a4,a5,a4
    800038cc:	00200793          	li	a5,2
    800038d0:	f8d400a3          	sb	a3,-127(s0)
    800038d4:	bca5ece3          	bltu	a1,a0,800034ac <__printf+0x154>
    800038d8:	ce5ff06f          	j	800035bc <__printf+0x264>
    800038dc:	40e007bb          	negw	a5,a4
    800038e0:	00002d97          	auipc	s11,0x2
    800038e4:	8a0d8d93          	addi	s11,s11,-1888 # 80005180 <digits>
    800038e8:	00f7f693          	andi	a3,a5,15
    800038ec:	00dd86b3          	add	a3,s11,a3
    800038f0:	0006c583          	lbu	a1,0(a3)
    800038f4:	ff100613          	li	a2,-15
    800038f8:	0047d69b          	srliw	a3,a5,0x4
    800038fc:	f8b40023          	sb	a1,-128(s0)
    80003900:	0047d59b          	srliw	a1,a5,0x4
    80003904:	0ac75e63          	bge	a4,a2,800039c0 <__printf+0x668>
    80003908:	00f6f693          	andi	a3,a3,15
    8000390c:	00dd86b3          	add	a3,s11,a3
    80003910:	0006c603          	lbu	a2,0(a3)
    80003914:	00f00693          	li	a3,15
    80003918:	0087d79b          	srliw	a5,a5,0x8
    8000391c:	f8c400a3          	sb	a2,-127(s0)
    80003920:	d8b6e4e3          	bltu	a3,a1,800036a8 <__printf+0x350>
    80003924:	00200793          	li	a5,2
    80003928:	e2dff06f          	j	80003754 <__printf+0x3fc>
    8000392c:	00002c97          	auipc	s9,0x2
    80003930:	834c8c93          	addi	s9,s9,-1996 # 80005160 <_ZN15MemoryAllocator11HEADER_SIZEE+0x140>
    80003934:	02800513          	li	a0,40
    80003938:	ef1ff06f          	j	80003828 <__printf+0x4d0>
    8000393c:	00700793          	li	a5,7
    80003940:	00600c93          	li	s9,6
    80003944:	e0dff06f          	j	80003750 <__printf+0x3f8>
    80003948:	00700793          	li	a5,7
    8000394c:	00600c93          	li	s9,6
    80003950:	c69ff06f          	j	800035b8 <__printf+0x260>
    80003954:	00300793          	li	a5,3
    80003958:	00200c93          	li	s9,2
    8000395c:	c5dff06f          	j	800035b8 <__printf+0x260>
    80003960:	00300793          	li	a5,3
    80003964:	00200c93          	li	s9,2
    80003968:	de9ff06f          	j	80003750 <__printf+0x3f8>
    8000396c:	00400793          	li	a5,4
    80003970:	00300c93          	li	s9,3
    80003974:	dddff06f          	j	80003750 <__printf+0x3f8>
    80003978:	00400793          	li	a5,4
    8000397c:	00300c93          	li	s9,3
    80003980:	c39ff06f          	j	800035b8 <__printf+0x260>
    80003984:	00500793          	li	a5,5
    80003988:	00400c93          	li	s9,4
    8000398c:	c2dff06f          	j	800035b8 <__printf+0x260>
    80003990:	00500793          	li	a5,5
    80003994:	00400c93          	li	s9,4
    80003998:	db9ff06f          	j	80003750 <__printf+0x3f8>
    8000399c:	00600793          	li	a5,6
    800039a0:	00500c93          	li	s9,5
    800039a4:	dadff06f          	j	80003750 <__printf+0x3f8>
    800039a8:	00600793          	li	a5,6
    800039ac:	00500c93          	li	s9,5
    800039b0:	c09ff06f          	j	800035b8 <__printf+0x260>
    800039b4:	00800793          	li	a5,8
    800039b8:	00700c93          	li	s9,7
    800039bc:	bfdff06f          	j	800035b8 <__printf+0x260>
    800039c0:	00100793          	li	a5,1
    800039c4:	d91ff06f          	j	80003754 <__printf+0x3fc>
    800039c8:	00100793          	li	a5,1
    800039cc:	bf1ff06f          	j	800035bc <__printf+0x264>
    800039d0:	00900793          	li	a5,9
    800039d4:	00800c93          	li	s9,8
    800039d8:	be1ff06f          	j	800035b8 <__printf+0x260>
    800039dc:	00001517          	auipc	a0,0x1
    800039e0:	78c50513          	addi	a0,a0,1932 # 80005168 <_ZN15MemoryAllocator11HEADER_SIZEE+0x148>
    800039e4:	00000097          	auipc	ra,0x0
    800039e8:	918080e7          	jalr	-1768(ra) # 800032fc <panic>

00000000800039ec <printfinit>:
    800039ec:	fe010113          	addi	sp,sp,-32
    800039f0:	00813823          	sd	s0,16(sp)
    800039f4:	00913423          	sd	s1,8(sp)
    800039f8:	00113c23          	sd	ra,24(sp)
    800039fc:	02010413          	addi	s0,sp,32
    80003a00:	00003497          	auipc	s1,0x3
    80003a04:	18048493          	addi	s1,s1,384 # 80006b80 <pr>
    80003a08:	00048513          	mv	a0,s1
    80003a0c:	00001597          	auipc	a1,0x1
    80003a10:	76c58593          	addi	a1,a1,1900 # 80005178 <_ZN15MemoryAllocator11HEADER_SIZEE+0x158>
    80003a14:	00000097          	auipc	ra,0x0
    80003a18:	5f4080e7          	jalr	1524(ra) # 80004008 <initlock>
    80003a1c:	01813083          	ld	ra,24(sp)
    80003a20:	01013403          	ld	s0,16(sp)
    80003a24:	0004ac23          	sw	zero,24(s1)
    80003a28:	00813483          	ld	s1,8(sp)
    80003a2c:	02010113          	addi	sp,sp,32
    80003a30:	00008067          	ret

0000000080003a34 <uartinit>:
    80003a34:	ff010113          	addi	sp,sp,-16
    80003a38:	00813423          	sd	s0,8(sp)
    80003a3c:	01010413          	addi	s0,sp,16
    80003a40:	100007b7          	lui	a5,0x10000
    80003a44:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003a48:	f8000713          	li	a4,-128
    80003a4c:	00e781a3          	sb	a4,3(a5)
    80003a50:	00300713          	li	a4,3
    80003a54:	00e78023          	sb	a4,0(a5)
    80003a58:	000780a3          	sb	zero,1(a5)
    80003a5c:	00e781a3          	sb	a4,3(a5)
    80003a60:	00700693          	li	a3,7
    80003a64:	00d78123          	sb	a3,2(a5)
    80003a68:	00e780a3          	sb	a4,1(a5)
    80003a6c:	00813403          	ld	s0,8(sp)
    80003a70:	01010113          	addi	sp,sp,16
    80003a74:	00008067          	ret

0000000080003a78 <uartputc>:
    80003a78:	00002797          	auipc	a5,0x2
    80003a7c:	e907a783          	lw	a5,-368(a5) # 80005908 <panicked>
    80003a80:	00078463          	beqz	a5,80003a88 <uartputc+0x10>
    80003a84:	0000006f          	j	80003a84 <uartputc+0xc>
    80003a88:	fd010113          	addi	sp,sp,-48
    80003a8c:	02813023          	sd	s0,32(sp)
    80003a90:	00913c23          	sd	s1,24(sp)
    80003a94:	01213823          	sd	s2,16(sp)
    80003a98:	01313423          	sd	s3,8(sp)
    80003a9c:	02113423          	sd	ra,40(sp)
    80003aa0:	03010413          	addi	s0,sp,48
    80003aa4:	00002917          	auipc	s2,0x2
    80003aa8:	e6c90913          	addi	s2,s2,-404 # 80005910 <uart_tx_r>
    80003aac:	00093783          	ld	a5,0(s2)
    80003ab0:	00002497          	auipc	s1,0x2
    80003ab4:	e6848493          	addi	s1,s1,-408 # 80005918 <uart_tx_w>
    80003ab8:	0004b703          	ld	a4,0(s1)
    80003abc:	02078693          	addi	a3,a5,32
    80003ac0:	00050993          	mv	s3,a0
    80003ac4:	02e69c63          	bne	a3,a4,80003afc <uartputc+0x84>
    80003ac8:	00001097          	auipc	ra,0x1
    80003acc:	834080e7          	jalr	-1996(ra) # 800042fc <push_on>
    80003ad0:	00093783          	ld	a5,0(s2)
    80003ad4:	0004b703          	ld	a4,0(s1)
    80003ad8:	02078793          	addi	a5,a5,32
    80003adc:	00e79463          	bne	a5,a4,80003ae4 <uartputc+0x6c>
    80003ae0:	0000006f          	j	80003ae0 <uartputc+0x68>
    80003ae4:	00001097          	auipc	ra,0x1
    80003ae8:	88c080e7          	jalr	-1908(ra) # 80004370 <pop_on>
    80003aec:	00093783          	ld	a5,0(s2)
    80003af0:	0004b703          	ld	a4,0(s1)
    80003af4:	02078693          	addi	a3,a5,32
    80003af8:	fce688e3          	beq	a3,a4,80003ac8 <uartputc+0x50>
    80003afc:	01f77693          	andi	a3,a4,31
    80003b00:	00003597          	auipc	a1,0x3
    80003b04:	0a058593          	addi	a1,a1,160 # 80006ba0 <uart_tx_buf>
    80003b08:	00d586b3          	add	a3,a1,a3
    80003b0c:	00170713          	addi	a4,a4,1
    80003b10:	01368023          	sb	s3,0(a3)
    80003b14:	00e4b023          	sd	a4,0(s1)
    80003b18:	10000637          	lui	a2,0x10000
    80003b1c:	02f71063          	bne	a4,a5,80003b3c <uartputc+0xc4>
    80003b20:	0340006f          	j	80003b54 <uartputc+0xdc>
    80003b24:	00074703          	lbu	a4,0(a4)
    80003b28:	00f93023          	sd	a5,0(s2)
    80003b2c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003b30:	00093783          	ld	a5,0(s2)
    80003b34:	0004b703          	ld	a4,0(s1)
    80003b38:	00f70e63          	beq	a4,a5,80003b54 <uartputc+0xdc>
    80003b3c:	00564683          	lbu	a3,5(a2)
    80003b40:	01f7f713          	andi	a4,a5,31
    80003b44:	00e58733          	add	a4,a1,a4
    80003b48:	0206f693          	andi	a3,a3,32
    80003b4c:	00178793          	addi	a5,a5,1
    80003b50:	fc069ae3          	bnez	a3,80003b24 <uartputc+0xac>
    80003b54:	02813083          	ld	ra,40(sp)
    80003b58:	02013403          	ld	s0,32(sp)
    80003b5c:	01813483          	ld	s1,24(sp)
    80003b60:	01013903          	ld	s2,16(sp)
    80003b64:	00813983          	ld	s3,8(sp)
    80003b68:	03010113          	addi	sp,sp,48
    80003b6c:	00008067          	ret

0000000080003b70 <uartputc_sync>:
    80003b70:	ff010113          	addi	sp,sp,-16
    80003b74:	00813423          	sd	s0,8(sp)
    80003b78:	01010413          	addi	s0,sp,16
    80003b7c:	00002717          	auipc	a4,0x2
    80003b80:	d8c72703          	lw	a4,-628(a4) # 80005908 <panicked>
    80003b84:	02071663          	bnez	a4,80003bb0 <uartputc_sync+0x40>
    80003b88:	00050793          	mv	a5,a0
    80003b8c:	100006b7          	lui	a3,0x10000
    80003b90:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003b94:	02077713          	andi	a4,a4,32
    80003b98:	fe070ce3          	beqz	a4,80003b90 <uartputc_sync+0x20>
    80003b9c:	0ff7f793          	andi	a5,a5,255
    80003ba0:	00f68023          	sb	a5,0(a3)
    80003ba4:	00813403          	ld	s0,8(sp)
    80003ba8:	01010113          	addi	sp,sp,16
    80003bac:	00008067          	ret
    80003bb0:	0000006f          	j	80003bb0 <uartputc_sync+0x40>

0000000080003bb4 <uartstart>:
    80003bb4:	ff010113          	addi	sp,sp,-16
    80003bb8:	00813423          	sd	s0,8(sp)
    80003bbc:	01010413          	addi	s0,sp,16
    80003bc0:	00002617          	auipc	a2,0x2
    80003bc4:	d5060613          	addi	a2,a2,-688 # 80005910 <uart_tx_r>
    80003bc8:	00002517          	auipc	a0,0x2
    80003bcc:	d5050513          	addi	a0,a0,-688 # 80005918 <uart_tx_w>
    80003bd0:	00063783          	ld	a5,0(a2)
    80003bd4:	00053703          	ld	a4,0(a0)
    80003bd8:	04f70263          	beq	a4,a5,80003c1c <uartstart+0x68>
    80003bdc:	100005b7          	lui	a1,0x10000
    80003be0:	00003817          	auipc	a6,0x3
    80003be4:	fc080813          	addi	a6,a6,-64 # 80006ba0 <uart_tx_buf>
    80003be8:	01c0006f          	j	80003c04 <uartstart+0x50>
    80003bec:	0006c703          	lbu	a4,0(a3)
    80003bf0:	00f63023          	sd	a5,0(a2)
    80003bf4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003bf8:	00063783          	ld	a5,0(a2)
    80003bfc:	00053703          	ld	a4,0(a0)
    80003c00:	00f70e63          	beq	a4,a5,80003c1c <uartstart+0x68>
    80003c04:	01f7f713          	andi	a4,a5,31
    80003c08:	00e806b3          	add	a3,a6,a4
    80003c0c:	0055c703          	lbu	a4,5(a1)
    80003c10:	00178793          	addi	a5,a5,1
    80003c14:	02077713          	andi	a4,a4,32
    80003c18:	fc071ae3          	bnez	a4,80003bec <uartstart+0x38>
    80003c1c:	00813403          	ld	s0,8(sp)
    80003c20:	01010113          	addi	sp,sp,16
    80003c24:	00008067          	ret

0000000080003c28 <uartgetc>:
    80003c28:	ff010113          	addi	sp,sp,-16
    80003c2c:	00813423          	sd	s0,8(sp)
    80003c30:	01010413          	addi	s0,sp,16
    80003c34:	10000737          	lui	a4,0x10000
    80003c38:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003c3c:	0017f793          	andi	a5,a5,1
    80003c40:	00078c63          	beqz	a5,80003c58 <uartgetc+0x30>
    80003c44:	00074503          	lbu	a0,0(a4)
    80003c48:	0ff57513          	andi	a0,a0,255
    80003c4c:	00813403          	ld	s0,8(sp)
    80003c50:	01010113          	addi	sp,sp,16
    80003c54:	00008067          	ret
    80003c58:	fff00513          	li	a0,-1
    80003c5c:	ff1ff06f          	j	80003c4c <uartgetc+0x24>

0000000080003c60 <uartintr>:
    80003c60:	100007b7          	lui	a5,0x10000
    80003c64:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003c68:	0017f793          	andi	a5,a5,1
    80003c6c:	0a078463          	beqz	a5,80003d14 <uartintr+0xb4>
    80003c70:	fe010113          	addi	sp,sp,-32
    80003c74:	00813823          	sd	s0,16(sp)
    80003c78:	00913423          	sd	s1,8(sp)
    80003c7c:	00113c23          	sd	ra,24(sp)
    80003c80:	02010413          	addi	s0,sp,32
    80003c84:	100004b7          	lui	s1,0x10000
    80003c88:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003c8c:	0ff57513          	andi	a0,a0,255
    80003c90:	fffff097          	auipc	ra,0xfffff
    80003c94:	534080e7          	jalr	1332(ra) # 800031c4 <consoleintr>
    80003c98:	0054c783          	lbu	a5,5(s1)
    80003c9c:	0017f793          	andi	a5,a5,1
    80003ca0:	fe0794e3          	bnez	a5,80003c88 <uartintr+0x28>
    80003ca4:	00002617          	auipc	a2,0x2
    80003ca8:	c6c60613          	addi	a2,a2,-916 # 80005910 <uart_tx_r>
    80003cac:	00002517          	auipc	a0,0x2
    80003cb0:	c6c50513          	addi	a0,a0,-916 # 80005918 <uart_tx_w>
    80003cb4:	00063783          	ld	a5,0(a2)
    80003cb8:	00053703          	ld	a4,0(a0)
    80003cbc:	04f70263          	beq	a4,a5,80003d00 <uartintr+0xa0>
    80003cc0:	100005b7          	lui	a1,0x10000
    80003cc4:	00003817          	auipc	a6,0x3
    80003cc8:	edc80813          	addi	a6,a6,-292 # 80006ba0 <uart_tx_buf>
    80003ccc:	01c0006f          	j	80003ce8 <uartintr+0x88>
    80003cd0:	0006c703          	lbu	a4,0(a3)
    80003cd4:	00f63023          	sd	a5,0(a2)
    80003cd8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003cdc:	00063783          	ld	a5,0(a2)
    80003ce0:	00053703          	ld	a4,0(a0)
    80003ce4:	00f70e63          	beq	a4,a5,80003d00 <uartintr+0xa0>
    80003ce8:	01f7f713          	andi	a4,a5,31
    80003cec:	00e806b3          	add	a3,a6,a4
    80003cf0:	0055c703          	lbu	a4,5(a1)
    80003cf4:	00178793          	addi	a5,a5,1
    80003cf8:	02077713          	andi	a4,a4,32
    80003cfc:	fc071ae3          	bnez	a4,80003cd0 <uartintr+0x70>
    80003d00:	01813083          	ld	ra,24(sp)
    80003d04:	01013403          	ld	s0,16(sp)
    80003d08:	00813483          	ld	s1,8(sp)
    80003d0c:	02010113          	addi	sp,sp,32
    80003d10:	00008067          	ret
    80003d14:	00002617          	auipc	a2,0x2
    80003d18:	bfc60613          	addi	a2,a2,-1028 # 80005910 <uart_tx_r>
    80003d1c:	00002517          	auipc	a0,0x2
    80003d20:	bfc50513          	addi	a0,a0,-1028 # 80005918 <uart_tx_w>
    80003d24:	00063783          	ld	a5,0(a2)
    80003d28:	00053703          	ld	a4,0(a0)
    80003d2c:	04f70263          	beq	a4,a5,80003d70 <uartintr+0x110>
    80003d30:	100005b7          	lui	a1,0x10000
    80003d34:	00003817          	auipc	a6,0x3
    80003d38:	e6c80813          	addi	a6,a6,-404 # 80006ba0 <uart_tx_buf>
    80003d3c:	01c0006f          	j	80003d58 <uartintr+0xf8>
    80003d40:	0006c703          	lbu	a4,0(a3)
    80003d44:	00f63023          	sd	a5,0(a2)
    80003d48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003d4c:	00063783          	ld	a5,0(a2)
    80003d50:	00053703          	ld	a4,0(a0)
    80003d54:	02f70063          	beq	a4,a5,80003d74 <uartintr+0x114>
    80003d58:	01f7f713          	andi	a4,a5,31
    80003d5c:	00e806b3          	add	a3,a6,a4
    80003d60:	0055c703          	lbu	a4,5(a1)
    80003d64:	00178793          	addi	a5,a5,1
    80003d68:	02077713          	andi	a4,a4,32
    80003d6c:	fc071ae3          	bnez	a4,80003d40 <uartintr+0xe0>
    80003d70:	00008067          	ret
    80003d74:	00008067          	ret

0000000080003d78 <kinit>:
    80003d78:	fc010113          	addi	sp,sp,-64
    80003d7c:	02913423          	sd	s1,40(sp)
    80003d80:	fffff7b7          	lui	a5,0xfffff
    80003d84:	00004497          	auipc	s1,0x4
    80003d88:	e3b48493          	addi	s1,s1,-453 # 80007bbf <end+0xfff>
    80003d8c:	02813823          	sd	s0,48(sp)
    80003d90:	01313c23          	sd	s3,24(sp)
    80003d94:	00f4f4b3          	and	s1,s1,a5
    80003d98:	02113c23          	sd	ra,56(sp)
    80003d9c:	03213023          	sd	s2,32(sp)
    80003da0:	01413823          	sd	s4,16(sp)
    80003da4:	01513423          	sd	s5,8(sp)
    80003da8:	04010413          	addi	s0,sp,64
    80003dac:	000017b7          	lui	a5,0x1
    80003db0:	01100993          	li	s3,17
    80003db4:	00f487b3          	add	a5,s1,a5
    80003db8:	01b99993          	slli	s3,s3,0x1b
    80003dbc:	06f9e063          	bltu	s3,a5,80003e1c <kinit+0xa4>
    80003dc0:	00003a97          	auipc	s5,0x3
    80003dc4:	e00a8a93          	addi	s5,s5,-512 # 80006bc0 <end>
    80003dc8:	0754ec63          	bltu	s1,s5,80003e40 <kinit+0xc8>
    80003dcc:	0734fa63          	bgeu	s1,s3,80003e40 <kinit+0xc8>
    80003dd0:	00088a37          	lui	s4,0x88
    80003dd4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003dd8:	00002917          	auipc	s2,0x2
    80003ddc:	b4890913          	addi	s2,s2,-1208 # 80005920 <kmem>
    80003de0:	00ca1a13          	slli	s4,s4,0xc
    80003de4:	0140006f          	j	80003df8 <kinit+0x80>
    80003de8:	000017b7          	lui	a5,0x1
    80003dec:	00f484b3          	add	s1,s1,a5
    80003df0:	0554e863          	bltu	s1,s5,80003e40 <kinit+0xc8>
    80003df4:	0534f663          	bgeu	s1,s3,80003e40 <kinit+0xc8>
    80003df8:	00001637          	lui	a2,0x1
    80003dfc:	00100593          	li	a1,1
    80003e00:	00048513          	mv	a0,s1
    80003e04:	00000097          	auipc	ra,0x0
    80003e08:	5e4080e7          	jalr	1508(ra) # 800043e8 <__memset>
    80003e0c:	00093783          	ld	a5,0(s2)
    80003e10:	00f4b023          	sd	a5,0(s1)
    80003e14:	00993023          	sd	s1,0(s2)
    80003e18:	fd4498e3          	bne	s1,s4,80003de8 <kinit+0x70>
    80003e1c:	03813083          	ld	ra,56(sp)
    80003e20:	03013403          	ld	s0,48(sp)
    80003e24:	02813483          	ld	s1,40(sp)
    80003e28:	02013903          	ld	s2,32(sp)
    80003e2c:	01813983          	ld	s3,24(sp)
    80003e30:	01013a03          	ld	s4,16(sp)
    80003e34:	00813a83          	ld	s5,8(sp)
    80003e38:	04010113          	addi	sp,sp,64
    80003e3c:	00008067          	ret
    80003e40:	00001517          	auipc	a0,0x1
    80003e44:	35850513          	addi	a0,a0,856 # 80005198 <digits+0x18>
    80003e48:	fffff097          	auipc	ra,0xfffff
    80003e4c:	4b4080e7          	jalr	1204(ra) # 800032fc <panic>

0000000080003e50 <freerange>:
    80003e50:	fc010113          	addi	sp,sp,-64
    80003e54:	000017b7          	lui	a5,0x1
    80003e58:	02913423          	sd	s1,40(sp)
    80003e5c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003e60:	009504b3          	add	s1,a0,s1
    80003e64:	fffff537          	lui	a0,0xfffff
    80003e68:	02813823          	sd	s0,48(sp)
    80003e6c:	02113c23          	sd	ra,56(sp)
    80003e70:	03213023          	sd	s2,32(sp)
    80003e74:	01313c23          	sd	s3,24(sp)
    80003e78:	01413823          	sd	s4,16(sp)
    80003e7c:	01513423          	sd	s5,8(sp)
    80003e80:	01613023          	sd	s6,0(sp)
    80003e84:	04010413          	addi	s0,sp,64
    80003e88:	00a4f4b3          	and	s1,s1,a0
    80003e8c:	00f487b3          	add	a5,s1,a5
    80003e90:	06f5e463          	bltu	a1,a5,80003ef8 <freerange+0xa8>
    80003e94:	00003a97          	auipc	s5,0x3
    80003e98:	d2ca8a93          	addi	s5,s5,-724 # 80006bc0 <end>
    80003e9c:	0954e263          	bltu	s1,s5,80003f20 <freerange+0xd0>
    80003ea0:	01100993          	li	s3,17
    80003ea4:	01b99993          	slli	s3,s3,0x1b
    80003ea8:	0734fc63          	bgeu	s1,s3,80003f20 <freerange+0xd0>
    80003eac:	00058a13          	mv	s4,a1
    80003eb0:	00002917          	auipc	s2,0x2
    80003eb4:	a7090913          	addi	s2,s2,-1424 # 80005920 <kmem>
    80003eb8:	00002b37          	lui	s6,0x2
    80003ebc:	0140006f          	j	80003ed0 <freerange+0x80>
    80003ec0:	000017b7          	lui	a5,0x1
    80003ec4:	00f484b3          	add	s1,s1,a5
    80003ec8:	0554ec63          	bltu	s1,s5,80003f20 <freerange+0xd0>
    80003ecc:	0534fa63          	bgeu	s1,s3,80003f20 <freerange+0xd0>
    80003ed0:	00001637          	lui	a2,0x1
    80003ed4:	00100593          	li	a1,1
    80003ed8:	00048513          	mv	a0,s1
    80003edc:	00000097          	auipc	ra,0x0
    80003ee0:	50c080e7          	jalr	1292(ra) # 800043e8 <__memset>
    80003ee4:	00093703          	ld	a4,0(s2)
    80003ee8:	016487b3          	add	a5,s1,s6
    80003eec:	00e4b023          	sd	a4,0(s1)
    80003ef0:	00993023          	sd	s1,0(s2)
    80003ef4:	fcfa76e3          	bgeu	s4,a5,80003ec0 <freerange+0x70>
    80003ef8:	03813083          	ld	ra,56(sp)
    80003efc:	03013403          	ld	s0,48(sp)
    80003f00:	02813483          	ld	s1,40(sp)
    80003f04:	02013903          	ld	s2,32(sp)
    80003f08:	01813983          	ld	s3,24(sp)
    80003f0c:	01013a03          	ld	s4,16(sp)
    80003f10:	00813a83          	ld	s5,8(sp)
    80003f14:	00013b03          	ld	s6,0(sp)
    80003f18:	04010113          	addi	sp,sp,64
    80003f1c:	00008067          	ret
    80003f20:	00001517          	auipc	a0,0x1
    80003f24:	27850513          	addi	a0,a0,632 # 80005198 <digits+0x18>
    80003f28:	fffff097          	auipc	ra,0xfffff
    80003f2c:	3d4080e7          	jalr	980(ra) # 800032fc <panic>

0000000080003f30 <kfree>:
    80003f30:	fe010113          	addi	sp,sp,-32
    80003f34:	00813823          	sd	s0,16(sp)
    80003f38:	00113c23          	sd	ra,24(sp)
    80003f3c:	00913423          	sd	s1,8(sp)
    80003f40:	02010413          	addi	s0,sp,32
    80003f44:	03451793          	slli	a5,a0,0x34
    80003f48:	04079c63          	bnez	a5,80003fa0 <kfree+0x70>
    80003f4c:	00003797          	auipc	a5,0x3
    80003f50:	c7478793          	addi	a5,a5,-908 # 80006bc0 <end>
    80003f54:	00050493          	mv	s1,a0
    80003f58:	04f56463          	bltu	a0,a5,80003fa0 <kfree+0x70>
    80003f5c:	01100793          	li	a5,17
    80003f60:	01b79793          	slli	a5,a5,0x1b
    80003f64:	02f57e63          	bgeu	a0,a5,80003fa0 <kfree+0x70>
    80003f68:	00001637          	lui	a2,0x1
    80003f6c:	00100593          	li	a1,1
    80003f70:	00000097          	auipc	ra,0x0
    80003f74:	478080e7          	jalr	1144(ra) # 800043e8 <__memset>
    80003f78:	00002797          	auipc	a5,0x2
    80003f7c:	9a878793          	addi	a5,a5,-1624 # 80005920 <kmem>
    80003f80:	0007b703          	ld	a4,0(a5)
    80003f84:	01813083          	ld	ra,24(sp)
    80003f88:	01013403          	ld	s0,16(sp)
    80003f8c:	00e4b023          	sd	a4,0(s1)
    80003f90:	0097b023          	sd	s1,0(a5)
    80003f94:	00813483          	ld	s1,8(sp)
    80003f98:	02010113          	addi	sp,sp,32
    80003f9c:	00008067          	ret
    80003fa0:	00001517          	auipc	a0,0x1
    80003fa4:	1f850513          	addi	a0,a0,504 # 80005198 <digits+0x18>
    80003fa8:	fffff097          	auipc	ra,0xfffff
    80003fac:	354080e7          	jalr	852(ra) # 800032fc <panic>

0000000080003fb0 <kalloc>:
    80003fb0:	fe010113          	addi	sp,sp,-32
    80003fb4:	00813823          	sd	s0,16(sp)
    80003fb8:	00913423          	sd	s1,8(sp)
    80003fbc:	00113c23          	sd	ra,24(sp)
    80003fc0:	02010413          	addi	s0,sp,32
    80003fc4:	00002797          	auipc	a5,0x2
    80003fc8:	95c78793          	addi	a5,a5,-1700 # 80005920 <kmem>
    80003fcc:	0007b483          	ld	s1,0(a5)
    80003fd0:	02048063          	beqz	s1,80003ff0 <kalloc+0x40>
    80003fd4:	0004b703          	ld	a4,0(s1)
    80003fd8:	00001637          	lui	a2,0x1
    80003fdc:	00500593          	li	a1,5
    80003fe0:	00048513          	mv	a0,s1
    80003fe4:	00e7b023          	sd	a4,0(a5)
    80003fe8:	00000097          	auipc	ra,0x0
    80003fec:	400080e7          	jalr	1024(ra) # 800043e8 <__memset>
    80003ff0:	01813083          	ld	ra,24(sp)
    80003ff4:	01013403          	ld	s0,16(sp)
    80003ff8:	00048513          	mv	a0,s1
    80003ffc:	00813483          	ld	s1,8(sp)
    80004000:	02010113          	addi	sp,sp,32
    80004004:	00008067          	ret

0000000080004008 <initlock>:
    80004008:	ff010113          	addi	sp,sp,-16
    8000400c:	00813423          	sd	s0,8(sp)
    80004010:	01010413          	addi	s0,sp,16
    80004014:	00813403          	ld	s0,8(sp)
    80004018:	00b53423          	sd	a1,8(a0)
    8000401c:	00052023          	sw	zero,0(a0)
    80004020:	00053823          	sd	zero,16(a0)
    80004024:	01010113          	addi	sp,sp,16
    80004028:	00008067          	ret

000000008000402c <acquire>:
    8000402c:	fe010113          	addi	sp,sp,-32
    80004030:	00813823          	sd	s0,16(sp)
    80004034:	00913423          	sd	s1,8(sp)
    80004038:	00113c23          	sd	ra,24(sp)
    8000403c:	01213023          	sd	s2,0(sp)
    80004040:	02010413          	addi	s0,sp,32
    80004044:	00050493          	mv	s1,a0
    80004048:	10002973          	csrr	s2,sstatus
    8000404c:	100027f3          	csrr	a5,sstatus
    80004050:	ffd7f793          	andi	a5,a5,-3
    80004054:	10079073          	csrw	sstatus,a5
    80004058:	fffff097          	auipc	ra,0xfffff
    8000405c:	8e8080e7          	jalr	-1816(ra) # 80002940 <mycpu>
    80004060:	07852783          	lw	a5,120(a0)
    80004064:	06078e63          	beqz	a5,800040e0 <acquire+0xb4>
    80004068:	fffff097          	auipc	ra,0xfffff
    8000406c:	8d8080e7          	jalr	-1832(ra) # 80002940 <mycpu>
    80004070:	07852783          	lw	a5,120(a0)
    80004074:	0004a703          	lw	a4,0(s1)
    80004078:	0017879b          	addiw	a5,a5,1
    8000407c:	06f52c23          	sw	a5,120(a0)
    80004080:	04071063          	bnez	a4,800040c0 <acquire+0x94>
    80004084:	00100713          	li	a4,1
    80004088:	00070793          	mv	a5,a4
    8000408c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004090:	0007879b          	sext.w	a5,a5
    80004094:	fe079ae3          	bnez	a5,80004088 <acquire+0x5c>
    80004098:	0ff0000f          	fence
    8000409c:	fffff097          	auipc	ra,0xfffff
    800040a0:	8a4080e7          	jalr	-1884(ra) # 80002940 <mycpu>
    800040a4:	01813083          	ld	ra,24(sp)
    800040a8:	01013403          	ld	s0,16(sp)
    800040ac:	00a4b823          	sd	a0,16(s1)
    800040b0:	00013903          	ld	s2,0(sp)
    800040b4:	00813483          	ld	s1,8(sp)
    800040b8:	02010113          	addi	sp,sp,32
    800040bc:	00008067          	ret
    800040c0:	0104b903          	ld	s2,16(s1)
    800040c4:	fffff097          	auipc	ra,0xfffff
    800040c8:	87c080e7          	jalr	-1924(ra) # 80002940 <mycpu>
    800040cc:	faa91ce3          	bne	s2,a0,80004084 <acquire+0x58>
    800040d0:	00001517          	auipc	a0,0x1
    800040d4:	0d050513          	addi	a0,a0,208 # 800051a0 <digits+0x20>
    800040d8:	fffff097          	auipc	ra,0xfffff
    800040dc:	224080e7          	jalr	548(ra) # 800032fc <panic>
    800040e0:	00195913          	srli	s2,s2,0x1
    800040e4:	fffff097          	auipc	ra,0xfffff
    800040e8:	85c080e7          	jalr	-1956(ra) # 80002940 <mycpu>
    800040ec:	00197913          	andi	s2,s2,1
    800040f0:	07252e23          	sw	s2,124(a0)
    800040f4:	f75ff06f          	j	80004068 <acquire+0x3c>

00000000800040f8 <release>:
    800040f8:	fe010113          	addi	sp,sp,-32
    800040fc:	00813823          	sd	s0,16(sp)
    80004100:	00113c23          	sd	ra,24(sp)
    80004104:	00913423          	sd	s1,8(sp)
    80004108:	01213023          	sd	s2,0(sp)
    8000410c:	02010413          	addi	s0,sp,32
    80004110:	00052783          	lw	a5,0(a0)
    80004114:	00079a63          	bnez	a5,80004128 <release+0x30>
    80004118:	00001517          	auipc	a0,0x1
    8000411c:	09050513          	addi	a0,a0,144 # 800051a8 <digits+0x28>
    80004120:	fffff097          	auipc	ra,0xfffff
    80004124:	1dc080e7          	jalr	476(ra) # 800032fc <panic>
    80004128:	01053903          	ld	s2,16(a0)
    8000412c:	00050493          	mv	s1,a0
    80004130:	fffff097          	auipc	ra,0xfffff
    80004134:	810080e7          	jalr	-2032(ra) # 80002940 <mycpu>
    80004138:	fea910e3          	bne	s2,a0,80004118 <release+0x20>
    8000413c:	0004b823          	sd	zero,16(s1)
    80004140:	0ff0000f          	fence
    80004144:	0f50000f          	fence	iorw,ow
    80004148:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000414c:	ffffe097          	auipc	ra,0xffffe
    80004150:	7f4080e7          	jalr	2036(ra) # 80002940 <mycpu>
    80004154:	100027f3          	csrr	a5,sstatus
    80004158:	0027f793          	andi	a5,a5,2
    8000415c:	04079a63          	bnez	a5,800041b0 <release+0xb8>
    80004160:	07852783          	lw	a5,120(a0)
    80004164:	02f05e63          	blez	a5,800041a0 <release+0xa8>
    80004168:	fff7871b          	addiw	a4,a5,-1
    8000416c:	06e52c23          	sw	a4,120(a0)
    80004170:	00071c63          	bnez	a4,80004188 <release+0x90>
    80004174:	07c52783          	lw	a5,124(a0)
    80004178:	00078863          	beqz	a5,80004188 <release+0x90>
    8000417c:	100027f3          	csrr	a5,sstatus
    80004180:	0027e793          	ori	a5,a5,2
    80004184:	10079073          	csrw	sstatus,a5
    80004188:	01813083          	ld	ra,24(sp)
    8000418c:	01013403          	ld	s0,16(sp)
    80004190:	00813483          	ld	s1,8(sp)
    80004194:	00013903          	ld	s2,0(sp)
    80004198:	02010113          	addi	sp,sp,32
    8000419c:	00008067          	ret
    800041a0:	00001517          	auipc	a0,0x1
    800041a4:	02850513          	addi	a0,a0,40 # 800051c8 <digits+0x48>
    800041a8:	fffff097          	auipc	ra,0xfffff
    800041ac:	154080e7          	jalr	340(ra) # 800032fc <panic>
    800041b0:	00001517          	auipc	a0,0x1
    800041b4:	00050513          	mv	a0,a0
    800041b8:	fffff097          	auipc	ra,0xfffff
    800041bc:	144080e7          	jalr	324(ra) # 800032fc <panic>

00000000800041c0 <holding>:
    800041c0:	00052783          	lw	a5,0(a0) # 800051b0 <digits+0x30>
    800041c4:	00079663          	bnez	a5,800041d0 <holding+0x10>
    800041c8:	00000513          	li	a0,0
    800041cc:	00008067          	ret
    800041d0:	fe010113          	addi	sp,sp,-32
    800041d4:	00813823          	sd	s0,16(sp)
    800041d8:	00913423          	sd	s1,8(sp)
    800041dc:	00113c23          	sd	ra,24(sp)
    800041e0:	02010413          	addi	s0,sp,32
    800041e4:	01053483          	ld	s1,16(a0)
    800041e8:	ffffe097          	auipc	ra,0xffffe
    800041ec:	758080e7          	jalr	1880(ra) # 80002940 <mycpu>
    800041f0:	01813083          	ld	ra,24(sp)
    800041f4:	01013403          	ld	s0,16(sp)
    800041f8:	40a48533          	sub	a0,s1,a0
    800041fc:	00153513          	seqz	a0,a0
    80004200:	00813483          	ld	s1,8(sp)
    80004204:	02010113          	addi	sp,sp,32
    80004208:	00008067          	ret

000000008000420c <push_off>:
    8000420c:	fe010113          	addi	sp,sp,-32
    80004210:	00813823          	sd	s0,16(sp)
    80004214:	00113c23          	sd	ra,24(sp)
    80004218:	00913423          	sd	s1,8(sp)
    8000421c:	02010413          	addi	s0,sp,32
    80004220:	100024f3          	csrr	s1,sstatus
    80004224:	100027f3          	csrr	a5,sstatus
    80004228:	ffd7f793          	andi	a5,a5,-3
    8000422c:	10079073          	csrw	sstatus,a5
    80004230:	ffffe097          	auipc	ra,0xffffe
    80004234:	710080e7          	jalr	1808(ra) # 80002940 <mycpu>
    80004238:	07852783          	lw	a5,120(a0)
    8000423c:	02078663          	beqz	a5,80004268 <push_off+0x5c>
    80004240:	ffffe097          	auipc	ra,0xffffe
    80004244:	700080e7          	jalr	1792(ra) # 80002940 <mycpu>
    80004248:	07852783          	lw	a5,120(a0)
    8000424c:	01813083          	ld	ra,24(sp)
    80004250:	01013403          	ld	s0,16(sp)
    80004254:	0017879b          	addiw	a5,a5,1
    80004258:	06f52c23          	sw	a5,120(a0)
    8000425c:	00813483          	ld	s1,8(sp)
    80004260:	02010113          	addi	sp,sp,32
    80004264:	00008067          	ret
    80004268:	0014d493          	srli	s1,s1,0x1
    8000426c:	ffffe097          	auipc	ra,0xffffe
    80004270:	6d4080e7          	jalr	1748(ra) # 80002940 <mycpu>
    80004274:	0014f493          	andi	s1,s1,1
    80004278:	06952e23          	sw	s1,124(a0)
    8000427c:	fc5ff06f          	j	80004240 <push_off+0x34>

0000000080004280 <pop_off>:
    80004280:	ff010113          	addi	sp,sp,-16
    80004284:	00813023          	sd	s0,0(sp)
    80004288:	00113423          	sd	ra,8(sp)
    8000428c:	01010413          	addi	s0,sp,16
    80004290:	ffffe097          	auipc	ra,0xffffe
    80004294:	6b0080e7          	jalr	1712(ra) # 80002940 <mycpu>
    80004298:	100027f3          	csrr	a5,sstatus
    8000429c:	0027f793          	andi	a5,a5,2
    800042a0:	04079663          	bnez	a5,800042ec <pop_off+0x6c>
    800042a4:	07852783          	lw	a5,120(a0)
    800042a8:	02f05a63          	blez	a5,800042dc <pop_off+0x5c>
    800042ac:	fff7871b          	addiw	a4,a5,-1
    800042b0:	06e52c23          	sw	a4,120(a0)
    800042b4:	00071c63          	bnez	a4,800042cc <pop_off+0x4c>
    800042b8:	07c52783          	lw	a5,124(a0)
    800042bc:	00078863          	beqz	a5,800042cc <pop_off+0x4c>
    800042c0:	100027f3          	csrr	a5,sstatus
    800042c4:	0027e793          	ori	a5,a5,2
    800042c8:	10079073          	csrw	sstatus,a5
    800042cc:	00813083          	ld	ra,8(sp)
    800042d0:	00013403          	ld	s0,0(sp)
    800042d4:	01010113          	addi	sp,sp,16
    800042d8:	00008067          	ret
    800042dc:	00001517          	auipc	a0,0x1
    800042e0:	eec50513          	addi	a0,a0,-276 # 800051c8 <digits+0x48>
    800042e4:	fffff097          	auipc	ra,0xfffff
    800042e8:	018080e7          	jalr	24(ra) # 800032fc <panic>
    800042ec:	00001517          	auipc	a0,0x1
    800042f0:	ec450513          	addi	a0,a0,-316 # 800051b0 <digits+0x30>
    800042f4:	fffff097          	auipc	ra,0xfffff
    800042f8:	008080e7          	jalr	8(ra) # 800032fc <panic>

00000000800042fc <push_on>:
    800042fc:	fe010113          	addi	sp,sp,-32
    80004300:	00813823          	sd	s0,16(sp)
    80004304:	00113c23          	sd	ra,24(sp)
    80004308:	00913423          	sd	s1,8(sp)
    8000430c:	02010413          	addi	s0,sp,32
    80004310:	100024f3          	csrr	s1,sstatus
    80004314:	100027f3          	csrr	a5,sstatus
    80004318:	0027e793          	ori	a5,a5,2
    8000431c:	10079073          	csrw	sstatus,a5
    80004320:	ffffe097          	auipc	ra,0xffffe
    80004324:	620080e7          	jalr	1568(ra) # 80002940 <mycpu>
    80004328:	07852783          	lw	a5,120(a0)
    8000432c:	02078663          	beqz	a5,80004358 <push_on+0x5c>
    80004330:	ffffe097          	auipc	ra,0xffffe
    80004334:	610080e7          	jalr	1552(ra) # 80002940 <mycpu>
    80004338:	07852783          	lw	a5,120(a0)
    8000433c:	01813083          	ld	ra,24(sp)
    80004340:	01013403          	ld	s0,16(sp)
    80004344:	0017879b          	addiw	a5,a5,1
    80004348:	06f52c23          	sw	a5,120(a0)
    8000434c:	00813483          	ld	s1,8(sp)
    80004350:	02010113          	addi	sp,sp,32
    80004354:	00008067          	ret
    80004358:	0014d493          	srli	s1,s1,0x1
    8000435c:	ffffe097          	auipc	ra,0xffffe
    80004360:	5e4080e7          	jalr	1508(ra) # 80002940 <mycpu>
    80004364:	0014f493          	andi	s1,s1,1
    80004368:	06952e23          	sw	s1,124(a0)
    8000436c:	fc5ff06f          	j	80004330 <push_on+0x34>

0000000080004370 <pop_on>:
    80004370:	ff010113          	addi	sp,sp,-16
    80004374:	00813023          	sd	s0,0(sp)
    80004378:	00113423          	sd	ra,8(sp)
    8000437c:	01010413          	addi	s0,sp,16
    80004380:	ffffe097          	auipc	ra,0xffffe
    80004384:	5c0080e7          	jalr	1472(ra) # 80002940 <mycpu>
    80004388:	100027f3          	csrr	a5,sstatus
    8000438c:	0027f793          	andi	a5,a5,2
    80004390:	04078463          	beqz	a5,800043d8 <pop_on+0x68>
    80004394:	07852783          	lw	a5,120(a0)
    80004398:	02f05863          	blez	a5,800043c8 <pop_on+0x58>
    8000439c:	fff7879b          	addiw	a5,a5,-1
    800043a0:	06f52c23          	sw	a5,120(a0)
    800043a4:	07853783          	ld	a5,120(a0)
    800043a8:	00079863          	bnez	a5,800043b8 <pop_on+0x48>
    800043ac:	100027f3          	csrr	a5,sstatus
    800043b0:	ffd7f793          	andi	a5,a5,-3
    800043b4:	10079073          	csrw	sstatus,a5
    800043b8:	00813083          	ld	ra,8(sp)
    800043bc:	00013403          	ld	s0,0(sp)
    800043c0:	01010113          	addi	sp,sp,16
    800043c4:	00008067          	ret
    800043c8:	00001517          	auipc	a0,0x1
    800043cc:	e2850513          	addi	a0,a0,-472 # 800051f0 <digits+0x70>
    800043d0:	fffff097          	auipc	ra,0xfffff
    800043d4:	f2c080e7          	jalr	-212(ra) # 800032fc <panic>
    800043d8:	00001517          	auipc	a0,0x1
    800043dc:	df850513          	addi	a0,a0,-520 # 800051d0 <digits+0x50>
    800043e0:	fffff097          	auipc	ra,0xfffff
    800043e4:	f1c080e7          	jalr	-228(ra) # 800032fc <panic>

00000000800043e8 <__memset>:
    800043e8:	ff010113          	addi	sp,sp,-16
    800043ec:	00813423          	sd	s0,8(sp)
    800043f0:	01010413          	addi	s0,sp,16
    800043f4:	1a060e63          	beqz	a2,800045b0 <__memset+0x1c8>
    800043f8:	40a007b3          	neg	a5,a0
    800043fc:	0077f793          	andi	a5,a5,7
    80004400:	00778693          	addi	a3,a5,7
    80004404:	00b00813          	li	a6,11
    80004408:	0ff5f593          	andi	a1,a1,255
    8000440c:	fff6071b          	addiw	a4,a2,-1
    80004410:	1b06e663          	bltu	a3,a6,800045bc <__memset+0x1d4>
    80004414:	1cd76463          	bltu	a4,a3,800045dc <__memset+0x1f4>
    80004418:	1a078e63          	beqz	a5,800045d4 <__memset+0x1ec>
    8000441c:	00b50023          	sb	a1,0(a0)
    80004420:	00100713          	li	a4,1
    80004424:	1ae78463          	beq	a5,a4,800045cc <__memset+0x1e4>
    80004428:	00b500a3          	sb	a1,1(a0)
    8000442c:	00200713          	li	a4,2
    80004430:	1ae78a63          	beq	a5,a4,800045e4 <__memset+0x1fc>
    80004434:	00b50123          	sb	a1,2(a0)
    80004438:	00300713          	li	a4,3
    8000443c:	18e78463          	beq	a5,a4,800045c4 <__memset+0x1dc>
    80004440:	00b501a3          	sb	a1,3(a0)
    80004444:	00400713          	li	a4,4
    80004448:	1ae78263          	beq	a5,a4,800045ec <__memset+0x204>
    8000444c:	00b50223          	sb	a1,4(a0)
    80004450:	00500713          	li	a4,5
    80004454:	1ae78063          	beq	a5,a4,800045f4 <__memset+0x20c>
    80004458:	00b502a3          	sb	a1,5(a0)
    8000445c:	00700713          	li	a4,7
    80004460:	18e79e63          	bne	a5,a4,800045fc <__memset+0x214>
    80004464:	00b50323          	sb	a1,6(a0)
    80004468:	00700e93          	li	t4,7
    8000446c:	00859713          	slli	a4,a1,0x8
    80004470:	00e5e733          	or	a4,a1,a4
    80004474:	01059e13          	slli	t3,a1,0x10
    80004478:	01c76e33          	or	t3,a4,t3
    8000447c:	01859313          	slli	t1,a1,0x18
    80004480:	006e6333          	or	t1,t3,t1
    80004484:	02059893          	slli	a7,a1,0x20
    80004488:	40f60e3b          	subw	t3,a2,a5
    8000448c:	011368b3          	or	a7,t1,a7
    80004490:	02859813          	slli	a6,a1,0x28
    80004494:	0108e833          	or	a6,a7,a6
    80004498:	03059693          	slli	a3,a1,0x30
    8000449c:	003e589b          	srliw	a7,t3,0x3
    800044a0:	00d866b3          	or	a3,a6,a3
    800044a4:	03859713          	slli	a4,a1,0x38
    800044a8:	00389813          	slli	a6,a7,0x3
    800044ac:	00f507b3          	add	a5,a0,a5
    800044b0:	00e6e733          	or	a4,a3,a4
    800044b4:	000e089b          	sext.w	a7,t3
    800044b8:	00f806b3          	add	a3,a6,a5
    800044bc:	00e7b023          	sd	a4,0(a5)
    800044c0:	00878793          	addi	a5,a5,8
    800044c4:	fed79ce3          	bne	a5,a3,800044bc <__memset+0xd4>
    800044c8:	ff8e7793          	andi	a5,t3,-8
    800044cc:	0007871b          	sext.w	a4,a5
    800044d0:	01d787bb          	addw	a5,a5,t4
    800044d4:	0ce88e63          	beq	a7,a4,800045b0 <__memset+0x1c8>
    800044d8:	00f50733          	add	a4,a0,a5
    800044dc:	00b70023          	sb	a1,0(a4)
    800044e0:	0017871b          	addiw	a4,a5,1
    800044e4:	0cc77663          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    800044e8:	00e50733          	add	a4,a0,a4
    800044ec:	00b70023          	sb	a1,0(a4)
    800044f0:	0027871b          	addiw	a4,a5,2
    800044f4:	0ac77e63          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    800044f8:	00e50733          	add	a4,a0,a4
    800044fc:	00b70023          	sb	a1,0(a4)
    80004500:	0037871b          	addiw	a4,a5,3
    80004504:	0ac77663          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004508:	00e50733          	add	a4,a0,a4
    8000450c:	00b70023          	sb	a1,0(a4)
    80004510:	0047871b          	addiw	a4,a5,4
    80004514:	08c77e63          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004518:	00e50733          	add	a4,a0,a4
    8000451c:	00b70023          	sb	a1,0(a4)
    80004520:	0057871b          	addiw	a4,a5,5
    80004524:	08c77663          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004528:	00e50733          	add	a4,a0,a4
    8000452c:	00b70023          	sb	a1,0(a4)
    80004530:	0067871b          	addiw	a4,a5,6
    80004534:	06c77e63          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004538:	00e50733          	add	a4,a0,a4
    8000453c:	00b70023          	sb	a1,0(a4)
    80004540:	0077871b          	addiw	a4,a5,7
    80004544:	06c77663          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004548:	00e50733          	add	a4,a0,a4
    8000454c:	00b70023          	sb	a1,0(a4)
    80004550:	0087871b          	addiw	a4,a5,8
    80004554:	04c77e63          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004558:	00e50733          	add	a4,a0,a4
    8000455c:	00b70023          	sb	a1,0(a4)
    80004560:	0097871b          	addiw	a4,a5,9
    80004564:	04c77663          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004568:	00e50733          	add	a4,a0,a4
    8000456c:	00b70023          	sb	a1,0(a4)
    80004570:	00a7871b          	addiw	a4,a5,10
    80004574:	02c77e63          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004578:	00e50733          	add	a4,a0,a4
    8000457c:	00b70023          	sb	a1,0(a4)
    80004580:	00b7871b          	addiw	a4,a5,11
    80004584:	02c77663          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004588:	00e50733          	add	a4,a0,a4
    8000458c:	00b70023          	sb	a1,0(a4)
    80004590:	00c7871b          	addiw	a4,a5,12
    80004594:	00c77e63          	bgeu	a4,a2,800045b0 <__memset+0x1c8>
    80004598:	00e50733          	add	a4,a0,a4
    8000459c:	00b70023          	sb	a1,0(a4)
    800045a0:	00d7879b          	addiw	a5,a5,13
    800045a4:	00c7f663          	bgeu	a5,a2,800045b0 <__memset+0x1c8>
    800045a8:	00f507b3          	add	a5,a0,a5
    800045ac:	00b78023          	sb	a1,0(a5)
    800045b0:	00813403          	ld	s0,8(sp)
    800045b4:	01010113          	addi	sp,sp,16
    800045b8:	00008067          	ret
    800045bc:	00b00693          	li	a3,11
    800045c0:	e55ff06f          	j	80004414 <__memset+0x2c>
    800045c4:	00300e93          	li	t4,3
    800045c8:	ea5ff06f          	j	8000446c <__memset+0x84>
    800045cc:	00100e93          	li	t4,1
    800045d0:	e9dff06f          	j	8000446c <__memset+0x84>
    800045d4:	00000e93          	li	t4,0
    800045d8:	e95ff06f          	j	8000446c <__memset+0x84>
    800045dc:	00000793          	li	a5,0
    800045e0:	ef9ff06f          	j	800044d8 <__memset+0xf0>
    800045e4:	00200e93          	li	t4,2
    800045e8:	e85ff06f          	j	8000446c <__memset+0x84>
    800045ec:	00400e93          	li	t4,4
    800045f0:	e7dff06f          	j	8000446c <__memset+0x84>
    800045f4:	00500e93          	li	t4,5
    800045f8:	e75ff06f          	j	8000446c <__memset+0x84>
    800045fc:	00600e93          	li	t4,6
    80004600:	e6dff06f          	j	8000446c <__memset+0x84>

0000000080004604 <__memmove>:
    80004604:	ff010113          	addi	sp,sp,-16
    80004608:	00813423          	sd	s0,8(sp)
    8000460c:	01010413          	addi	s0,sp,16
    80004610:	0e060863          	beqz	a2,80004700 <__memmove+0xfc>
    80004614:	fff6069b          	addiw	a3,a2,-1
    80004618:	0006881b          	sext.w	a6,a3
    8000461c:	0ea5e863          	bltu	a1,a0,8000470c <__memmove+0x108>
    80004620:	00758713          	addi	a4,a1,7
    80004624:	00a5e7b3          	or	a5,a1,a0
    80004628:	40a70733          	sub	a4,a4,a0
    8000462c:	0077f793          	andi	a5,a5,7
    80004630:	00f73713          	sltiu	a4,a4,15
    80004634:	00174713          	xori	a4,a4,1
    80004638:	0017b793          	seqz	a5,a5
    8000463c:	00e7f7b3          	and	a5,a5,a4
    80004640:	10078863          	beqz	a5,80004750 <__memmove+0x14c>
    80004644:	00900793          	li	a5,9
    80004648:	1107f463          	bgeu	a5,a6,80004750 <__memmove+0x14c>
    8000464c:	0036581b          	srliw	a6,a2,0x3
    80004650:	fff8081b          	addiw	a6,a6,-1
    80004654:	02081813          	slli	a6,a6,0x20
    80004658:	01d85893          	srli	a7,a6,0x1d
    8000465c:	00858813          	addi	a6,a1,8
    80004660:	00058793          	mv	a5,a1
    80004664:	00050713          	mv	a4,a0
    80004668:	01088833          	add	a6,a7,a6
    8000466c:	0007b883          	ld	a7,0(a5)
    80004670:	00878793          	addi	a5,a5,8
    80004674:	00870713          	addi	a4,a4,8
    80004678:	ff173c23          	sd	a7,-8(a4)
    8000467c:	ff0798e3          	bne	a5,a6,8000466c <__memmove+0x68>
    80004680:	ff867713          	andi	a4,a2,-8
    80004684:	02071793          	slli	a5,a4,0x20
    80004688:	0207d793          	srli	a5,a5,0x20
    8000468c:	00f585b3          	add	a1,a1,a5
    80004690:	40e686bb          	subw	a3,a3,a4
    80004694:	00f507b3          	add	a5,a0,a5
    80004698:	06e60463          	beq	a2,a4,80004700 <__memmove+0xfc>
    8000469c:	0005c703          	lbu	a4,0(a1)
    800046a0:	00e78023          	sb	a4,0(a5)
    800046a4:	04068e63          	beqz	a3,80004700 <__memmove+0xfc>
    800046a8:	0015c603          	lbu	a2,1(a1)
    800046ac:	00100713          	li	a4,1
    800046b0:	00c780a3          	sb	a2,1(a5)
    800046b4:	04e68663          	beq	a3,a4,80004700 <__memmove+0xfc>
    800046b8:	0025c603          	lbu	a2,2(a1)
    800046bc:	00200713          	li	a4,2
    800046c0:	00c78123          	sb	a2,2(a5)
    800046c4:	02e68e63          	beq	a3,a4,80004700 <__memmove+0xfc>
    800046c8:	0035c603          	lbu	a2,3(a1)
    800046cc:	00300713          	li	a4,3
    800046d0:	00c781a3          	sb	a2,3(a5)
    800046d4:	02e68663          	beq	a3,a4,80004700 <__memmove+0xfc>
    800046d8:	0045c603          	lbu	a2,4(a1)
    800046dc:	00400713          	li	a4,4
    800046e0:	00c78223          	sb	a2,4(a5)
    800046e4:	00e68e63          	beq	a3,a4,80004700 <__memmove+0xfc>
    800046e8:	0055c603          	lbu	a2,5(a1)
    800046ec:	00500713          	li	a4,5
    800046f0:	00c782a3          	sb	a2,5(a5)
    800046f4:	00e68663          	beq	a3,a4,80004700 <__memmove+0xfc>
    800046f8:	0065c703          	lbu	a4,6(a1)
    800046fc:	00e78323          	sb	a4,6(a5)
    80004700:	00813403          	ld	s0,8(sp)
    80004704:	01010113          	addi	sp,sp,16
    80004708:	00008067          	ret
    8000470c:	02061713          	slli	a4,a2,0x20
    80004710:	02075713          	srli	a4,a4,0x20
    80004714:	00e587b3          	add	a5,a1,a4
    80004718:	f0f574e3          	bgeu	a0,a5,80004620 <__memmove+0x1c>
    8000471c:	02069613          	slli	a2,a3,0x20
    80004720:	02065613          	srli	a2,a2,0x20
    80004724:	fff64613          	not	a2,a2
    80004728:	00e50733          	add	a4,a0,a4
    8000472c:	00c78633          	add	a2,a5,a2
    80004730:	fff7c683          	lbu	a3,-1(a5)
    80004734:	fff78793          	addi	a5,a5,-1
    80004738:	fff70713          	addi	a4,a4,-1
    8000473c:	00d70023          	sb	a3,0(a4)
    80004740:	fec798e3          	bne	a5,a2,80004730 <__memmove+0x12c>
    80004744:	00813403          	ld	s0,8(sp)
    80004748:	01010113          	addi	sp,sp,16
    8000474c:	00008067          	ret
    80004750:	02069713          	slli	a4,a3,0x20
    80004754:	02075713          	srli	a4,a4,0x20
    80004758:	00170713          	addi	a4,a4,1
    8000475c:	00e50733          	add	a4,a0,a4
    80004760:	00050793          	mv	a5,a0
    80004764:	0005c683          	lbu	a3,0(a1)
    80004768:	00178793          	addi	a5,a5,1
    8000476c:	00158593          	addi	a1,a1,1
    80004770:	fed78fa3          	sb	a3,-1(a5)
    80004774:	fee798e3          	bne	a5,a4,80004764 <__memmove+0x160>
    80004778:	f89ff06f          	j	80004700 <__memmove+0xfc>

000000008000477c <__putc>:
    8000477c:	fe010113          	addi	sp,sp,-32
    80004780:	00813823          	sd	s0,16(sp)
    80004784:	00113c23          	sd	ra,24(sp)
    80004788:	02010413          	addi	s0,sp,32
    8000478c:	00050793          	mv	a5,a0
    80004790:	fef40593          	addi	a1,s0,-17
    80004794:	00100613          	li	a2,1
    80004798:	00000513          	li	a0,0
    8000479c:	fef407a3          	sb	a5,-17(s0)
    800047a0:	fffff097          	auipc	ra,0xfffff
    800047a4:	b3c080e7          	jalr	-1220(ra) # 800032dc <console_write>
    800047a8:	01813083          	ld	ra,24(sp)
    800047ac:	01013403          	ld	s0,16(sp)
    800047b0:	02010113          	addi	sp,sp,32
    800047b4:	00008067          	ret

00000000800047b8 <__getc>:
    800047b8:	fe010113          	addi	sp,sp,-32
    800047bc:	00813823          	sd	s0,16(sp)
    800047c0:	00113c23          	sd	ra,24(sp)
    800047c4:	02010413          	addi	s0,sp,32
    800047c8:	fe840593          	addi	a1,s0,-24
    800047cc:	00100613          	li	a2,1
    800047d0:	00000513          	li	a0,0
    800047d4:	fffff097          	auipc	ra,0xfffff
    800047d8:	ae8080e7          	jalr	-1304(ra) # 800032bc <console_read>
    800047dc:	fe844503          	lbu	a0,-24(s0)
    800047e0:	01813083          	ld	ra,24(sp)
    800047e4:	01013403          	ld	s0,16(sp)
    800047e8:	02010113          	addi	sp,sp,32
    800047ec:	00008067          	ret

00000000800047f0 <console_handler>:
    800047f0:	fe010113          	addi	sp,sp,-32
    800047f4:	00813823          	sd	s0,16(sp)
    800047f8:	00113c23          	sd	ra,24(sp)
    800047fc:	00913423          	sd	s1,8(sp)
    80004800:	02010413          	addi	s0,sp,32
    80004804:	14202773          	csrr	a4,scause
    80004808:	100027f3          	csrr	a5,sstatus
    8000480c:	0027f793          	andi	a5,a5,2
    80004810:	06079e63          	bnez	a5,8000488c <console_handler+0x9c>
    80004814:	00074c63          	bltz	a4,8000482c <console_handler+0x3c>
    80004818:	01813083          	ld	ra,24(sp)
    8000481c:	01013403          	ld	s0,16(sp)
    80004820:	00813483          	ld	s1,8(sp)
    80004824:	02010113          	addi	sp,sp,32
    80004828:	00008067          	ret
    8000482c:	0ff77713          	andi	a4,a4,255
    80004830:	00900793          	li	a5,9
    80004834:	fef712e3          	bne	a4,a5,80004818 <console_handler+0x28>
    80004838:	ffffe097          	auipc	ra,0xffffe
    8000483c:	6dc080e7          	jalr	1756(ra) # 80002f14 <plic_claim>
    80004840:	00a00793          	li	a5,10
    80004844:	00050493          	mv	s1,a0
    80004848:	02f50c63          	beq	a0,a5,80004880 <console_handler+0x90>
    8000484c:	fc0506e3          	beqz	a0,80004818 <console_handler+0x28>
    80004850:	00050593          	mv	a1,a0
    80004854:	00001517          	auipc	a0,0x1
    80004858:	8a450513          	addi	a0,a0,-1884 # 800050f8 <_ZN15MemoryAllocator11HEADER_SIZEE+0xd8>
    8000485c:	fffff097          	auipc	ra,0xfffff
    80004860:	afc080e7          	jalr	-1284(ra) # 80003358 <__printf>
    80004864:	01013403          	ld	s0,16(sp)
    80004868:	01813083          	ld	ra,24(sp)
    8000486c:	00048513          	mv	a0,s1
    80004870:	00813483          	ld	s1,8(sp)
    80004874:	02010113          	addi	sp,sp,32
    80004878:	ffffe317          	auipc	t1,0xffffe
    8000487c:	6d430067          	jr	1748(t1) # 80002f4c <plic_complete>
    80004880:	fffff097          	auipc	ra,0xfffff
    80004884:	3e0080e7          	jalr	992(ra) # 80003c60 <uartintr>
    80004888:	fddff06f          	j	80004864 <console_handler+0x74>
    8000488c:	00001517          	auipc	a0,0x1
    80004890:	96c50513          	addi	a0,a0,-1684 # 800051f8 <digits+0x78>
    80004894:	fffff097          	auipc	ra,0xfffff
    80004898:	a68080e7          	jalr	-1432(ra) # 800032fc <panic>
	...
