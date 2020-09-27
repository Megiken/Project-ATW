#To be inserted at 8006B7F8

.include "Common/common.s"

lbz r21, 12(r31)
branchl r14,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,1
bne- loc_0x7C
lbz r14, 8851(r31)
cmpwi r14, 0x28
beq- loc_0x7C
addi r14, r14, 0x1
stb r14, 8851(r31)
lwz r14, 6744(r31)
cmpwi r14, 0x0
beq- loc_0x34
b loc_0x7C

loc_0x34:
lbz r0, 8850(r31)
li r14, 0x1
rlwimi r0, r14, 0, 31, 31
stb r0, 8850(r31)
mr r3, r30
lwz r0, 224(r31)
cmpwi r0, 0x1
beq- loc_0x68
lis r14, 0x800C
ori r14, r14, 0x9614
mtctr r14
bctrl
b loc_0x84

loc_0x68:
lis r14, 0x800C
ori r14, r14, 0xCAAC
mtctr r14
bctrl
b loc_0x84

loc_0x7C:
cmpwi r12, 0x0
b loc_0xA8

loc_0x84:
lbz r0, 8850(r31)
li r14, 0x0
rlwimi r0, r14, 0, 31, 31
stb r0, 8850(r31)
lis r14, 0x8006
ori r14, r14, 0xB80C
mtctr r14
bctr
blrl

loc_0xA8:
