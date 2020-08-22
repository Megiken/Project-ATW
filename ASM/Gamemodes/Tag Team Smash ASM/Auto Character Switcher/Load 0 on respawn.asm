#To be inserted at 800bfe50

.include "Common/common.s"

backupallnor0
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r20,0xb4(r3)
lwz r20,0x2c(r20)
compareeq r20,r31,SUBCHAR
lbz r0,0x221f(r31)
li r4,8
xor r4,r0,r4
stb r4,0x221f(r31)
li r0,0
b END
SUBCHAR:
li r0,1
END:

restoreallnor0
mr r4,r0
