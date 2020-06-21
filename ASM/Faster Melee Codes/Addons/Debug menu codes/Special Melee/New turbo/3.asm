#To be inserted at 800D69A4

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
bne- loc_0x50
lbz r0, 8850(r5)
rlwinm. r0, r0, 0, 31, 31
beq- loc_0x50
lwz r0, 4(r5)
cmpwi r0, 0x2
beq- loc_0x34
cmpwi r0, 0x19
beq- loc_0x34
b loc_0x50

loc_0x34:
lwz r14, 16(r5)
cmpwi r14, 0x163
beq- loc_0x54
b loc_0x50
lhz r0, 8848(r5)
cmpw r0, r14
beq- loc_0x54

loc_0x50:
blrl

loc_0x54:
