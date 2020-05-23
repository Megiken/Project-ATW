#To be inserted at 80295524

.include "Common/common.s"

loc_0x0:
  mflr r0
  stw r0, 4(r1)
  stwu r1, -12(r1)
  lwz r4, 44(r3)
  cmpwi r4, 0x0
  beq- loc_0x108
  lwz r5, 1304(r4)
  cmpwi r5, 0x0
  beq- loc_0x108
  mr r7, r5
  lwz r5, 44(r5)
  cmpwi r5, 0x0
  beq- loc_0x108
  lbz r10, 15(r5)
  ori r10, r10, 0x1
  stb r10, 15(r5)
  lbz r10, 12(r5)
  mr r8, r7

loc_0x48:
  lwz r9, 20(r8)
  cmpwi r9, 0x0
  beq- loc_0x5C
  mr r8, r9
  b loc_0x48

loc_0x5C:
  cmpw r7, r8
  beq- loc_0xFC
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
beq loc_0xFC

THERE:
  lwz r9, 44(r7)
  lwz r3, 224(r5)
  cmpwi r3, 0x0
  bne- loc_0xFC
lbz r3,0xc(r5)
branchl r12,getPlayerStatic
lbz r4,0x8e(r3)
cmpwi r4,0
beq loc_0xFC
addi r3,r5,0x1838
li r4,0x38
branchl r12,0x8000c160
lwz r5,44(r8)
lwz r20,0x2c(r5)
stw r20,0x1844(r5)


mr r3, r8
mr r15,r8
  lis r12, 0x800C
  ori r12, r12, 0xD0C
  mtctr r12
  bctrl
mr r8,r15

loc_0xFC:
  lwz r8, 16(r8)
  cmpwi r8, 0x0
  bne+ loc_0x5C

loc_0x108:
  lwz r0, 16(r1)
  addi r1, r1, 0xC
  mtlr r0
  blr
