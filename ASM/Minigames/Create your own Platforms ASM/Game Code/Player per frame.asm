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
lwz r20,0x10(r31)
cmpwi r20,AS_RebirthWait
ble END
cmpwi r20,322
blt GO
cmpwi r20,324
ble END
GO:
lwz r20,0x2600(r31)
cmpwi r20,2
bge END
addi r20,r20,1
stw r20,0x2600(r31)
lfs f5,0xb0(r31)
lfs f6,0xb4(r31)
loadfloat f7,r20,0x41F00000
li r3,6
li r4,7
bl PLATFORMTHINK
mflr r5
bl PLATFORMGX
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
cmpwi r20,12
bne STORE
li r20,0
STORE:
stw r20,0x18(r29)
lwz r21,-0x51ec(r13)
lwz r21,0(r21)
mulli r22,r20,0x10
add r21,r21,r22
subi r21,r21,4
stfsu f4,4(r21)
stfsu f6,4(r21)
stfsu f5,4(r21)
stfsu f6,4(r21)
lwz r21,-0x51e8(r13)
mulli r22,r20,48
addi r22,r22,8
add r21,r21,r22
subi r21,r21,4
li r0,3
mtctr r0
LOOP:
stfsu f4,4(r21)
stfsu f6,4(r21)
bdnz LOOP
li r0,3
mtctr r0
LOOPAGAIN:
stfsu f5,4(r21)
stfsu f6,4(r21)
bdnz LOOPAGAIN
addi r21,r20,1
stw r21,numOfPlatforms(rtoc)
lwz r21,-0x51e4(r13)
rlwinm	r20, r20, 3, 0, 28
add r21,r21,r20
load r20,0x00010001
stw r20,4(r21)
bl THERE

.long 0xff0000ff
.long 0x0000ffff
.long 0xFFF033ff
.long 0x00ff00ff

THERE:
mflr r20
lbz r19,0xc(r31)
mulli r19,r19,4
lwzx r20,r19,r20
stw r20,0x1c(r29)
branchl r12,0x80174338
b END

PLATFORMTHINK:
blrl
backup

mr r31,r3
lwz r30,0x2c(r31)

lwz r20,0x10(r30)
cmpwi r20,900
beq DELETE
cmpwi r20,773
blt NORMAL
lwz r21,0x1c(r30)
subi r21,r21,1
stw r21,0x1c(r30)
NORMAL:
addi r20,r20,1
stw r20,0x10(r30)
b THINKEND

DELETE:
lwz r20,0x14(r30)
lwz r21,0x2600(r20)
subi r21,r21,1
stw r21,0x2600(r20)
lwz r20,0x18(r30)
lwz r21,-0x51ec(r13)
lwz r21,0(r21)
mulli r22,r20,0x10
add r21,r21,r22
li r23,0
subi r21,r21,4
stwu r23,4(r21)
stwu r23,4(r21)
stwu r23,4(r21)
stwu r23,4(r21)
lwz r21,-0x51e8(r13)
mulli r22,r20,48
addi r22,r22,8
add r21,r21,r22
subi r21,r21,4
li r0,12
mtctr r0
LOOPLOL:
stwu r23,4(r21)
bdnz LOOPLOL
lwz r20,0x18(r30)
lwz r21,-0x51e4(r13)
rlwinm	r20, r20, 3, 0, 28
add r21,r21,r20
load r20,0x00050001
stw r20,4(r21)
branchl r12,0x8017435c

mr r3,r31
branchl r12,GObjDestroy

THINKEND:

restore
blr


PLATFORMGX:
blrl
backup
cmpwi r4,2
bne GXEND
mr r31,r3
lwz r30,0x2c(r31)

lwz    r28, -0x4044 (r13)
load  r3,0x80452C68
lwz r3,0x0(r3)
lwz r3,0x28(r3)
branchl r12,0x80368458


li r3,2
load  r4,0x00101305
li r5,0x1455
branchl r12,prim.new

lfs f0,0(r30)
lfs f1,4(r30)
lfs f2,8(r30)

lwz r20,0x1c(r30)
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

mr  r3,r28
branchl r12,0x80368458
GXEND:
restore
blr
END:
restoreall
lbz	r0, 0x221E (r31)
