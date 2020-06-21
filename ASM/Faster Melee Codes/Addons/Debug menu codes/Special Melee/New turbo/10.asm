#To be inserted at 80077254

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
bne- loc_0x2C
lwz r14, 16(r26)
cmpwi r14, 0xD9
beq- loc_0x2C
li r14, 0x0
stb r14, 8851(r26)
lwz r14, 16(r26)
sth r14, 8848(r26)

loc_0x2C:
stw r24, 6420(r26)
