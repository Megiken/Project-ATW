#To be inserted at 8016d310

.include "Common/common.s"

backupallnor0

load r20,0x8046b6a0
lbz r20,0x8(r20)
cmpwi r20,0
beq END
#Change stocks

branchl r12,IMgetFirst
mflr r20
lbz r3,3(r20)
branchl r12,getPlayerStatic
lbz r21,0x8e(r3)
cmpwi r21,0
bne WINNER
branchl r12,IMgetSecond
mflr r3
li r23,2
lbz r3,3(r3)
b WIN
WINNER:
lbz r3,3(r20)
li r23,1
WIN:
branchl r12,getPlayerStatic
lbz r20,0x8e(r3)
cmpwi r23,1
beq FIRST
stw r20,IMp2Stocks(rtoc)
load r20,0x8045bf14
lbz r20,0(r20)
stw r20,IMp1Stocks(rtoc)
b DONE
FIRST:
stw r20,IMp1Stocks(rtoc)
load r20,0x8045bf14
lbz r20,0(r20)
stw r20,IMp2Stocks(rtoc)
DONE:


#Change char
branchl r12,IMgetFirst
mflr r20
lbz r3,3(r20)
branchl r12,getPlayerStatic
lbz r21,0x8e(r3)
mr r3,r20
lbz r18,3(r3)
cmpwi r21,0
beq LOST
branchl r12,IMgetSecond
mflr r3
lbz r18,3(r3)

LOST:
addi r15,r3,8
lhz r16,6(r3)
load r17,0x8045acb8
load r20,IMcharOrder
lwz r20,0(r20)
lhz r21,4(r3)
addi r21,r21,1
sth r21,4(r3)
cmpw r21,r16
beq GAMEOVER
cmpwi r20,0
beq TAKEBACK


mulli r21,r21,4
lbzx r22,r21,r15
cmpwi r22,0x13
bne NOTSHEIKFRONT
lwzx r21,r21,r15
lis r25,0x0100
sub r21,r21,r25
li r25,1
stb r25,2(r3)


b GOODFRONT

NOTSHEIKFRONT:
lwzx r21,r21,r15
li r25,0
stb r25,2(r3)
GOODFRONT:
mulli r22,r18,0x24
stwx r21,r22,r17
b END

TAKEBACK:
subi r16,r16,1
mulli r16,r16,4
mulli r21,r21,4
sub r21,r16,r21
lbzx r22,r21,r15
cmpwi r22,0x13
bne NOTSHEIKBACK
lwzx r21,r21,r15
lis r25,0x0100
sub r21,r21,r25
li r25,1
stb r25,2(r3)


b GOODBACK


NOTSHEIKBACK:
lwzx r21,r21,r15
li r25,0
stb r25,2(r3)
GOODBACK:
mulli r22,r18,0x24
stwx r21,r22,r17
b END

GAMEOVER:
li r20,1
stw r20,IMgameOverFlag(rtoc)
lbz r20,3(r3)
mulli r20,r20,0x24
lis r22,0x1a03
stwx r22,r17,r20

END:
li r20,2
stw r20,IMgameOverFlag(rtoc)




restoreallnor0
lwz	r31, 0x0034 (sp)
