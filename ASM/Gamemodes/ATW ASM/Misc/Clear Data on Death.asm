#To be inserted at 8016733C

.include "Common/common.s"

addi r29,r3,0
backupallnomflr

branchl r12,getItemVars
mflr r15
li r16,0
li r17,1
mulli r18,r3,2
LOOP:
stbx r16,r15,r3
addi r15,r15,4
sthx r16,r15,r18
addi r15,r15,8
addi r17,r17,1
cmpwi r17,5
beq END
b LOOP
END:
restoreallnomtlr
