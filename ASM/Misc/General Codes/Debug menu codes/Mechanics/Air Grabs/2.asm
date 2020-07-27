#To be inserted at 8008CE08

.include "Common/common.s"

loc_0x0:

load r20,airGrabs
lwz r20,0(r20)
cmpwi r20,0
bne BRLR

  mr r3, r24
  subi r1, r1, 0x4
  mflr r0
  stw r0, 0(r1)
  lis r14, 0x800D
  ori r14, r14, 0x8990
  mtctr r14
  bctrl
  cmpwi r3, 0x1
  bne- loc_0x50
  lwz r15, 44(r24)
  lis r14, 0x8008
  ori r14, r14, 0xD5D4
  stw r14, 8616(r15)
  lis r14, 0x8008
  ori r14, r14, 0xD5B4
  stw r14, 8612(r15)
  lis r14, 0x800C
  ori r14, r14, 0xB2F8
  stw r14, 8608(r15)

loc_0x50:
  lwz r0, 0(r1)
  mtlr r0
  addi r1, r1, 0x4
  BRLR:
  blr
