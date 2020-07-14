#To be inserted at 800DED14

lis r17, 0x8045
ori r17, r17, 0xBF12
lbz r17, 0(r17)
cmpwi r17, 0x3
bne- loc_0x60
lbz r3, 1659(r30)
lwz r4, 140(r30)
lwz r5, 32(r30)
cmpw r4, r5
bne- loc_0x2C
b loc_0x40

loc_0x2C:
cmpwi r3, 0x0
bne- loc_0x3C
li r3, 0x2
b loc_0x40

loc_0x3C:
li r3, 0x0

loc_0x40:
lis r6, 0x803C
ori r6, r6, 0x6630
cmpwi r3, 0x0
beq- loc_0x54
addi r6, r6, 0x4

loc_0x54:
lwz r7, 0(r6)
addi r7, r7, 0x1
stw r7, 0(r6)

loc_0x60:
mr r3, r31
