#To be inserted at 8006919C

loc_0x0:
  cmpwi r17, 0x6969
  beq- loc_0x1C
  lis r12, 0x8002
  ori r12, r12, 0x9020
  mtctr r12
  bctrl
  b loc_0x20

loc_0x1C:
  lwz r3, 2192(r30)

loc_0x20:
