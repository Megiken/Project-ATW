#To be inserted at 8006a19c

.include "Common/common.s"

branchlr r14,getHitData
lbz r20,0xc(r26)
mulli r20,r20,4
li r21,0
stwx r21,r20,r14
lwz	r0, 0x00A4 (sp)
