#To be inserted at 800343B4
  cmpwi r0, 0x60
  bne- loc_0x30
  lis r20, 0x8046
  ori r20, r20, 0xB6A0
  lhz r20, 9430(r20)
  cmpwi r20, 0xE
  bne- loc_0x30
  cmpwi r30, 0x0
  bne- loc_0x30
  li r30, 0x32
  sthx r30, r29, r0
  b loc_0x34

loc_0x30:
  sthx r30, r29, r0

loc_0x34:
