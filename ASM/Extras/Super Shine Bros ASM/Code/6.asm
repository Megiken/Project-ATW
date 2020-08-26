#To be inserted at 80096710

lbz r6, 12(r31)
subi r7, r2, 0xDC8
lbzx r6, r6, r7
cmpwi r6, 0x0
beq- loc_0x20
lis r12, 0x8019
ori r12, r12, 0xAF4C
b loc_0x24

loc_0x20:
lwz r12, 0(r3)

loc_0x24:
