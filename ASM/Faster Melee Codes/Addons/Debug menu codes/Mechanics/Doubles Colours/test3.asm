#To be inserted at 80261980

.include "Common/common.s"

load r14,doublesColours
lwz r14,0(r14)
cmpwi r14,0
bne END
cmplwi	r0, 3
bne END
branch r12,0x8026198c
END:
