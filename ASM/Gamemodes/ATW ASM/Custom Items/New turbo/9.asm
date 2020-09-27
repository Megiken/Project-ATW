#To be inserted at 80081370

.include "Common/common.s"

mflr r14
lwz r20,0x2c(r3)
lbz r21, 12(r20)
branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
mtlr r14
cmpwi r20,1
bne- loc_0x1C
lwz r14, 44(r3)
li r0, 0x28
stb r0, 8851(r14)

loc_0x1C:
mflr r0
