#To be inserted at 802779d8

.include "Common/common.s"

backup

lwz r3,4(r31)
li r18,0x6969
branchl r12,DestroyItem
li r18,0
li r20,0
LOOP:
mr r3,r20
branchl r12,getPlayerData
lbz r21,0x61b(r3)
cmpwi r21,1
bne NEXT
lbz r3,0xc(r3)

li r15,0
load r16,0x80453080
li r10,0x70

LOOP2:
cmpw r15,r3
beq NEXT2
mulli r22,r15,0xe90
add r22,r22,r16
lwz r23,0(r22)
cmpwi r23,2
lbz r23,0x47(r22)
cmpw r23,r21
bne FOUND2
NEXT2:
addi r15,r15,1
addi r10,r10,4
b LOOP2
FOUND2:
branchl r12,getPlayerStatic
lwz r17,0(r3)
cmpwi r17,2
bne NEXT
lwzx r17,r10,r3
addi r17,r17,1
stwx r17,r10,r3
NEXT:
addi r20,r20,1
cmpwi r20,5
bne LOOP

branchl r12,spawnMrSaturn



restore
branch r12,0x80277c1c
