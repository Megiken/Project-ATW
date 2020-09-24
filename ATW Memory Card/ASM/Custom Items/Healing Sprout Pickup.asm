#To be inserted at 80294BE4

.include "Common/memcard.s"

mflr r0
branchl r12,getItemVars
mflr r15
addi r15,r15,48
lwz r16,0x2c(r29)
lbz r16,0xc(r16)
li r19,1
stbx r19,r16,r15
