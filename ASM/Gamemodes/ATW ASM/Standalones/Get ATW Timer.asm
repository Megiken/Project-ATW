#To be inserted at 8032C9A0

.include "Common/common.s"

backup
load r19,0x8045ac58
lbz r19,0x62(r19)
branchl r12,getCSSplayers
cmpwi r3,2
bge NORMAL
li r0,0x1734
b STORE
NORMAL:
mr r18,r3
li r20,25
li r21,0
mr r22,r18
LOOP:
subi r20,r20,5
add r21,r21,r20
subi r22,r22,1
compareine r22,1,LOOP
addi r21,r21,55
subi r22,r19,1
mulli r22,r22,65
add r3,r21,r22
restore
blr
