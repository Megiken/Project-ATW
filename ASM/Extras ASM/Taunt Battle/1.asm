#To be inserted at 80224C24

lis r17, 0x8045
ori r17, r17, 0xBF12
lbz r17, 0(r17)
cmpwi r17, 0x3
bne- loc_0x20
cmpwi r4, 0x1
bne- loc_0x20
addi r4, r4, 0x1

loc_0x20:
stb r4, 10(r25)
