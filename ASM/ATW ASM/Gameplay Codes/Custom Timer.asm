#To be inserted at 8016DDCC

.include "Common/common.s"

load r15,timerVar
lwz r15,0(r15)
cmpwi r15,0
beq CUSTOM
load r15,saveStocks
lwz r15,0(r15)
cmpwi r15,1
beq CUSTOMTIMERLOL
li r0,0x1734
b STORE
CUSTOMTIMERLOL:
load r15,customTimer

lwz r0,0(r15)
b STORE



CUSTOM:

load r19,0x8045ac58
lbz r19,0x62(r19)

lis r16,0x8045
ori r16,r16,0xacb9
li r21,0
li r18,0
li r17,0
LOOP:
cmpwi r18,4
beq DONE
addi r18,r18,1
lbzx r20,r16,r21
cmpwi r20,0x03
addi r21,r21,0x24
beq LOOP
addi r17,r17,1
b LOOP
DONE:

mr r3,r17
li r18,0
bl TRI
mulli r18,r18,5
subi r18,r18,10
addi r18,r18,60
mullw r18,r18,r19
subi r20,r19,1
mullw r20,r20,r17
li r21,2
divw r20,r20,r21
mulli r20,r20,5
add r20,r20,r18
mr r0,r20
b STORE
TRI:
cmpwi r3,0
beqlr
add r18,r18,r3
subi r3,r3,1
b TRI

STORE:
  stw r0, 40(r31)
