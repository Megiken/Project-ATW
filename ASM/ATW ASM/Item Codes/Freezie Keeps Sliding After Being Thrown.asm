#To be inserted at 802699BC
lwz r3, 16(r31)
  cmpwi r3, 0x11
  bne- loc_0x58
  lis r3, 0x8028
  ori r3, r3, 0xEFB0
  stw r3, 3356(r31)
  lhz r3, 66(r31)
  cmpwi r3, 0x348D
  bne- loc_0x5C
  lwz r3, 1304(r31)
  cmpwi r3, 0x0
  beq- loc_0x5C
  lwz r3, 44(r3)
  lfs f10, 44(r3)
  bl loc_0x50
  mflr r3
  lfs f11, 0(r3)
  fmul f10, f11, f10
  stfs f10, 64(r31)
  b loc_0x5C

loc_0x50:
  blrl
  subis r22, r12, 13108

loc_0x58:
  stw r0, 0(r31)

loc_0x5C:
