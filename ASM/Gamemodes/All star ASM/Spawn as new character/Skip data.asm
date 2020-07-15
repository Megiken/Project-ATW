#To be inserted at 80068EE8

loc_0x0:
  cmpwi r17, 0x6969
  beq- loc_0x1C
  lis r12, 0x8037
  ori r12, r12, 0xABC8
  mtctr r12
  bctrl
  b loc_0x20

loc_0x1C:
  lwz r3, 44(r31)
loc_0x20:
