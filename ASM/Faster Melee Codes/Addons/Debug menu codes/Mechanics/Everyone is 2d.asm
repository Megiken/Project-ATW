#To be inserted at 80068fe4

.include "Common/common.s"

load r14,TWODFlag
lwz r14,0(r14)
cmpwi r14,0
bne END
branch r12,0x80068fec
END:
cmpwi r0,27
