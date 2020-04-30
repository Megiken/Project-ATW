#To be inserted at 8006A580
  cmpwi r3, 0x1E0
  blt- loc_0xC
  li r3, 0xF0

loc_0xC:
  subi r0, r3, 0x1