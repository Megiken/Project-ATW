#To be inserted at 802705A8

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
bne- loc_0x20
li r14, 0x0
stb r14, 8851(r28)
lwz r14, 16(r28)
sth r14, 8848(r28)

loc_0x20:
stw r21, 6420(r28)
