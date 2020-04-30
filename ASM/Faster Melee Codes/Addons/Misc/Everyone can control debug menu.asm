#To be inserted at 803039A4
loc_0x0:
  li r10, 0x0
  li r8, 0x0
  li r7, 0x8

loc_0xC:
  lis r4, 0x804C
  ori r4, r4, 0x20BC
  mulli r5, r10, 0x44
  add r9, r4, r5
  lwz r3, 8(r9)
  andi. r3, r3, 0x1F10
  or r8, r8, r3
  lwz r3, 0(r9)
  andi. r0, r3, 0x20
  beq- loc_0x38
  li r7, 0x0

loc_0x38:
  rlwinm r0, r3, 25, 3, 3
  rlwimi r0, r3, 27, 2, 2
  rlwimi r0, r3, 30, 0, 1
  or r8, r8, r0
  rlwinm r0, r3, 12, 0, 3
  or r8, r8, r0
  rlwinm. r0, r3, 8, 0, 3
  beq- loc_0x60
  li r7, 0x0
  or r8, r8, r0

loc_0x60:
  addi r10, r10, 0x1
  cmpwi r10, 0x4
  blt+ loc_0xC
  andis. r0, r8, 0xF000
  beq- loc_0x98
  lbz r3, -18516(r13)
  cmpwi r3, 0x0
  beq- loc_0x90
  subi r3, r3, 0x1
  stb r3, -18516(r13)
  rlwinm r8, r8, 0, 4, 31
  b loc_0xA0

loc_0x90:
  stb r7, -18516(r13)
  b loc_0xA0

loc_0x98:
  li r3, 0x0
  stb r3, -18516(r13)

loc_0xA0:
  mr r3, r8
  blr
