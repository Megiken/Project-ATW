#To be inserted at 8006CA9C

.include "Common/common.s"

backupall
lbz r3,0xc(r31)
branchl r12,getPlayerInstantInputs
andi. r4,r4,0x1000
cmpwi r4,0x1000
bne END
cmpwi r4,0x1160
beq END
lwz r20,0x2600(r31)
cmpwi r20,2
bge END
addi r20,r20,1
stw r20,0x2600(r31)
lfs f5,0xb0(r31)
lfs f6,0xb4(r31)
loadfloat f7,r20,0x41200000
li r3,6
li r4,7
li r5,0
bl PLATFORMTHINK
mflr r6
li r7,0x20
branchl r12,createCustomGObj
mr r29,r4
fsubs f4,f5,f7
stfs f4,0(r29)
fadd f5,f5,f7
stfs f5,4(r29)
stfs f6,8(r29)
lbz r3,0xc(r31)
stw r3,0xc(r29)
stw r31,0x14(r29)
lwz r20,numOfPlatforms(rtoc)
stw r20,0x18(r29)
load r21,stageData
lwz r21,0x6ac(r21)
lwz r21,0(r21)
mulli r22,r20,0x10
add r21,r21,r22
subi r21,r21,4
stfsu f4,4(r21)
stfsu f6,4(r21)
stfsu f5,4(r21)
stfsu f6,4(r21)


addi r20,r20,1
stw r20,numOfPlatforms(rtoc)

b END

DUMMYTHINK:
blrl
blr

PLATFORMTHINK:
blrl
backup
cmpwi r29,2
bne THINKEND
mr r31,r3
lwz r30,0x2c(r31)
lwz r20,0x10(r30)
cmpwi r20,900
beq DELETE
addi r20,r20,1
stw r20,0x10(r30)

li r3,2
load  r4,0x00301306
li r5,0x1455
branchl r12,prim.new

lfs f0,0(r30)
lfs f1,4(r30)
lfs f2,8(r30)

bl THERE

.long 0xff0000ff
.long 0x0000ffff
.long 0xffff00ff
.long 0x00ff00ff

THERE:
mflr r20
lwz r21,0xc(r30)
mulli r21,r21,4
lwzx r20,r20,r21
li r21,0
subi r3,r3,4
stfsu f0,4(r3)
stfsu f2,4(r3)
stwu r21,4(r3)
stwu r20,4(r3)
stfsu f1,4(r3)
stfsu f2,4(r3)
stwu r21,4(r3)
stwu r20,4(r3)

branchl r12,prim.close
b THINKEND

DELETE:
mr r3,r31
branchl r12,GObjDestroy
lwz r20,0x14(r30)
lwz r21,0x2600(r20)
subi r21,r21,1
stw r21,0x2600(r20)
lwz r20,numOfPlatforms(rtoc)
load r21,stageData
lwz r21,0x6ac(r21)
lwz r21,0(r21)
mulli r22,r20,0x10
add r21,r21,r22
li r22,0
subi r21,r21,4
stwu r22,4(r21)
stwu r22,4(r21)
stwu r22,4(r21)
stwu r22,4(r21)
subi r20,r20,1
stw r20,numOfPlatforms(rtoc)
b THINKEND


THINKEND:
restore
blr
END:
restoreall
lbz	r0, 0x221E (r31)
