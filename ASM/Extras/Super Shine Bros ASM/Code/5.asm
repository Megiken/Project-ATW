#To be inserted at 8019AF4C

loc_0x0:
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r31, r3
  lwz r30, 44(r31)
  lfs f1, -26424(r2)
  bl loc_0x12C
  li r3, 0x0
  stw r3, 996(r30)
  mr r3, r31
  lis r14, 0x8006
  ori r14, r14, 0xEBA4
  mtctr r14
  bctrl
  lis r3, 0x800E
  ori r3, r3, 0x845C
  stw r3, 8636(r30)
  li r0, 0x0
  stb r0, 1284(r31)
  mr r3, r31
  li r4, 0x1
  lis r14, 0x8007
  ori r14, r14, 0xB760
  mtctr r14
  bctrl
  b loc_0x96C

loc_0x6C:
  blrl
  .long 0xAC018000
  .long 0xD0000003
  .long 0x28000000
  .long 0x03FA0000
  .long 0x00000000
  .long 0x00000000
  .long 0x00000000
  .long 0x28000000
  .long 0x03F30000
  .long 0x000006A4
  .long 0x00000320
  .long 0x03200320
  .long 0x2C001808
  .long 0x06000000
  .long 0x00000000
  .long 0x2A0C8012
  .long 0x37080123
  .long 0x44000000
  .long 0x000000DB
  .long 0x00007F40
  .long 0x08000002
  .long 0x40000000
  .long 0x00000000

loc_0xCC:
  blrl
    .long 0xAC018000
    .long 0xD0000003
    .long 0x28000000
    .long 0x03FA0000
    .long 0x00000000
    .long 0x00000000
    .long 0x00000000
    .long 0x28000000
    .long 0x03F30000
    .long 0x000006A4
    .long 0x00000320
    .long 0x03200320
    .long 0x2C001805
    .long 0x08000000
    .long 0x00000000
    .long 0x00190A12
    .long 0x00080123
    .long 0x44000000
    .long 0x000000DB
    .long 0x00007F40
    .long 0x08000002
    .long 0x40000000
    .long 0x00000000

loc_0x12C:
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r31, r3
  lwz r30, 44(r31)
  lwz r29, 224(r30)
  lfs f2, -26420(r2)
  lfs f3, -26424(r2)
  mr r3, r31
  cmpwi r29, 0x0
  beq- loc_0x164
  li r4, 0xA4
  b loc_0x168

loc_0x164:
  li r4, 0xA0

loc_0x168:
  li r5, 0x2
  li r6, 0x0
  lis r14, 0x8006
  ori r14, r14, 0x93AC
  mtctr r14
  bctrl
  lbz r3, 12(r30)
  subi r4, r2, 0xDC8
  lbzx r3, r3, r4
  cmpwi r3, 0x1
  beq- loc_0x19C
  cmpwi r3, 0x2
  beq- loc_0x1A4

loc_0x19C:
  bl loc_0xCC
  b loc_0x1AC

loc_0x1A4:
  bl loc_0x6C
  b loc_0x1AC

loc_0x1AC:
  mflr r3
  stw r3, 1004(r30)
  li r3, 0x1
  stw r3, 1428(r30)
  mr r3, r31
  bl loc_0x1D8
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x1D8:
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r31, r3
  lwz r30, 44(r31)
  lwz r29, 224(r30)
  cmpwi r29, 0x0
  beq- loc_0x20C
  bl loc_0x35C
  mflr r3
  stw r3, 8604(r30)
  b loc_0x21C

loc_0x20C:
  bl loc_0x2DC
  mflr r3
  stw r3, 8604(r30)
  b loc_0x21C

loc_0x21C:
  bl loc_0x604
  mflr r3
  stw r3, 8608(r30)
  b loc_0x22C

loc_0x22C:
  bl loc_0x3C0
  mflr r3
  stw r3, 8612(r30)
  b loc_0x23C

loc_0x23C:
  cmpwi r29, 0x0
  beq- loc_0x254
  bl loc_0x564
  mflr r3
  stw r3, 8616(r30)
  b loc_0x264

loc_0x254:
  bl loc_0x4E0
  mflr r3
  stw r3, 8616(r30)
  b loc_0x264

loc_0x264:
  lis r3, 0x8007
  ori r3, r3, 0x61C8
  stw r3, 8620(r30)
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  lwz r3, 44(r3)
  lwz r4, 224(r3)
  cmpwi r4, 0x0
  beq- loc_0x2AC
  li r5, 0x9C
  b loc_0x2B4

loc_0x2AC:
  li r5, 0x98
  b loc_0x2B4

loc_0x2B4:
  mr r4, r3
  lis r14, 0x8008
  ori r14, r14, 0x5CD8
  mtctr r14
  bctrl
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x2DC:
  blrl
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  lwz r31, 44(r3)
  mr r30, r3
  mr r3, r30
  bl loc_0x65C
  lwz r3, 2196(r31)
  lis r4, 0x4080
  cmpw r3, r4
  blt- loc_0x32C
  mr r3, r30
  lis r14, 0x800C
  ori r14, r14, 0xAED0
  mtctr r14
  bctrl
  cmpwi r3, 0x0
  bne- loc_0x348

loc_0x32C:
  mr r3, r30
  lis r14, 0x8009
  ori r14, r14, 0x9F1C
  mtctr r14
  bctrl
  cmpwi r3, 0x0
  bne- loc_0x348

loc_0x348:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x35C:
  blrl
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  lwz r31, 44(r3)
  mr r30, r3
  mr r3, r30
  bl loc_0x65C
  lwz r3, 2196(r31)
  lis r4, 0x4080
  cmpw r3, r4
  blt- loc_0x3AC
  mr r3, r30
  lis r14, 0x800C
  ori r14, r14, 0xB870
  mtctr r14
  bctrl
  cmpwi r3, 0x0
  bne- loc_0x3AC

loc_0x3AC:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x3C0:
  blrl
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r30, r3
  lwz r31, 44(r30)
  lwz r14, 2196(r31)
  lis r15, 0x3F80
  cmpw r14, r15
  beq- loc_0x3FC
  lis r15, 0x4040
  cmpw r14, r15
  bge- loc_0x440
  b loc_0x42C

loc_0x3FC:
  lfs f1, -26424(r2)
  stfs f1, 132(r31)
  lfs f2, 128(r31)
  lis r14, 0x4000
  ori r14, r14, 0x0
  stw r14, -4(r1)
  lfs f0, -4(r1)
  fdivs f0, f2, f0
  stfs f0, 128(r31)
  li r14, 0x4
  stw r14, 9036(r31)
  b loc_0x42C

loc_0x42C:
  lis r14, 0x800E
  ori r14, r14, 0x8884
  mtctr r14
  bctrl
  b loc_0x4CC

loc_0x440:
  lwz r3, 224(r31)
  cmpwi r3, 0x1
  beq- loc_0x464
  mr r3, r30
  lis r14, 0x800E
  ori r14, r14, 0x8C34
  mtctr r14
  bctrl
  b loc_0x4CC

loc_0x464:
  lwz r3, 2196(r31)
  lis r4, 0x4040
  cmpw r3, r4
  beq- loc_0x4A0
  lis r3, 0x3CDA
  ori r3, r3, 0x740E
  stw r3, 0(r2)
  addi r5, r31, 0x110
  lfs f1, 0(r2)
  lfs f2, 96(r5)
  mr r3, r31
  lis r12, 0x8007
  ori r12, r12, 0xD494
  mtctr r12
  bctrl

loc_0x4A0:
  mr r3, r31
  lis r12, 0x8007
  ori r12, r12, 0xCF58
  mtctr r12
  bctrl
  mr r3, r30
  lis r12, 0x8007
  ori r12, r12, 0xAEF8
  mtctr r12
  bctrl
  b loc_0x4CC

loc_0x4CC:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x4E0:
  blrl
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r31, r3
  lwz r30, 44(r31)
  mr r3, r31
  lis r14, 0x8008
  ori r14, r14, 0x2708
  mtctr r14
  bctrl
  cmpwi r3, 0x0
  bne- loc_0x550
  mr r3, r30
  lis r14, 0x8007
  ori r14, r14, 0xD5D4
  mtctr r14
  bctrl
  mr r3, r31
  lfs f1, 2196(r30)
  bl loc_0x12C
  mr r3, r31
  lfs f1, 2196(r30)
  lis r14, 0x8007
  ori r14, r14, 0x3354
  mtctr r14
  bctrl

loc_0x550:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x564:
  blrl
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r31, r3
  lwz r30, 44(r31)
  mr r3, r31
  lis r14, 0x8008
  ori r14, r14, 0x1D0C
  mtctr r14
  bctrl
  cmpwi r3, 0x0
  beq- loc_0x5F0
  mr r3, r30
  lis r14, 0x8007
  ori r14, r14, 0xD7FC
  mtctr r14
  bctrl
  mr r3, r31
  lfs f1, 2196(r30)
  bl loc_0x12C
  mr r3, r31
  lfs f1, 2196(r30)
  lis r14, 0x8007
  ori r14, r14, 0x3354
  mtctr r14
  bctrl
  lwz r3, 2196(r30)
  lis r4, 0x4190
  cmpw r3, r4
  bge- loc_0x5F0
  lis r3, 0x800E
  ori r3, r3, 0x83E0
  stw r3, 8636(r30)

loc_0x5F0:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x604:
  blrl
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r31, r3
  lis r14, 0x8006
  ori r14, r14, 0xF238
  mtctr r14
  bctrl
  cmpwi r3, 0x1
  beq- loc_0x648
  mr r3, r31
  lis r14, 0x8007
  ori r14, r14, 0xD92C
  mtctr r14
  bctrl

loc_0x648:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x65C:
  stwu r1, -68(r1)
  stmw r20, 8(r1)
  mflr r0
  stw r0, 64(r1)
  mr r30, r3
  lwz r31, 44(r3)
  lis r15, 0x4190
  cmpw r14, r15
  blt- loc_0x684
  b loc_0x710

loc_0x684:
  lis r14, 0x800C
  ori r14, r14, 0x97A8
  mtctr r14
  bctrl
  cmpwi r3, 0x0
  beq- loc_0x6D0
  lfs f13, 44(r31)
  fneg f13, f13
  stfs f13, 44(r31)
  lfs f1, 2196(r31)
  mr r3, r30
  bl loc_0x12C
  mr r3, r30
  lfs f1, 2196(r31)
  lis r14, 0x8007
  ori r14, r14, 0x3354
  mtctr r14
  bctrl
  b loc_0x6D0

loc_0x6D0:
  lwz r14, 2196(r31)
  lis r15, 0x4080
  cmpw r14, r15
  bne- loc_0x710
  mr r3, r30
  lis r14, 0x8005
  ori r14, r14, 0xB880
  mtctr r14
  bctrl
  lbz r0, 8729(r31)
  li r3, 0x0
  rlwimi r0, r3, 0, 24, 24
  stb r0, 8729(r31)
  lis r3, 0x800E
  ori r3, r3, 0x83E0
  stw r3, 8636(r31)

loc_0x710:
  lwz r14, 2196(r31)
  lis r15, 0x40A0
  cmpw r14, r15
  bne- loc_0x758
  lwz r14, 1628(r31)
  rlwinm. r14, r14, 0, 22, 22
  beq- loc_0x758
  lfs f1, 2196(r31)
  lfs f2, -26420(r2)
  fsub f1, f1, f2
  mr r3, r30
  bl loc_0x12C
  mr r3, r30
  lfs f1, 2196(r31)
  lis r14, 0x8007
  ori r14, r14, 0x3354
  mtctr r14
  bctrl

loc_0x758:
  lwz r14, 2196(r31)
  lis r15, 0x4190
  cmpw r14, r15
  bgt- loc_0x7B4
  lis r0, 0xC200
  stw r0, 1212(r31)
  stw r0, 1216(r31)
  stw r0, 1220(r31)
  li r0, 0x0
  stw r0, 1208(r31)
  stw r0, 1224(r31)
  stw r0, 1228(r31)
  stw r0, 1232(r31)
  lis r0, 0xC280
  stw r0, 1236(r31)
  lbz r0, 1284(r31)
  cmpwi r0, 0x0
  beq- loc_0x7A8
  li r0, 0x0
  b loc_0x7AC

loc_0x7A8:
  li r0, 0x91

loc_0x7AC:
  stb r0, 1284(r31)
  mr r3, r30

loc_0x7B4:
  lwz r14, 2196(r31)
  lis r15, 0x4190
  cmpw r14, r15
  blt- loc_0x7D0
  cmpw r14, r15
  beq- loc_0x824
  b loc_0x950

loc_0x7D0:
  mflr r14
  bl loc_0x84C
  mflr r4
  bl loc_0x874
  mflr r5
  mtlr r14
  lwz r14, 4(r31)
  mulli r14, r14, 0x8
  add r5, r5, r14
  lwz r14, 0(r5)
  stw r14, 12(r4)
  lwz r14, 4(r5)
  stw r14, 20(r4)
  mr r3, r30
  lis r5, 0x8006
  ori r5, r5, 0xDA48
  lis r14, 0x8007
  ori r14, r14, 0xB23C
  mtctr r14
  bctrl
  b loc_0x950

loc_0x824:
  li r14, 0x0
  stb r14, 8728(r31)
  stb r14, 1284(r31)
  stw r14, 8636(r31)
  mr r3, r30
  lis r14, 0x8007
  ori r14, r14, 0xDB24
  mtctr r14
  bctrl
  b loc_0x950

loc_0x84C:
  blrl
  .long 0x00000000
  .long 0x00000032
  .long 0x00000000
  .long 0x40D00000
  .long 0x00000000
  .long 0x41080000
  .long 0x3FC00000
  .long 0x3F800000
  .long 0x00000000

loc_0x874:
  blrl

  .long 0x40D00000
  .long 0x40F00000
  .long 0x40D00000
  .long 0x41080000
  .long 0x41100000
  .long 0x41100000
  .long 0x41000000
  .long 0x41500000
  .long 0x40D00000
  .long 0x41100000
  .long 0x41480000
  .long 0x41B00000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x40E00000
  .long 0x40B00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40B00000
  .long 0x41080000
  .long 0x40B00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41180000
  .long 0x40E00000
  .long 0x41200000
  .long 0x40D00000
  .long 0x41100000
  .long 0x40D00000
  .long 0x41200000
  .long 0x40D00000
  .long 0x40D00000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41700000
  .long 0x40D00000
  .long 0x41080000
  .long 0x40D00000
  .long 0x41100000
  .long 0x40D00000
  .long 0x41080000

loc_0x950:
  mr r3, r30
  mr r4, r31
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr

loc_0x96C:
  lwz r0, 64(r1)
  mtlr r0
  lmw r20, 8(r1)
  addi r1, r1, 0x44
  blr
