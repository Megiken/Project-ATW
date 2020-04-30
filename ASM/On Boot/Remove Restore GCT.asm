#To be inserted at 8032c89c

.include "Common/common.s"

backupall

lwz r15,newHeapStart(rtoc)
rlwinm.	r22, r15, 0, 27, 31
sub r15,r15,r22
lwz r16,0(r15)
addi r15,r15,4
add r16,r16,r15
li r17,0

cmpw r16,r15
beq TRYC2

LOOP04:

lwz r20,0(r15)
lwz r21,4(r15)

stw r21,0(r20)

icbi r17,r20
sync
isync

stw r21,0(r20)

addi r15,r15,12
cmpw r15,r16
bne LOOP04

TRYC2:

lwz r16,0(r15)
addi r15,r15,4
add r16,r15,r16

cmpw r16,r15
beq TRY06

C2LOOP:

lwz r20,0(r15)
lwz r21,4(r15)

stw r21,0(r20)

icbi r17,r20
sync
isync

stw r21,0(r20)

lwz r20,8(r15)
add r15,r15,r20
addi r15,r15,12

cmpw r15,r16
bne C2LOOP

TRY06:

lwz r16,0(r15)
addi r15,r15,4
add r16,r15,r16

cmpw r16,r15
beq DONE

LOOP06:

lwz r3,0(r15)

cmpwi r3,0
bne GOOD
addi r15,r15,4
lwz r3,0(r15)

GOOD:

addi r4,r15,8
lwz r5,4(r15)
branchl r12,copymem
lwz r20,4(r15)
mulli r20,r20,2
add r15,r15,r20
addi r15,r15,8

addi r20,r15,4

cmpw r20,r16
beq DONE
cmpw r15,r16
bne LOOP06

DONE:

restoreall
blr
