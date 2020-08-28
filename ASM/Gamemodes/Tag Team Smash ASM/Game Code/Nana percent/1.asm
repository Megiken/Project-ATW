#To be inserted at 802F65CC

.include "Common/common.s"

loadwz r20,showNanaPercent
compareieq r20,1,loc_0x2C


li r0, 0x80
b loc_0x30

loc_0x2C:
lbz r0, 3(r29)

loc_0x30:
