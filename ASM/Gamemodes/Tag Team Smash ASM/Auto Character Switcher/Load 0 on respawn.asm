#To be inserted at 800bfe50

.include "Common/common.s"

backupallnor0
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r20,0xb0(r3)
lwz r20,0x2c(r20)
li r0,5
stw r0,0x1a94(r20)
lbz r0,0x221f(r20)
ori r0,r0,8
xori r0,r0,8
stb r0,0x221f(r20)
lwz r21,0xb4(r3)
lwz r21,0x2c(r21)
li r0,6
stw r0,0x1a94(r21)
lbz r4,0x221f(r21)
ori r4,r4,8
stb r4,0x221f(r21)
compareeq r21,r31,SUBCHAR
lbz r0,0x221f(r31)
li r4,8
or r5,r0,r4
xor r4,r5,r4
stb r4,0x221f(r31)
li r0,0
b END
SUBCHAR:
li r0,1
END:

restoreallnor0
mr r4,r0
