#To be inserted at 80068424

.include "Common/common.s"

#Scales
load r20,sizeFlag
lwz r20,0(r20)
cmpwi r20,0
beq GOATTRIBUTES

cmpwi r20,1
beq GIANT
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
load r21,0x3F000000
stw r21,0x58(r3)
load r21,0x3EB33333
stw r21,0x34(r31)
stw r21,0x38(r31)
stw r21,0x5c(r3)

b END
GIANT:
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
load r21,0x3FC00000
stw r21,0x54(r3)
load r21,0x3FE66666
stw r21,0x34(r31)
stw r21,0x38(r31)
stw r21,0x5c(r3)
b END
GOATTRIBUTES:
lbz r3,0xc(r31)
mulli r21,r3,0xc
load r20,playerAttributes
branchl r12,getPlayerStatic
lwzx r22,r20,r21
stw r22,0x34(r31)
stw r22,0x38(r31)
stw r22,0x5c(r3)
addi r21,r21,4
lwzx r22,r20,r21
stw r22,0x54(r3)
addi r21,r21,4
lwzx r22,r20,r21
stw r22,0x58(r3)


END:
mr r3,r30
