#To be inserted at 8006919C

.include "Common/common.s"

loc_0x0:
  cmpwi r17, 0x6969
  beq- loc_0x1C
THERE:
  lis r12, 0x8002
  ori r12, r12, 0x9020
  mtctr r12
  bctrl
  b loc_0x20

loc_0x1C:
  mr r3,r18
  branchl r12,0x800290d4
  b THERE

loc_0x20:
