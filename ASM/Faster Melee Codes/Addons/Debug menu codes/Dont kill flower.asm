#To be inserted at 800d3460

.include "Common/common.s"

load r20,headFlag
lwz r20,0(r20)
cmpwi r20,1
bne END
lwz r20,0x2000(r31)
li r0,0
b LOL
END:
lwz	r0, 0x1980 (r31)
LOL:
