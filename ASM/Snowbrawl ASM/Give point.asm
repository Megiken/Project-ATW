#To be inserted at 8006cc7c

.include "Common/common.s"

backupall
mr r31,r3
lbz r22,0xc(r31)
lwz r20,0x1868(r31)
lhz r21,0(r20)
cmpwi r21,6
bne END
lwz r20,0x2c(r20)
lwz r21,0x10(r20)
cmpwi r21,3
bne END
lwz r20,0x518(r20)
lwz r20,0x2c(r20)
lbz r3,0xc(r20)
cmpw r3,r22
beq END



cmpwi r3,1
beq P1
li r10,0x74
b DONE
P1:
li r10,0x70
DONE:
branchl r12,getPlayerStatic
lwzx r4,r3,r10
addi r4,r4,1
stwx r4,r3,r10
load r20,0x8046b970
lbz r21,0xc(r31)
mulli r21,r21,0xa8
lwzx r4,r20,r21
addi r4,r4,1
END:
restoreall
mflr r0
