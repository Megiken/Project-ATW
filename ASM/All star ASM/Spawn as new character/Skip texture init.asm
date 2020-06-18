#To be inserted at 80068EDC

loc_0x0:
  cmpwi r17, 0x6969
  beq- loc_0x18
  lis r12, 0x8039
  ori r12, r12, 0x69C
  mtctr r12
  bctrl

loc_0x18:
