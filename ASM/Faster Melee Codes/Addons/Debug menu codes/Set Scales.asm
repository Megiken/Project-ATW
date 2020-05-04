#To be inserted at 8006842c

.include "Common/common.s"


lbz r3,0xc(r31)
mulli r21,r3,0xc
load r20,playerAttributes
branchl r12,getPlayerStatic
lwzx r22,r20,r21
stw r22,0x34(r31)
stw r22,0x38(r31)
stw r22,0x3c(r31)
addi r21,r21,4
lwzx r22,r20,r21
stw r22,0x54(r3)
addi r21,r21,4
lwzx r22,r20,r21
stw r22,0x58(r3)
mr r3,r30
