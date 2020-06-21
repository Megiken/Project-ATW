#To be inserted at 80076DC8

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
 bne- loc_0x20
 li r14, 0x0
 stb r14, 8851(r29)
 lwz r14, 16(r29)
 sth r14, 8848(r29)

loc_0x20:
 stw r3, 6564(r31)
