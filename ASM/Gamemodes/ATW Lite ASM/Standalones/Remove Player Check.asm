#To be inserted at 8032C85c

.include "Common/common.s"

mflr r12
lbzx r17,r14,r18
load r21,numOfChars
lwz r21,0(r21)
cmpw r17,r21
bne ADD
mulli r17,r18,0x24
add r17,r17,r16
li r20,3
stb r20,1(r17)
mtlr r12
blr
ADD:
addi r17,r17,1
stbx r17,r18,r14
mtlr r12
blr
