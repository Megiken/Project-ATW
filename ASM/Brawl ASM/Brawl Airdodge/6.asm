#To be inserted at 80099CEC

loc_0x0:
  subi r1, r1, 0x4
  mflr r0
  stw r0, 0(r1)
  addi r30, r31, 0x110
  lbz r0, 8730(r31)
  mr r3, r31
  rlwinm. r0, r0, 29, 31, 31
  beq- loc_0x34
  lis r14, 0x8007
  ori r14, r14, 0xD4E4
  mtctr r14
  bctrl
  b loc_0x50

loc_0x34:
  lfs f1, 92(r30)
  mr r3, r31
  lfs f2, 96(r30)
  lis r14, 0x8007
  ori r14, r14, 0xD494
  mtctr r14
  bctrl

loc_0x50:
  mr r3, r31
  lis r14, 0x8007
  ori r14, r14, 0xD268
  mtctr r14
  bctrl
  lwz r0, 0(r1)
  mtlr r0
  addi r1, r1, 0x4
  blr
