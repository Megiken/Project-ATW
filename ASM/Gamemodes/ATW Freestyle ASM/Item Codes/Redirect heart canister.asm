#To be inserted at 80094c60

.include "Common/common.s"

lbz r20, 12(r3)



branchl r12,getItemVars
mflr r21
lbzx r23,r21,r20
cmpwi r23,1
bge ADDNOTIMER
cmpwi r23,0
beq ADDWITHTIMER
cmpwi r23,-1
beq ZERO
cmpwi r23,-2
ble ADDNOTIMER


ADDWITHTIMER:
addi r23,r23,1
stbx r23,r21,r20
addi r21,r21,4
mulli r20,r20,2
lbzx r22,r21,r20
addi r22,r22,25
stbx r22,r21,r20
b END
ADDNOTIMER:
addi r23,r23,1
stbx r23,r21,r20
b END
ZERO:
li r23,0
stbx r23,r21,r20
addi r21,r21,4
mulli r20,r20,2
sthx r23,r20,r21
END:
