#To be inserted at 8008DFAC

.include "Common/common.s"

load r14,wallBracing
lwz r14,0(r14)
cmpwi r14,0
bne END

cmpwi r28, 0x3
beq- loc_0x34

lbz r3, 1828(r29)
andi. r3, r3, 0x4
cmpwi r3, 0x4
bne+ loc_0x34
lwz r3, 1568(r29)
cmpwi r3, 0x0
bne- loc_0x2C
li r3, 0x1
b loc_0x30

loc_0x2C:
li r3, 0x0

loc_0x30:
cmpwi r3, 0x0

loc_0x34:
b LOL

END:
cmpwi r28, 0x3
LOL:
