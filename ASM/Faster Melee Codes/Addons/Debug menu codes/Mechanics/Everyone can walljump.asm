#To be inserted at 800816C4

.include "Common/common.s"

beq THERE
load r14,walljumpFlag
lwz r14,0(r14)
cmpwi r14,0
bne END
THERE:
branch r12,0x80081918
END:
