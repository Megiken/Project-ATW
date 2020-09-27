#To be inserted at 8006B798

.include "Common/common.s"

lbz r21, 12(r31)
branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,1
bne loc_0x24

lbz r0, 8851(r31)
cmpwi r0, 0x28
beq- loc_0x24
li r0, 0x0
b loc_0x28

loc_0x24:
lbz r0, 8729(r31)

loc_0x28:
