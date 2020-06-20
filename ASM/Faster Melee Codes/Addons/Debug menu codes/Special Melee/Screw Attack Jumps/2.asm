#To be inserted at 800CB56C

.include "Common/common.s"

load r20,statusFlag
lwz r20,0(r20)
cmpwi r20,1
bne NOSCREW

  cmpw r3, r1
  b loc_0x2C

NOSCREW:
  cmpwi r3, 0

loc_0x2C:
