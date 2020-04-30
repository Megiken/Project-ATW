#To be inserted at 80294C3C

.include "Common/common.s"

backupall
branchl r12,getItemVars
mflr r15
addi r15,r15,48
lwz r16,0x2c(r24)
lbz r16,0xc(r16)
lbzx r17,r16,r15
cmpwi r17,1
beq END
restoreall
branchl r12,0x8026a8ec
branch r12,0x8026ad9c
END:
restoreall
mflr r0
