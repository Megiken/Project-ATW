#To be inserted at 80260890

.include "Common/common.s"
backupall


lbz r22,0x19(r3)
mr r3,r22
branchl r12,getCorrectData
cmpwi r3,-1
beq HIGH

lwz r20,IMtype(rtoc)
cmpwi r20,2
beq NONUMOFCHARS

lhz r20,0x6(r3)
load r21,IMnumOfChars
lwz r21,0(r21)
cmpw r21,r20
beq HIGH

lwz r20,IMtype(rtoc)
cmpwi r20,1
bne NONUMOFCHARS

lhz r20,IMpickban+2(rtoc)
addi r21,r14,IMpickban
subi r21,r21,1
lbzx r21,r21,rtoc
cmpw r20,r21
bne HIGH
b NORMAL

NONUMOFCHARS:

lwz r20,IMtype(rtoc)
cmpwi r20,0
beq NORMAL


CHECKMONEY:

lwz r20,IMmoneyOffset(r3)
load r21,IMplayerMoney
lwz r21,0(r21)
cmpwi r21,1000
bne ZEROONLY
sub r20,r21,r20
subi r21,r21,75
cmpw r20,r21
bge HIGH
b NORMAL

ZEROONLY:
sub r20,r21,r20
cmpw r20,r21
beq HIGH
b NORMAL

GOTFIRST:
cmpw r17,r16
bgt HIGH
b NORMAL

NORMAL:
li r22,500
branchl r12,Int2Float
lfs f7,0x10(r31)
fcmpo 0,f7,f8
bne THERE
li r20,0
stw r20,0x10(r31)
b END
THERE:
fcmpo 0,f1,f0
b END




HIGH:
li r22,500
branchl r12,Int2Float
stfs f8,0x10(r31)
fcmpo 0,f1,f1

END:
restoreall
