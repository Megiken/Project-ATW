#To be inserted at 801C0A48
loc_0x0:
  lis r15, 0x801B
  ori r15, r15, 0xFFA8
  cmpw r15, r12
  beq- loc_0xC8
  lis r14, 0x8048
  lhz r14, 1670(r14)
  lis r15, 0x8049
  ori r15, r15, 0xED70
  lwz r15, 0(r15)
  cmpwi r14, 0x1F
  bne- loc_0x44
  lis r16, 0xC242
  lis r17, 0x4242
  lis r18, 0x4230
  li r19, 0x0
  stwu r16, 1432(r15)
  b loc_0x6C

loc_0x44:
  cmpwi r14, 0x1C
  bne- loc_0x88
  lis r16, 0xC23A
  ori r16, r16, 0x6666
  lis r17, 0x423D
  ori r17, r17, 0x8E70
  lis r18, 0x4214
  li r19, 0x0
  stwu r16, 2132(r15)
  b loc_0x6C

loc_0x6C:
  stw r18, 4(r15)
  stwu r17, 64(r15)
  stw r18, 4(r15)
  stwu r17, 64(r15)
  stw r19, 4(r15)
  stwu r16, 64(r15)
  stw r19, 4(r15)

loc_0x88:
  cmpwi r14, 0x20
  bne- loc_0xA0
  li r16, 0x41
  stbu r16, 1616(r15)
  li r16, 0xC1
  stb r16, 64(r15)

loc_0xA0:
  cmpwi r14, 0x8
  bne- loc_0xC8
  lis r16, 0x4270
  lis r17, 0xC270
  li r18, 0x0
  addi r15, r15, 0x4748
  stwu r16, 18248(r15)
  stw r18, 4(r15)
  stwu r17, 64(r15)
  stw r18, 4(r15)

loc_0xC8:
  mtlr r12
