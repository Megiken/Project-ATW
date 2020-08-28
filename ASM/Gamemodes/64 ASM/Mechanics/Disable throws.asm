#To be inserted at 800dd398

.include "Common/common.s"

loadwz r12,throws64Flag
compareieq r12,0,NORMAL 
cmpwi r4,0xdd
beq BACK
cmpwi r4,0xde
bne NORMAL
BACK:
blr
NORMAL:
mflr r0
