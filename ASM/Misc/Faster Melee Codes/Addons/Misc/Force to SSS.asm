#To be inserted at 80263064

loc_0x0:
  mflr r0
  stw r0, 4(r1)
  stwu r1, -256(r1)
  stmw r20, 8(r1)
  mr r31, r4
  lis r12, 0x8015
  ori r12, r12, 0xCC34
  mtctr r12
  bctrl
  lbz r4, 2(r3)
  cmpwi r4, 0x0
  bne- loc_0x44
  lbz r4, 3(r3)
  cmpwi r4, 0x0
  bne- loc_0x44
  cmpwi r31, 0x1
  b loc_0x48

loc_0x44:
  cmpwi r31, 0x2

loc_0x48:
  lmw r20, 8(r1)
  lwz r0, 260(r1)
  addi r1, r1, 0x100
  mtlr r0
