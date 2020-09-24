#To be inserted at 8023C718
loc_0x0:
  mulli r6, r3, 0x3
  add r6, r6, r30
  lbz r0, 1(r6)
  cmpwi r0, 0x0
  mr r0, r3
  beq- loc_0x1C
  addi r0, r3, 0x1

loc_0x1C:
