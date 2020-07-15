#To be inserted at 800DED18

.include "Common/common.s"



  lis r12, 0x8008
  ori r12, r12, 0xA2BC
  mtctr r12
  bctrl
  load r12,tauntToGainItem
  lwz r12,0(r12)
  cmpwi r12,0
  bne END
  stwu r1, -256(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  lwz r30, 44(r31)
  lwz r3, 6516(r30)
  cmpwi r3, 0x0
  bne- loc_0x310
  lwz r3, 268(r30)
  lwz r3, 8(r3)
  lbz r3, 16(r3)
  lwz r4, 1512(r30)
  addi r5, r1, 0x48
  rlwinm r0, r3, 4, 0, 27
  lwzx r3, r4, r0
  li r4, 0x0
  lis r12, 0x8000
  ori r12, r12, 0xB1CC
  mtctr r12
  bctrl
  li r3, 0x23
  lis r12, 0x8038
  ori r12, r12, 0x580
  mtctr r12
  bctrl
  mr r6, r3
  lfs f1, 44(r30)
  mr r3, r31
  addi r4, r1, 0x48
  lwz r5, 268(r30)
  lwz r5, 8(r5)
  lbz r5, 16(r5)
  bl loc_0x1C0
  mr r29, r3
  mr r28, r4
  mr r3, r29
  lis r12, 0x8026
  ori r12, r12, 0xB30C
  mtctr r12
  bctrl
  cmpwi r3, 0x5
  beq- loc_0x134
  cmpwi r3, 0x4
  beq- loc_0x150
  cmpwi r3, 0x1
  beq- loc_0x168
  cmpwi r28, 0x5
  beq- loc_0x168
  b loc_0x1BC

loc_0x134:
  mr r3, r31
  mr r4, r29
  lis r12, 0x8009
  ori r12, r12, 0x447C
  mtctr r12
  bctrl
  b loc_0x1BC

loc_0x150:
  lwz r3, 44(r29)
  li r4, 0x0
  stw r4, 6516(r30)
  stw r4, 1304(r3)
  stw r4, 1316(r3)
  b loc_0x1BC

loc_0x168:
  lwz r6, 268(r30)
  lwz r6, 8(r6)
  lbz r6, 17(r6)
  mr r3, r29
  lwz r4, 44(r29)
  lwz r4, 196(r4)
  lwz r4, 16(r4)
  lwz r4, 8(r4)
  mr r5, r31
  lis r12, 0x8027
  ori r12, r12, 0x4F48
  mtctr r12
  bctrl
  mr r3, r31
  li r4, 0x5D
  li r5, 0x0
  lis r12, 0x8009
  ori r12, r12, 0x4694
  mtctr r12
  bctrl
  b loc_0x1BC

loc_0x1BC:
  b loc_0x310

loc_0x1C0:
  mflr r0
  stw r0, 4(r1)
  stwu r1, -144(r1)
  stmw r25, 116(r1)
  mr r31, r6
  addi r29, r3, 0x0
  li r28, 0x0
  li r6, 0x1
  mr r30, r5
  stw r31, 44(r1)
  lwz r3, 0(r4)
  lwz r0, 4(r4)
  stw r3, 68(r1)
  addi r3, r1, 0x24
  stw r0, 72(r1)
  lwz r0, 8(r4)
  stw r0, 76(r1)
  lwz r4, 68(r1)
  lwz r0, 72(r1)
  lfs f0, -10460(r2)
  stw r4, 56(r1)
  stw r0, 60(r1)
  lwz r0, 76(r1)
  stw r0, 64(r1)
  stfs f1, 92(r1)
  sth r28, 96(r1)
  stfs f0, 88(r1)
  stfs f0, 84(r1)
  stfs f0, 80(r1)
  stw r29, 36(r1)
  lwz r0, 36(r1)
  stw r0, 40(r1)
  lbz r0, 104(r1)
  rlwimi r0, r6, 7, 24, 24
  stb r0, 104(r1)
  stw r28, 100(r1)
  lis r12, 0x8026
  ori r12, r12, 0x8B18
  mtctr r12
  bctrl
  mr r27, r3
  lwz r26, 44(r27)
  lwz r4, 196(r26)
  mr r3, r27
  lwz r25, 4(r4)
  lfs f1, 0(r25)
  lis r12, 0x8027
  ori r12, r12, 0x5158
  mtctr r12
  bctrl
  lwz r3, 44(r29)
  stw r27, 6516(r3)
  lwz r3, 44(r29)
  lwz r3, 4(r3)
  lis r4, 0x803C
  ori r4, r4, 0x188C
  rlwinm r3, r3, 2, 0, 29
  add r3, r4, r3
  lwz r12, 0(r3)
  cmpwi r12, 0x0
  beq- loc_0x2D8
  mtlr r12
  mr r3, r29
  li r4, 0x1
  blrl
  mr r3, r29
  lis r12, 0x8007
  ori r12, r12, 0x4A8C
  mtctr r12
  bctrl

loc_0x2D8:
  addi r3, r27, 0x0
  addi r4, r29, 0x0
  addi r5, r30, 0x0
  lis r12, 0x8026
  ori r12, r12, 0xAB54
  mtctr r12
  bctrl
  mr r3, r27
  mr r4, r31
  lmw r25, 116(r1)
  lwz r0, 148(r1)
  addi r1, r1, 0x90
  mtlr r0
  blr

loc_0x310:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x100
END:
