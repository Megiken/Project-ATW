#To be inserted at 8032C964

.include "Common/common.s"

#input r11 = team ID

backupall

lwz r3,mrsaturndata(rtoc)
li r18,0x6969
branchl r12,DestroyItem
li r18,0
li r20,0
LOOP:
mr r3,r20
branchl r12,getPlayerData
cmpwi r3,-1
beq NEXT
lbz r21,0x61b(r3)
cmpw r21,r11
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
bne NEXT2
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

li r31,0
POSLOOP:
mr r3,r31
branchl r12,getPlayerStatic
lwz r20,0(r3)
cmpwi r20,2
bne NEXTPOS
mr r14,r31
branchl r12,resetpos
mr r3,r31
branchl r12,getPlayerStatic
stw r15,0x28(r3)
stw r16,0x2c(r3)
stw r17,0x40(r3)
lwz r20,0xb0(r3)
lwz r20,0x2c(r20)
stw r17,0x2c(r20)
stw r17,0x30(r20)
mr r3,r31
branchl r12,getPlayerEntity
branchl r12,0x800d4ff4
mr r3,r31
branchl r12,getPlayerData
stw r15,0xb0(r3)
stw r16,0xb4(r3)
stw r17,0x2c(r3)
stw r17,0x30(r3)
NEXTPOS:
cmpwi r31,3
beq END
addi r31,r31,1
b POSLOOP
END:

li r3,0xdf
li r4,0xfe
li r5,0x80
li r7,7
branchl r12,playsfx

restoreall
blr
