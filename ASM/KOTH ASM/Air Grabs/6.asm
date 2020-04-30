#To be inserted at 800DA2E0

.include "Common/common.s"

loc_0x0:

load r20,KOTHairGrabs
lwz r20,0(r20)
cmpwi r20,0
bne loc_0x18

  lwz r14, 224(r31)
  cmpwi r14, 0x1
  bne- loc_0x18
  lis r14, 0x8012
  ori r14, r14, 0xDC50
  stw r14, 8612(r31)

loc_0x18:
  lis r3, 0x800E
