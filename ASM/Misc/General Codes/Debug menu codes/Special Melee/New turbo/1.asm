#To be inserted at 8006B798

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
bne loc_0x24

lbz r0, 8851(r31)
cmpwi r0, 0x28
beq- loc_0x24
li r0, 0x0
b loc_0x28

loc_0x24:
lbz r0, 8729(r31)

loc_0x28:
