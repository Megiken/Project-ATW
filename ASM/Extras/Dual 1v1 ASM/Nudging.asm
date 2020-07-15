#To be inserted at 8007DDC8

lbz r15, 1563(r30)
lbz r16, 1659(r29)
cmpw r15, r16
beq- loc_0x14
li r3, 0x1

loc_0x14:
cmpwi r3, 0x0
