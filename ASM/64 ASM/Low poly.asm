#To be inserted at 800748DC

loc_0x0:
  subi r17, r6, 0x5EC
  lbz r14, 7(r17)
  cmpwi r14, 0x9
  beq- loc_0x1C
  cmpwi r14, 0x17
  beq- loc_0x30
  b loc_0x2C

loc_0x1C:
  lbz r14, 1561(r17)
  cmpwi r14, 0x1
  bne- loc_0x2C
  b loc_0x30

loc_0x2C:
  li r4, 0x0

loc_0x30:
  mr r15, r4
  lwzx r14, r31, r15
  addi r15, r15, 0x4
  lwzx r16, r31, r15
  cmpw r14, r16
  beq- loc_0x68
  mr r15, r4
  lwzx r14, r31, r15
  addi r15, r15, 0xC
  stwx r14, r31, r15
  subi r15, r15, 0x8
  lwzx r14, r31, r15
  subi r15, r15, 0x4
  stwx r14, r31, r15

loc_0x68:
  lwzx r0, r31, r4
