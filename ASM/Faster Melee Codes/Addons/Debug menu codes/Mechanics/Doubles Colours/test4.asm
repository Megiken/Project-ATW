#To be inserted at 8025edc4

.include "Common/common.s"

load r14,doublesColours
lwz r14,0(r14)
cmpwi r14,0
bne END
cmplwi	r0, 0
beq END
branch r12,0x8025edd4
END:
