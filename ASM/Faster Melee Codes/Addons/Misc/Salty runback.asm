#To be inserted at 801A5B14

loc_0x0:
  li r3, 0x4
  lis r12, 0x801A
  ori r12, r12, 0x3680
  mtctr r12
  bctrl
  rlwinm. r0, r4, 0, 23, 23
  beq- loc_0x70
  rlwinm. r0, r4, 0, 22, 22
  bne- loc_0x30
  rlwinm. r0, r4, 0, 21, 21
  bne- loc_0x38
  b loc_0x70

loc_0x30:
  li r27, 0x2
  b loc_0x74

loc_0x38:
  lis r12, 0x8025
  ori r12, r12, 0x99EC
  mtctr r12
  bctrl
  lis r4, 0x803F
  ori r4, r4, 0x6D0
  mulli r3, r3, 0x1C
  add r4, r4, r3
  lbz r3, 11(r4)
  lis r4, 0x8045
  ori r4, r4, 0xAC64
  sth r3, 2(r4)
  li r27, 0x2
  b loc_0x74

loc_0x70:
  li r27, 0x0

loc_0x74:
  li r29, 0x0
