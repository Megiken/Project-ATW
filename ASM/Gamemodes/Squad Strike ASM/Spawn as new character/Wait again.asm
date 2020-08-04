#To be inserted at 800d3930

.include "Common/common.s"

backupallnor0
lbz r25,0xc(r5)
mr r3,r25
branchl r12,getCorrectData
cmpwi r3,-1
beq END
lwz r20,IMmoneyOffset(r3)
subi r17,r20,1
stw r17,IMmoneyOffset(r3)
cmpwi r20,180
bne NORMAL
mr r3,r25
branchl r12,getCorrectData
load r21,SSnumOfChars
lwz r21,0(r21)
lhz r20,4(r3)



subi r21,r21,1
sub r20,r21,r20
mulli r20,r20,4
addi r3,r3,8
lbzx r21,r20,r3
load r24,0x80480590
mulli r15,r25,0x24

addi r20,r20,3
lbzx r22,r20,r3
add r24,r24,r15


mulli r21,r21,0x100
add r20,r21,r22
load r21,0x8043208f
subi r14,r14,1
mulli r23,r14,0x10
addi r23,r23,8
sthx r20,r23,r21
cmpwi r14,1
beq STOREDUM
load r22,0x21000100
stw r22,0x10(r21)
b CACHE
STOREDUM:
load r22,0x1d000100
stw r22,0x10(r21)
CACHE:
branchl r12,0x80018254


NORMAL:
mr r0,r17
END:
restoreallnor0
cmpwi r0,0
