#To be inserted at 8032C8e4

.include "Common/common.s"

#input r14 = 1 or 2, player getting changed
#input r26 = new money to update

backupall

subi r4,r13,UCFTextPointers #get pointers
lwz r3,0(r4)

branchl r12,getMoneyText
mflr r4
li r21,0
cmpwi r14,2
bne CHANGETEXT


LOOPLOL:
lbzx r22,r21,r4
cmpwi r22,0x7c
addi r21,r21,1
bne LOOPLOL
add r4,r4,r21
CHANGETEXT:
cmpwi r26,0
bne GOODNUMAGAIN
li r26,0x30
li r16,0
stbx r26,r16,r4
addi r4,r4,1
b TRYNEXT
GOODNUMAGAIN:
li r22,0
branchl r12,storeAscii
TRYNEXT:
cmpwi r14,2
beq UPDATE
li r22,0x7c
stbx r22,r16,r4
add r4,r4,r16
addi r4,r4,1
branchl r12,IMgetSecond
mflr r20
lwz r26,0(r20)
cmpwi r26,0
beq GETMAXMONEY
lwz r26,IMmoneyOffset(r20)
cmpwi r26,0
bne GOODNUM
lwz r22,0(r20)
cmpwi r22,0
beq GETMAXMONEY
li r22,0x30
stbx r22,r4,r16
addi r16,r16,1
b UPDATEZERO
GETMAXMONEY:
load r20,IMplayerMoney
lwz r26,0(r20)
GOODNUM:
li r22,0
branchl r12,storeAscii
UPDATEZERO:
li r22,0
UPDATE:
stwx r22,r16,r4
branchl r12,getMoneyText
mflr r5
#Update Text
li  r4,0x0    #Subtext ID 1
branchl r12,0x803a70a0

restoreall
blr
