#To be inserted at 8016DDCC

.include "Common/common.s"
backupallnor0
load r15,timerVar
lwz r15,0(r15)
cmpwi r15,0
beq CUSTOM
load r15,customTimer
lwz r0,0(r15)
b STORE



CUSTOM:

load r19,0x8045ac58
lbz r19,0x62(r19)
branchl r12,getCSSplayers
cmpwi r3,2
bge NORMAL
li r0,0x1734
b STORE
NORMAL:
mr r18,r3
li r20,40
li r21,1
li r22,5
mr r23,r18
li r25,0
LOOP:
mulli r24,r22,5
add r25,r25,r24
subi r22,r22,1
subi r23,r23,1
cmpwi r23,1
bne LOOP
add r20,r20,r25
subi r21,r19,1
cmpwi r21,0
beq PRESTORE
li r22,60
li r24,4
sub r24,r24,r18
mulli r24,r24,5
add r22,r22,r24
add r20,r22,r20
PRESTORE:
mr r0,r20
STORE:
restoreallnor0
  stw r0, 40(r31)
