#To be inserted at 8016d310

.include "Common/common.s"

backupallnor0

load r20,0x8046b6a0
lbz r20,0x8(r20)
cmpwi r20,0
beq END
branchl r12,IMgetFirst
mflr r20
li r21,4
stw r21,4(r20)
branchl r12,IMgetSecond
mflr r20
stw r21,4(r20)
END:
restoreallnor0
lwz	r31, 0x0034 (sp)
