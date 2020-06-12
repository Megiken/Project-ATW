#To be inserted at 800DA380

.include "Common/common.s"

loc_0x0:

load r20,airGrabs
lwz r20,0(r20)
cmpwi r20,0
bne loc_0x54

  cmpwi r3, 0x0
  beq- loc_0x54
  lwz r14, 224(r31)
  cmpwi r14, 0x1
  bne- loc_0x54
  lbz r14, 7(r31)
  cmpwi r14, 0x4
  bne- loc_0x3C
  lwz r14, 16(r31)
  cmpwi r14, 0xDD
  beq- loc_0x54
  cmpwi r14, 0xDC
  beq- loc_0x54
  cmpwi r14, 0xDB
  beq- loc_0x54

loc_0x3C:
  lis r14, 0x800D
  ori r14, r14, 0xA418
  stw r14, 8616(r31)
  lis r14, 0x8012
  ori r14, r14, 0xDC50
  stw r14, 8612(r31)

loc_0x54:
  cmpwi r3, 0x0
