#To be inserted at 8006cd5c

.include "Common/common.s"

backupallnor0
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r20,0xb4(r3)
lwz r20,0x2c(r20)
compareeq r20,r31,SUBCHAR
li r0,0
b LOL
SUBCHAR:
li r0,1
LOL:
restoreallnor0
mr r4,r0
