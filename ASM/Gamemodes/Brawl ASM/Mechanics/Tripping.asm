#To be inserted at 800693EC

cmpwi r4, 0x14
bne- loc_0x44
li r3, 100
lis r12, 0x8038
ori r12, r12, 0x580
mtctr r12
bctrl
cmpwi r3, 0x0
bne- loc_0x44
lwz r3, 396(r30)
lwz r4, 140(r30)
cmpwi r4, 0x0
bge- loc_0x3C
lis r4, 0x8000
or r3, r3, r4

loc_0x3C:
stw r3, 236(r30)
li r24, 0xBF

loc_0x44:
cmplwi r27, 0
