#To be inserted at 802652EC

loc_0x0:
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  li r3, 0x0
  li r4, 0x0
  lis r14, 0x803A
  ori r14, r14, 0x6754
  mtctr r14
  bctrl
  mr r31, r3
  bl loc_0x110
  mflr r30
  xoris r3, r29, 32768
  lis r4, 0x4330
  stw r4, -8(r1)
  stw r3, -4(r1)
  lfd f1, -8(r1)
  lfd f2, -0x7f60(r2)
  fsubs f1, f1, f2
  lfs f2, 12(r30)
  fmuls f1, f1, f2
  lfs f2, 0(r30)
  fadds f1, f1, f2
  lfs f2, 4(r30)
  mr r3, r31
  bl loc_0x12C
  mflr r4
  lis r14, 0x803A
  ori r14, r14, 0x6B98
  mtctr r14
  bctrl
  bl loc_0x110
  mflr r30
  xoris r3, r29, 32768
  lis r4, 0x4330
  stw r4, -8(r1)
  stw r3, -4(r1)
  lfd f1, -8(r1)
  lfd f2, -0x7f60(r2)
  fsubs f1, f1, f2
  lfs f2, 12(r30)
  fmuls f1, f1, f2
  lfs f2, 16(r30)
  fadds f1, f1, f2
  lfs f2, 20(r30)
  mr r3, r31
  bl loc_0x138
  mflr r4
  lis r14, 0x803A
  ori r14, r14, 0x6B98
  mtctr r14
  bctrl
  lwz r3, 92(r31)
  lis r4, 0xFFFF
  ori r4, r4, 0xFF0E
  stw r4, 6(r3)
  li r4, 0x1
  stb r4, 73(r31)
  li r4, 0x1
  stb r4, 77(r31)
  lfs f1, 8(r30)
  stfs f1, 36(r31)
  stfs f1, 40(r31)
  subi r3, r13, 0x4FA0
  mulli r4, r29, 0x4
  stwx r31, r3, r4
  b loc_0x144

loc_0x110:
  blrl
  .long 0xC3FA0000
  .long 0x43EA0000
  .long 0x3D3851EC
  .long 0x43AC8000
  .long 0xC3EB0000
  .long 0x43FA0000

loc_0x12C:
  blrl
  .long 0x5368696E
  .long 0x653A0000

loc_0x138:
  blrl
  .long 0x4F666620
  .long 0x20000000

loc_0x144:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  li r3, 0x0
