#To be inserted at 8026ddfc

.include "Common/common.s"

backupall
lwz r31,0x2c(r3)
branchlr r14,getHitData
lwz r20,0(r14)
lwz r21,4(r14)
comparene r20,r21,GOAL
compareieq r20,0,END
GOAL:
li r20,0
stw r20,0(r14)
stw r20,4(r14)

END:
restoreall
mflr r0
