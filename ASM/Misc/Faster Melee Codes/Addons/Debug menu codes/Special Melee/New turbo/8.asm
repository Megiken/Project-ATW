#To be inserted at 8006CB14

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
bne- loc_0x1C
lwz r14, 44(r3)
li r0, 0x28
stb r0, 8851(r14)

loc_0x1C:
blrl
