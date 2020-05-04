#To be inserted at 8006842c

.include "Common/common.s"

backup

lbz r3,0xc(r31)
mulli r21,r3,0xc
load r20,playerAttributes
branchl r12,getPlayerEntity
lwzx r22,r20,r21
stw r22,0x5c(r3)
addi r21,r21,4
lwzx r22,r20,r21
stw r22,0x54(r31)
addi r21,r21,4
lwzx r22,r20,r21
stw r22,0x58(r31)
