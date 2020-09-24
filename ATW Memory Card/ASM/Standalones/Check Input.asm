#To be inserted at 8032c854

.include "Common/common.s"

#input r18 = inputs to compare

li r15,4
mtctr r15
load r16,0x804c20bc
li r17,0
load r19,0x804a0bc0
li r23,-1
li r24,0
b LOOP
FOUND:
compareine r23,-1,NO
mr r23,r17
li r24,1
b NEXT
LOOP:
lwz r20,0(r19)
lbz r21,5(r20)
cmplwi r21,3
beq NEXT
rlwinm r21,r17,0,24,31
mulli r21,r21,68
add r20,r16,r21
lwz r21,8(r20)
cmpw r21,r18
beq FOUND
NEXT:
addi r19,r19,4
addi r17,r17,1
bdnz LOOP
NO:
compareieq r24,1,GOOD
li r17,-1
b ENDlol
GOOD:
mr r17,r23
ENDlol:
blr
