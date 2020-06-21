#To be inserted at 800C9724

.include "Common/common.s"

lwz r20,0x2c(r31)
lbz r21, 12(r20)
branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,1
bne- loc_0x64
lbz r0, 8850(r5)
cmpwi r0, 0x1
bne- loc_0x64
lhz r0, 8848(r5)
lwz r14, 16(r5)
cmpw r0, r14
beq- loc_0x54
mr r3, r31
lis r14, 0x800D
ori r14, r14, 0x5FB0
mtctr r14
bctrl
mr r3, r31
lis r14, 0x800C
ori r14, r14, 0x9468
mtctr r14
bctrl

loc_0x54:
lis r14, 0x800C
ori r14, r14, 0x9754
mtctr r14
bctr

loc_0x64:
mr r3, r31
