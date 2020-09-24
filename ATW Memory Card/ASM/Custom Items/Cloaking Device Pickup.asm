#To be inserted at 80094658

.include "Common/memcard.s"

lwz r20, 44(r3)
lbz r21, 12(r20)


lwz r20,0x2c(r3)
lbz r20,0xc(r20)
branchl r12,getItemVars
mflr r21
addi r21,r21,24
li r22,1
stbx r22,r21,r20
addi r21,r21,4
mulli r20,r20,2
lhzx r22,r20,r21
addi r22,r22,600
sthx r22,r20,r21
