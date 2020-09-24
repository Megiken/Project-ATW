#To be inserted at 8016e930

.include "Common/common.s"


backup
li r3,6
li r4,7
bl TIMERTHINK
mflr r5
li r6,0
li r7,8
branchl r12,createCustomGObj
b END
TIMERTHINK:
blrl
backup
lwz r30,0x2c(r3)
mr r31,r3
lwz r20,0(r30)
addi r20,r20,1
stw r20,0(r30)
branchl r12,getATWTimer
mulli r3,r3,60
addi r3,r3,124
comparelt r20,r3,ENDTHINK
compareeq r20,r3,RAISEPERCENT
addi r3,r3,299
comparelt r20,r3,ENDTHINK
addi r3,r3,1199
comparelt r20,r3,SPAWNBOMBS
b SPAWNGREENSHELLS

RAISEPERCENT:
loadbz r20,doublesByte
compareieq r20,0,DOIT
branchl r12,getDoublesWinner
compareine r3,-1,ENDTHINK
li r20,0
LOOP:
mr r3,r20
branchl r12,getPlayerStatic
lhz r21,0x60(r3)
addi r21,r21,150
sth r21,0x60(r3)
mr r3,r20
branchl r12,getPlayerData
lfs f10,0x1838(r3)
loadfloat f11,r21,0x43160000
fadd f10,f10,f11
stfs f10,0x1838(r3)
addi r20,r20,1
compareine r20,4,LOOP
lis	r3, 0x804A
addi	r3, r3, 3632
li r4,-1
stw r4,0(r3)
load r20,timerSeconds
li r21,5999
stw r21,0(r20)
b ENDTHINK
SPAWNBOMBS:
lwz r20,4(r30)
addi r21,r20,1
stw r21,4(r30)
compareine r20,60,ENDTHINK
li r20,0
stw r20,4(r30)
branchl r12,getCustomEntityStruct
mflr r29
addi r3,r29,0x14
branchl r12,0x8026cb3c
compareieq r3,0,ENDTHINK
lwz r21,0x14(r29)
stw r21,0x20(r29)
lwz r21,0x18(r29)
stw r21,0x24(r29)
li r21,Bobomb
stw r21,0x8(r29)
li r3,2
branchl r12,randomI
lfs f10,rtocone(rtoc)
compareieq r3,1,LOL
fneg f10,f10
LOL:
stfs f10,0x38(r29)
mr r3,r29
branchl r12,0x80268b18
b ENDTHINK

SPAWNGREENSHELLS:
lwz r20,4(r30)
addi r21,r20,1
stw r21,4(r30)
compareine r20,60,ENDTHINK
li r20,0
stw r20,4(r30)
branchl r12,getCustomEntityStruct
mflr r29
addi r3,r29,0x14
branchl r12,0x8026cb3c
compareieq r3,0,ENDTHINK
lwz r21,0x14(r29)
stw r21,0x20(r29)
lwz r21,0x18(r29)
stw r21,0x24(r29)
li r21,Greenshell
stw r21,0x8(r29)
mr r3,r29
branchl r12,0x80268b18
b ENDTHINK

ENDTHINK:
restore
blr

END:
restore
blr
