#To be inserted at 8023C710
loc_0x0:
  cmplwi r3, 3
  blt- loc_0x20
  mulli r6, r3, 0x3
  add r6, r6, r30
  lbz r0, 1(r6)
  cmpwi r0, 0x0
  bne- loc_0x20
  li r3, 0x2

loc_0x20:
  cmplwi r3, 3
