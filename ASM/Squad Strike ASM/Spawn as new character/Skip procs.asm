#To be inserted at 800691C0

loc_0x0:
  cmpwi r17, 0x6969
  beq- loc_0x1C
  lis r12, 0x8038
  ori r12, r12, 0xFD54
  mtctr r12
  bctrl
  b loc_0x2C

loc_0x1C:
  lis r12, 0x8006
  ori r12, r12, 0x92DC
  mtctr r12
  bctrl

loc_0x2C:
