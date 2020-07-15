#To be inserted at 801d8518

.include "Common/common.s"

li r3,8
branchl r12,getStageGObj
li r4,0
branchl r12,0x801c3fa4
load r21,0xC1700000
stw r21,0x3c(r3)
branchl r12,0x803732e8
bl THERE
.long 0xC28C0000
THERE:
mflr r20
lfs f1,0(r20)
branchl r12,0x801c438c


li r3,8
branchl r12,getStageGObj
branchl r12,GObjRemove

lwz	r0, 0x000C (sp)
