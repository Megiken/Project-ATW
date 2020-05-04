#To be inserted at 80165C48

.include "Common/common.s"

loc_0x0:
  mflr r0
  stw r0, 4(r1)
  stwu r1, -256(r1)
  stmw r3, 8(r1)
  mr r31, r3
  lbz r3, 4(r31)
  cmpwi r3, 0x1
  bne- loc_0x2C8
  load r20,ledgeGrabLimitFlag
  lwz r20,0(r20)
  cmpwi r20,0
  bne loc_0x2C8
  addi r30, r1, 0x80
  li r29, 0x0
  li r3, 0x0
  stw r3, 0(r30)
  stw r3, 4(r30)

loc_0x198:
  li r29, 0x0
  li r28, 0x0

loc_0x1A0:
  mulli r3, r29, 0xA8
  add r4, r3, r31
  lbz r3, 88(r4)
  cmpwi r3, 0x3
  beq- loc_0x1E0
  lbz r3, 93(r4)
  cmpwi r3, 0x0
  bne- loc_0x1E0
  mr r3, r29
  lis r12, 0x8004
  ori r12, r12, 0xAF0
  mtctr r12
  bctrl
  load r20,maxLedgeGrabs
  lwz r20,0(r20)
  cmpw r3, r20
  blt- loc_0x1E0
  addi r28, r28, 0x1

loc_0x1E0:
  addi r29, r29, 0x1
  cmpwi r29, 0x6
  blt+ loc_0x1A0
  cmpwi r28, 0x1
  bgt- loc_0x2C8
  cmpwi r28, 0x0
  beq- loc_0x2C8
  li r29, 0x0

loc_0x200:
  mulli r3, r29, 0xA8
  add r4, r3, r31
  lbz r3, 88(r4)
  cmpwi r3, 0x3
  beq- loc_0x25C
  lbz r3, 93(r4)
  cmpwi r3, 0x0
  beq- loc_0x22C
  cmpwi r3, 0x1
  beq- loc_0x22C
  b loc_0x25C

loc_0x22C:
  mr r3, r29
  lis r12, 0x8004
  ori r12, r12, 0xAF0
  mtctr r12
  bctrl
  load r20,maxLedgeGrabs
  lwz r20,0(r20)
  cmpw r3, r20
  bge- loc_0x25C
  mulli r3, r29, 0xA8
  add r4, r3, r31
  li r3, 0x0
  stb r3, 93(r4)
  stb r3, 94(r4)

loc_0x25C:
  addi r29, r29, 0x1
  cmpwi r29, 0x6
  blt+ loc_0x200
  li r29, 0x0

loc_0x26C:
  mulli r3, r29, 0xA8
  add r4, r3, r31
  lbz r3, 88(r4)
  cmpwi r3, 0x3
  beq- loc_0x2BC
  lbz r3, 93(r4)
  cmpwi r3, 0x0
  bne- loc_0x2BC
  mr r3, r29
  lis r12, 0x8004
  ori r12, r12, 0xAF0
  mtctr r12
  bctrl
  load r20,maxLedgeGrabs
  lwz r20,0(r20)
  cmpw r3, r20
  blt- loc_0x2BC
  mulli r3, r29, 0xA8
  add r4, r3, r31
  li r3, 0x1
  stb r3, 93(r4)
  stb r3, 94(r4)

loc_0x2BC:
  addi r29, r29, 0x1
  cmpwi r29, 0x6
  blt+ loc_0x26C

loc_0x2C8:
  lmw r3, 8(r1)
  lwz r0, 260(r1)
  addi r1, r1, 0x100
  mtlr r0
  lbz r0, 15(r3)
