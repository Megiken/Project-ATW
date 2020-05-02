#To be inserted at 801B15E4

loc_0x0:
  addi r30, r3, 0x0
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r28, r5
  lis r5, 0x8046
  ori r5, r5, 0xB108
  li r4, 0x0

loc_0x24:
  lwz r3, 0(r5)
  rlwinm. r0, r3, 0, 6, 6
  beq- loc_0x40
  rlwinm. r0, r3, 0, 7, 7
  beq- loc_0x40
  li r4, 0x2
  b loc_0x94

loc_0x40:
  rlwinm. r0, r3, 0, 5, 5
  beq- loc_0x80
  lis r14, 0x8025
  ori r14, r14, 0x99EC
  mtctr r14
  bctrl
  lis r4, 0x803F
  ori r4, r4, 0x6D0
  mulli r3, r3, 0x1C
  add r4, r4, r3
  lbz r3, 11(r4)
  lis r4, 0x8045
  ori r4, r4, 0xAC64
  sth r3, 2(r4)
  li r4, 0x2
  b loc_0x94

loc_0x80:
  addi r4, r4, 0x1
  addi r5, r5, 0xC
  cmpwi r4, 0x4
  blt+ loc_0x24
  li r4, 0x0

loc_0x94:
  mr r3, r30
  mr r5, r28
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
