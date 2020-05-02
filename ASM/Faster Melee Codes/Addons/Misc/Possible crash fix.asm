#To be inserted at 80346130
.include "Common/common.s"
lwz	r0, 0x000C (r31)
addi r14,r14,1
cmpwi r14,10000
bne END

branch r12,0x8034613c

END:
