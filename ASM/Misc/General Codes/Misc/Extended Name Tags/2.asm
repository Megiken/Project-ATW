#To be inserted at 8023C270
loc_0x0:
  lbz r6, 0(r3)
  cmpwi r6, 0x0
  beq- loc_0x10
  addi r3, r3, 0x1

loc_0x10:
  stb r0, 0(r3)
