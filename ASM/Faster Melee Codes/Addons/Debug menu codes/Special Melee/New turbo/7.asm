#To be inserted at 80068684

.include "Common/common.s"

load r14,statusFlag
lwz r14,0(r14)
cmpwi r14,2
bne- loc_0x28
li r0, -1
sth r0, 8848(r6)
li r0, 0x0
stb r0, 8850(r6)
li r0, 0x28
stb r0, 8851(r6)

loc_0x28:
lbz r3, 12(r31)
