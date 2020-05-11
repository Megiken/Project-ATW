#To be inserted at 800D14E4

.include "Common/common.s"

backup

lbz r20, 12(r31)

branchl r12,getItemVars
mflr r21
lbzx r23,r21,r20


cmpwi r23,-1
ble SUBNOTIMER
cmpwi r23,0
beq SUBWITHTIMER
cmpwi r23,1
beq ZERO
cmpwi r23,2
bge SUBNOTIMER


SUBWITHTIMER:
subi r23,r23,1
stbx r23,r21,r20
addi r21,r21,4
mulli r20,r20,2
lbzx r22,r21,r20
addi r22,r22,25
stbx r22,r21,r20
b END
SUBNOTIMER:
subi r23,r23,1
stbx r23,r21,r20
b END
ZERO:
li r23,0
stbx r23,r21,r20
addi r21,r21,4
mulli r20,r20,2
sthx r23,r20,r21
END:

restore

blr
