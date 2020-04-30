#To be inserted at 8032c898

.include "Common/common.s"

#inputs
#20 = pointer to ascii
#21 = start of file


backupall


mr r3,r20
rlwinm.	r22, r21, 0, 27, 31
sub r21,r21,r22
mr r4,r21
addi r5,sp,12
branchl r12,0x8001668C

li r17,0
li r14,0
mr r15,r21
lwz r16,0(r15)
addi r15,r15,4
add r16,r15,r16
cmpw r16,r15
beq TRYC2

#04

LOOP04:
lwz r20,0(r15)
lwz r21,0(r20)
stw r21,4(r15)
lwz r21,8(r15)

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
lwz r21,0(r20)
stw r21,4(r15)
addi r21,r15,8

sub r22,r20,r21
sub r22,r17,r22
lis r21,0x4800
add r23,r22,r21
addi r23,r23,4

stw r23,0(r20)

icbi r17,r20
sync
isync

stw r23,0(r20)

lwz r21,8(r15)
subi r18,r21,4
add r21,r15,r18
addi r21,r21,12

sub r22,r21,r20
sub r22,r17,r22
addi r22,r22,4
lis r24,0x4c00
add r23,r22,r24

stw r23,0(r21)


icbi r17,r20
sync
isync

stw r23,0(r21)

add r15,r15,r18
addi r15,r15,16

cmpw r15,r16
bne C2LOOP

TRY06:

lwz r16,0(r15)
addi r15,r15,4
add r16,r15,r16

cmpw r16,r15
beq DONE

LOOP06:

lwz r4,0(r15)

cmpwi r4,0
bne GOOD
addi r15,r15,4
lwz r4,0(r15)

GOOD:
addi r3,r15,8
lwz r5,4(r15)
branchl r12,copymem
lwz r3,0(r15)
lwz r20,4(r15)
add r15,r15,r20
addi r15,r15,8
mr r4,r15
mr r5,r20
branchl r12,copymem



add r15,r15,r20

addi r20,r15,4

cmpw r20,r16
beq DONE
cmpw r15,r16
bne LOOP06

DONE:

restoreall
blr
