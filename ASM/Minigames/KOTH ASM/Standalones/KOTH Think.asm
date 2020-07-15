#To be inserted at 8032C8Ac

.include "Common/common.s"

backupall

bl DATA
mflr r15
cmpwi r14,0x6969
bne NORMAL
li r14,150
stw r14,0(r15)
li r14,0
stw r14,4(r15)
stw r14,0xc(r15)
li r14,-1
stw r14,8(r15)

restoreall
blr
NORMAL:
lwz r20,0(r15)
subi r20,r20,1
stw r20,0(r15)
cmpwi r20,0
bne NONEW

#Create hill

branchl r12,getKOTHdata
mflr r16

LOOP:

lwz r3,0x50(r16)
branchl r12,randomI
lwz r20,8(r15)
cmpw r20,r3
beq LOOP
stw r3,8(r15)
mulli r3,r3,0x10
addi r3,r3,0x10
add r17,r16,r3

lwz r20,0(r17)
stw r20,0(r16)
lwz r20,4(r17)
stw r20,4(r16)
lwz r20,8(r17)
stw r20,8(r16)
lwz r20,0xc(r17)
stw r20,0xc(r16)

lwz r3,0xc(r15)
cmpwi r3,0
beq SKIP
branchl r12,DestroyItem
SKIP:

bl ITEMSTRUCT
mflr r14
li r20,0
stw r20,0(r14)
stw r20,4(r14)
li r21,0x12
stw r21,8(r14)

lfs f6,0(r16)
lfs f7,4(r16)
li r22,2
branchl r12,Int2Float
fsubs f7,f7,f6
fdiv f7,f7,f8
fadd f6,f7,f6
lfs f7,0xc(r16)

stfs f6,0x14(r14)
stfs f7,0x18(r14)
stfs f6,0x20(r14)
stfs f7,0x24(r14)
stw r20,0x1c(r14)
stw r20,0x28(r14)
stw r20,0x2c(r14)
stw r20,0x30(r14)
stw r20,0x34(r14)
stw r20,0x38(r14)
li r20,1
sth r20,60(r14)
mr r3,r14
branchl r12,EntityItemSpawn
stw r3,0xc(r15)
lwz r5,0x2c(r3)
mr r29, r3
  lbz r3, 3536(r5)
  li r4, 0x1
  rlwimi r3, r4, 4, 27, 27
  stb r3, 3536(r5)
  lbz r3, 3531(r5)
  li r4, 0x0
  rlwimi r3, r4, 3, 28, 28
  stb r3, 3531(r5)
  li r3, 0x0
  lis r12, 0x8002
  ori r12, r12, 0x9044
  mtctr r12
  bctrl
  lwz r4, 44(r29)
  stw r3, 1312(r4)
  lbz r0, 3533(r4)
  li r5, 0x22
  rlwimi r0, r5, 5, 24, 25
  stb r0, 3533(r4)
  lwz r4, -18808(r13)
  lfs f0, 332(r4)
  stfs f0, 64(r3)
  lfs f0, 336(r4)
  stfs f0, 68(r3)
  lfs f0, 340(r4)
  stfs f0, 72(r3)
  lfs f0, 344(r4)
  stfs f0, 76(r3)

li r3,0xdf
li r4,0xfe
li r5,0x80
li r7,7
branchl r12,playsfx
load r20,KOTHhillTime
lwz r20,0(r20)
mulli r20,r20,60
stw r20,0(r15)

NONEW:
lwz r3, 0xc(r15)
cmpwi r3,0
beq SKIPTHING
lwz r5,0x2c(r3)
  lbz r3, 3530(r5)
  li r4, 0x0
  rlwimi r3, r4, 2, 29, 29
  stb r3, 3530(r5)
SKIPTHING:
restoreall

blr



DATA:
blrl
.long 150 #hill timer
.long 0
.long -1 #prev hill ID
.long 0 #prev item

ITEMSTRUCT:
blrl
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
