#To be inserted at 800BFD9C

.include "Common/common.s"

backupall
lbz r25,0xc(r31)
mr r3,r25
branchl r12,getCorrectData
load r24,0x80480590
mulli r15,r25,0x24
add r24,r24,r15
lhz r20,SSdata(rtoc)
cmpwi r20,0
beq HEHE
load r20,0x804320af
b HAHA
HEHE:
load r20,0x804320bf
HAHA:
mulli r21,r25,8
add r20,r20,r21
lbz r21,0(r20)
stb r21,0(r24)
lbz r21,1(r20)
stb r21,3(r24)
mr r3,r25
mr r4,r24
branchl r12,loadCharacter
branchl r12,updateSFX
restoreall
mflr r0
