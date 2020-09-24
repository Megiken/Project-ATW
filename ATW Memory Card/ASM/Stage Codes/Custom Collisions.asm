#To be inserted at 801C60DC

.include "Common/memcard.s"

stw r3, 1708(r30)
load r20,stageData
lwz r20,0x88(r20)
cmpwi r20,0x3
beq RC
cmpwi r20,0x15
beq FOURSIDE
cmpwi r20,MuteCityinID
beq MUTECITY
b END
FOURSIDE:
lwz r4, 8(r3)
li r3, 0x1
stb r3,0x10e(r4)
stb r3,0x11e(r4)
stb r3,0x12e(r4)
stb r3,0x13e(r4)
stb r3,0x14e(r4)
stb r3,0x15e(r4)
stb r3,0x16e(r4)
stb r3,0x17e(r4)
stb r3,0x18e(r4)
stb r3,0x19e(r4)
stb r3,0x1ae(r4)
stb r3,0x1be(r4)
stb r3,0x1ce(r4)
stb r3,0x1de(r4)
b END
RC:
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
b END
MUTECITY:
lwz r4, 8(r3)
li r3,2
stb r3,0xe(r4)
END:
