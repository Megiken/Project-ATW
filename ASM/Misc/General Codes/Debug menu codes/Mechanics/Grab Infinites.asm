#To be inserted at 8008EE48

.include "Common/common.s"

load r14,grabInfinites
lwz r14,0(r14)
cmpwi r14,0
bne loc_0x54


lwz r3, 16(r27)
cmpwi r3, 0xD9
beq- loc_0x54
cmpwi r3, 0x163
bne+ loc_0x28
lwz r3, 4(r27)
cmpwi r3, 0x2
cmpwi cr1, r3, 0x19
cror 2, 2, 6
beq- loc_0x54

loc_0x28:
lbz r3, 8742(r29)
andi. r3, r3, 0x20
bne- loc_0x54
lfs f0, 6732(r29)
li r3, 0x0
stw r3, -16(r1)
lfs f1, -16(r1)
fcmpo cr0, f0, f1
cror 2, 0, 2
bne- loc_0x54
li r0, 0x0

loc_0x54:
cmpwi r0, 0x0
