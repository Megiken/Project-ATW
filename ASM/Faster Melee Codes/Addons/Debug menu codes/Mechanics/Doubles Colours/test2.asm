#To be inserted at 8026196c

.include "Common/common.s"

load r14,doublesColours
lwz r14,0(r14)
cmpwi r14,1
bne END
cmplwi	r0, 0
beq END
branch r12,0x8026198c
END:
