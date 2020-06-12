#To be inserted at 8009B598

.include "Common/common.s"

loc_0x0:

load r20,airGrabs
lwz r20,0(r20)
cmpwi r20,0
bne loc_0x14

  lwz r14, 224(r15)
  cmpwi r14, 0x1
  bne- loc_0x14
  li r4, 0x166
  b loc_0x18

loc_0x14:
  lwz r4, 4(r4)

loc_0x18:
