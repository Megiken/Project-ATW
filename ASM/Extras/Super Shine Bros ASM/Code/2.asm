#To be inserted at 802604E8

loc_0x0:
  subi r1, r1, 0x4
  mflr r0
  stw r0, 0(r1)
  lis r4, 0x804C
  ori r4, r4, 0x20BC
  lbz r5, 4(r31)
  mulli r5, r5, 0x44
  add r4, r4, r5
  lbz r5, 4(r31)
  subi r6, r2, 0xDC8
  lbzx r7, r6, r5
  lwz r3, 8(r4)
  rlwinm. r0, r3, 0, 30, 30
  bne- loc_0x44
  rlwinm. r0, r3, 0, 31, 31
  bne- loc_0x58
  b loc_0x84

loc_0x44:
  addi r7, r7, 0x1
  cmpwi r7, 0x2
  ble- loc_0x6C
  li r7, 0x0
  b loc_0x6C

loc_0x58:
  subi r7, r7, 0x1
  cmpwi r7, 0x0
  bge- loc_0x6C
  li r7, 0x2
  b loc_0x6C

loc_0x6C:
  stbx r7, r6, r5
  li r3, 0x2
  lis r14, 0x8002
  ori r14, r14, 0x4030
  mtctr r14
  bctrl

loc_0x84:
  lbz r5, 4(r31)
  subi r3, r13, 0x4FA0
  mulli r6, r5, 0x4
  lwzx r3, r3, r6
  subi r6, r2, 0xDC8
  lbzx r6, r6, r5
  cmpwi r6, 0x0
  beq- loc_0xB4
  cmpwi r6, 0x1
  beq- loc_0xBC
  cmpwi r6, 0x2
  beq- loc_0xC4

loc_0xB4:
  bl loc_0xCC
  b loc_0xF0

loc_0xBC:
  bl loc_0xD8
  b loc_0xF0

loc_0xC4:
  bl loc_0xE4
  b loc_0xF0

loc_0xCC:
  blrl
  .long 0x4f666600
  .long 0x00000000

loc_0xD8:
  blrl
  .long 0x466f7800
  .long 0x00000000

loc_0xE4:
  blrl
  .long 0x46616c63
  .long 0x6F000000

loc_0xF0:
  mflr r5
  li r4, 0x1
  lis r14, 0x803A
  ori r14, r14, 0x70A0
  mtctr r14
  bctrl
  lwz r0, 0(r1)
  mtlr r0
  addi r1, r1, 0x4
  lbz r4, 4(r31)
