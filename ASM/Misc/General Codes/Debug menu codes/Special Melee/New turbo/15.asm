#To be inserted at 80079820

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
bne- loc_0x38
lbz r4, 66(r23)
rlwinm. r4, r4, 29, 31, 31
bne- loc_0x38
lwz r4, 44(r26)
lwz r4, 1304(r4)
lwz r4, 44(r4)
li r5, 0x0
stb r5, 8851(r4)
lwz r5, 16(r4)
sth r5, 8848(r4)

loc_0x38:
rlwinm. r0, r3, 27, 31, 31
