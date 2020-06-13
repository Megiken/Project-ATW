#To be inserted at 801C60DC

stw r3, 1708(r30)
lwz r4, 4(r3)
cmpwi r4, 0xAF
bne- loc_0x3C
lwz r4, 8(r3)
li r3, 0x1
stb r3, 350(r4)
stb r3, 414(r4)
stb r3, 174(r4)
stb r3, 478(r4)
stb r3, 206(r4)
stb r3, 190(r4)
stb r3, 222(r4)
stb r3, 238(r4)
stb r3, 782(r4)
stb r3,0x13e(r4)
stb r3,0x14e(r4)
stb r3,0x17e(r4)
stb r3,0x1ce(r4)
stb r3,0x1ae(r4)
stb r3,0x18e(r4)
stb r3,0x16e(r4)
stb r3,0x1be(r4)
stb r3,0x1ee(r4)
stb r3,0xfe(r4)
loc_0x3C:
