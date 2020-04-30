#To be inserted at 8028FD7C

.include "Common/common.s"

load r20,stageData
lwz r20,0x88(r20)
cmpwi r20,0xA
beq END

lwz r20,0xdd4(r31)
cmpwi r20,0x17
beq LIGHTNINGBOLT
cmpwi r20,0x16
beq SCREWATTACK
b END



SCREWATTACK:

backup

lwz r20,0x2c(r29)
lbz r20,0xc(r20)

branchl r12,getATWstats
mflr r21
li r23,1
addi r21,r21,Stats_screwattackPickup
stbx r23,r20,r21


branchl r12,getItemVars
mflr r21
addi r21,r21,36
li r22,1
stbx r22,r21,r20
addi r21,r21,4
mulli r20,r20,2
lhzx r22,r20,r21
addi r22,r22,600
sthx r22,r20,r21

restore

blr


LIGHTNINGBOLT:
  mflr r0
  stw r0, -4(r1)
  stwu r1, -60(r1)
  stmw r20, 8(r1)
  lwz r4, 44(r3)
  cmpwi r4, 0x0
  beq- loc_0xA8
  lwz r5, 1304(r4)
  cmpwi r5, 0x0
  beq- loc_0xA8
  mr r7, r5
  lwz r5, 44(r5)
  cmpwi r5, 0x0
  beq- loc_0xA8
  lbz r10, 15(r5)
  ori r10, r10, 0x1
  stb r10, 15(r5)
  lbz r10, 12(r5)

  branchl r12,getATWstats
  mflr r21
  li r23,1
  addi r21,r21,Stats_lightningboltPickup
  stbx r23,r10,r21


  mr r8, r7

loc_0x4C:
  lwz r9, 20(r8)
  cmpwi r9, 0x0
  beq- loc_0x60
  mr r8, r9
  b loc_0x4C

loc_0x60:
  cmpw r7, r8
  beq- loc_0x9C
  lwz r5, 44(r8)

lwz r20,4(r5)
cmpwi r20,0xb
beq HERE
cmpwi r20,0xa
bne THERE
HERE:
lbz r20,0xc(r5)
lwz r21,0x2c(r7)
lbz r21,0xc(r21)
cmpw r21,r20
beq loc_0x9C

THERE:

  lwz r9, 44(r7)
lwz r21,0x2c(r8)
lwz r20,0x1988(r21)
cmpwi r20,0
bne loc_0x9C
lwz r20,0x198c(r21)
cmpwi r20,0
bne loc_0x9C
lwz r20,0x1990(r21)
cmpwi r20,0
bne loc_0x9C

SHRINK:
  lwz r3, 224(r5)
  cmpwi r3, 0x0
  mr r30, r7
  mr r31, r8
  mr r3, r8
  lis r12, 0x800D
  ori r12, r12, 0x1E84
  mtctr r12
  bctrl
  mr r8, r31
  mr r7, r30

loc_0x9C:
  lwz r8, 16(r8)
  cmpwi r8, 0x0
  bne+ loc_0x60

loc_0xA8:
  lmw r20, 8(r1)
  addi r1, r1, 0x3C
  lwz r0, -4(r1)
  mtlr r0
  blr
END:
