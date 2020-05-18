#To be inserted at 80068EC4

loc_0x0:
  cmpwi r17, 0x6969
  beq- loc_0x1C
  lis r12, 0x8039
  ori r12, r12, 0x1F0
  mtctr r12
  bctrl
  b loc_0x20

loc_0x1C:
  mr r3, r16
loc_0x20:
