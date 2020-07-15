#To be inserted at 8006CA9C

.include "Common/common.s"

backupall
lwz r20,0x1974(r31)
cmpwi r20,0
bne END
branchl r12,getCustomEntityStruct
mflr r3
li r21,Egg
stw r21,8(r3)
li r4,1
branchl r12,EntityItemSpawn
mr r4,r3
mr r3,r30
branchl r12,0x800948a8
END:
restoreall
lbz	r0, 0x221E (r31)
