#To be inserted at 800CCAAC

.include "Common/common.s"

load r14,airGrabs
lwz r14,0(r14)
cmpwi r14,0
bne loc_0x1C

loc_0x0:
  lbz r14, 1643(r31)
  cmpwi r14, 0x8
  bne- loc_0x1C
  lis r14, 0x800D
  ori r14, r14, 0xEBD0
  mtctr r14
  bctr

loc_0x1C:
  mflr r0
