#To be inserted at 800998A4
.include "../../../Common/Common.s"

# Check for toggle bool
  lwz r4, 44(r3)
  lbz r4,0x618(r4)          #get player port
  subi r5,rtoc,UCFBools     #get UCF toggle bool base address
  lbzx r4,r4,r5	            #get players UCF toggle bool
  cmpwi r4,0x1
  bne loc_0xE4

loc_0x0:
  lwz r3, 44(r3)
  lfs f1, 1596(r3)
  lwz	r5, -0x514C (r13)
  lfs f0, 788(r5)
  fcmpo cr0, f1, f0
  ble- loc_0xE4
  lis r4, 0x42A0
  stw r4, -12(r1)
  lis r4, 0x3727
  stw r4, -8(r1)
  lis r4, 0x4330
  stw r4, -28(r1)
  lfs f0, 1568(r3)
  li r0, 0x0

loc_0x34:
  fabs f0, f0
  lfs f1, -12(r1)
  fmuls f0, f0, f1
  lfs f1, -8(r1)
  fsubs f0, f0, f1
  fctiwz f0, f0
  stfd f0, -20(r1)
  lwz r4, -16(r1)
  addi r4, r4, 0x2
  xoris r4, r4, 32768
  stw r4, -24(r1)
  lfd f0, -28(r1)
  lfd f1, -0x8000(r2)
  fsubs f0, f0, f1
  lfs f1, -12(r1)
  fdivs f0, f0, f1
  cmpwi r0, 0x0
  bne- loc_0x8C
  li r0, 0x1
  stfs f0, -32(r1)
  lfs f0, 1572(r3)
  b loc_0x34

loc_0x8C:
  lfs f1, -32(r1)
  fmuls f1, f1, f1
  fmuls f0, f0, f0
  fadds f0, f0, f1
  lfs f1, -30380(r2)
  fcmpo cr0, f0, f1
  cror 2, 1, 2
  bne- loc_0xE4
  lbz r4, 1648(r3)
  cmpwi r4, 0x3
  ble- loc_0xE4
  lfs f0, 44(r5)
  fneg f0, f0
  lfs f1, 1572(r3)
  fcmpo cr0, f0, f1
  bge- loc_0xE4
  lwz r3, 28(r1)
  addi r3, r3, 0x8
  lwz r31, 20(r1)
  addi r1, r1, 0x18
  mtlr r3
  blr

loc_0xE4:
  mr r3, r30
  lwz r4, 44(r3)
