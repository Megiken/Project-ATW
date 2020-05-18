#To be inserted at 800BFD9C

.include "Common/common.s"

backupall
lbz r25,0xc(r31)
lwz r18,0x890(r31)
mr r3,r25
branchl r12,getCorrectData
lhz r20,4(r3)
addi r20,r20,1
sth r20,4(r3)
load r21,SSnumOfChars
lwz r21,0(r21)
subi r21,r21,1
sub r20,r21,r20
mulli r20,r20,4
addi r3,r3,8
lbzx r21,r20,r3
load r24,0x80480590
mulli r15,r25,0x24
stbx r21,r15,r24

addi r20,r20,3
lbzx r22,r20,r3
add r24,r24,r15
stb r22,3(r24)


mulli r21,r21,0x100
add r20,r21,r22
load r21,0x804320bf
subi r14,r14,1
mulli r23,r14,8
sthx r20,r23,r21
branchl r12,0x80018254
mr r3,r25
branchl r12,getPlayerStatic
lwz r19,0x8c(r3)
mr r3,r25
mr r4,r24
branchl r12,0x8016d8ac

li r17, 0x6969
mr r3,r25
branchl r12,getPlayerEntity
li r15, 0xFF
stb r15, 7(r3)
stb r15, 6(r3)
mr r16,r3
mr r3,r25
branchl r12,0x8016e2bc

mr r3,r25
branchl r12,getPlayerStatic
stw r19,0x8c(r3)
mr r3,r25
branchl r12,getPlayerData
stw r18,0x890(r3)
lbz r21, 8733(r3)
rlwimi r21, r21, 3, 28, 28
stb r21, 8733(r3)
restoreall
mflr r0
