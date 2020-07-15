#To be inserted at 80167C08

lis r17, 0x8045
ori r17, r17, 0xBF12
lbz r17, 0(r17)
cmpwi r17, 0x3
bne- loc_0x1C
li r0, 0x0
b loc_0x20

loc_0x1C:
lbz r0, 2(r30)

loc_0x20:
