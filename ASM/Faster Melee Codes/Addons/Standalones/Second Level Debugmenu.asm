#To be inserted at 8032C908

.include "Common/common.s"

mflr	r0
lwz	r4, 0x0014 (r4)
stw	r0, 0x0004 (sp)
stwu	sp, -0x0008 (sp)
lis	r5, 0x8030
ori	r5, r5, 0x1C80
branchl r12,0x802ffd94
li r3,0
lwz r0,0xc(sp)
addi sp,sp,8
mtlr r0
blr
