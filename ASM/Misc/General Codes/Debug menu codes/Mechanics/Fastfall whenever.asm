#To be inserted at 8007D54C

.include "Common/common.s"

load r14,fastFallFlag
lwz r14,0(r14)
cmpwi r14,0
beq END
fcmpo cr0,f1,f0
blt END
branch r12,0x8007d5a8
END:
