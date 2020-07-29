#To be inserted at 800d3930

.include "Common/common.s"

backupallnor0
lbz r25,0xc(r5)
mr r3,r25
branchl r12,getCorrectData
cmpwi r3,-1
beq END
lwz r20,IMmoneyOffset(r3)
subi r21,r20,1
stw r21,IMmoneyOffset(r3)
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
mulli r23,r25,8
sthx r20,r23,r21
li r17,0x6969
branchl r12,0x80018254

stw r25,SScurrentChar(rtoc)
branchl r12,getSSramInfo
mflr r20

NORMAL:
mr r0,r21
END:
restoreallnor0
cmpwi r0,0
