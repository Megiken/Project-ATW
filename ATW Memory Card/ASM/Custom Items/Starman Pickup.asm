#To be inserted at 80077D24

.include "Common/memcard.s"



lbz r20,0xc(r3)



branchl r12,getItemVars
mflr r21
addi r21,r21,12
li r22,1
stbx r22,r21,r20
addi r21,r21,4
mulli r20,r20,2
lhzx r22,r21,r20
addi r22,r22,540
sthx r22,r21,r20
