#To be inserted at 80165A64

lis r17, 0x8045
ori r17, r17, 0xBF12
lbz r17, 0(r17)
cmpwi r17, 0x3
bne- loc_0x64
lis r17, 0x803C
ori r17, r17, 0x6630
lis r18, 0x80BD
ori r18, r18, 0xA4A0
lwz r18, 0(r18)
mr r19, r26

loc_0x2C:
cmpwi r19, 0x0
beq- loc_0x40
subi r19, r19, 0x1
lwz r18, 8(r18)
b loc_0x2C

loc_0x40:
lbz r19, 1659(r18)
cmpwi r19, 0x0
beq- loc_0x50
addi r17, r17, 0x4

loc_0x50:
lwz r0, 0(r17)
lis r17, 0x8016
ori r17, r17, 0x5AA4
mtctr r17
bctr

loc_0x64:
mullw r0, r6, r0
