#To be inserted at 8006BB14

.include "Common/common.s"

load r14,invisCeiling
lwz r14,0(r14)
cmpwi r14,0
bne END
.long 0xD01D0004
b LOL
END:
.long 0xD01E0004
LOL:
