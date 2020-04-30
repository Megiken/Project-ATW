#To be inserted at 8023C5A0
loc_0x0:
  rlwinm. r0, r3, 0, 21, 21
  beq- loc_0x6C
  lbz r5, 80(r28)
  cmplwi r5, 2
  bne- loc_0x6C
  lis r5, 0x804D
  ori r5, r5, 0x4D90
  li r6, 0x0
  cmpwi r6, 0xB4
  bgt- loc_0x5C
  lbzx r7, r6, r5
  cmpwi r7, 0x41
  blt- loc_0x54
  cmpwi r7, 0x7A
  bgt- loc_0x54
  cmpwi r7, 0x61
  blt- loc_0x4C
  subi r7, r7, 0x20
  b loc_0x50

loc_0x4C:
  addi r7, r7, 0x20

loc_0x50:
  stbx r7, r6, r5

loc_0x54:
  addi r6, r6, 0x4
  b 0xFC8

loc_0x5C:
  lis r12, 0x8023
  ori r12, r12, 0xC7EC
  mtctr r12
  bctr 

loc_0x6C:
  rlwinm. r0, r3, 0, 22, 22
