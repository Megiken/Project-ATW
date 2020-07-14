#To be inserted at 80081104

.include "Common/common.s"
backup

lwz    r28, -0x4044 (r13)
load  r3,0x80452C68
lwz r3,0x0(r3)
lwz r3,0x28(r3)
branchl r12,0x80368458

li r3,5
load  r4,0x00301306
li r5,0x1455
branchl r12,prim.new
subi r3,r3,4
loadwz r20,boxCoordinates
stwu r20,4(r3)
loadwz r22,boxCoordinates+8
stwu r22,4(r3)
load r24,0xC1200000
stwu r24,4(r3)
load r25,0x89cff0ff
stwu r25,4(r3)
loadwz r21,boxCoordinates+4
stwu r21,4(r3)
stwu r22,4(r3)
stwu r24,4(r3)
stwu r25,4(r3)
stwu r21,4(r3)
loadwz r23,boxCoordinates+12
stwu r23,4(r3)
stwu r24,4(r3)
stwu r25,4(r3)
stwu r20,4(r3)
stwu r23,4(r3)
stwu r24,4(r3)
stwu r25,4(r3)
stwu r20,4(r3)
stwu r22,4(r3)
stwu r24,4(r3)
stwu r25,4(r3)
branchl r12,prim.close
mr  r3,r28
branchl r12,0x80368458
restore
lmw	r27, 0x008C (sp)
