#To be inserted at 800816C4

.include "Common/common.s"

load r14,walljumpFlag
lwz r14,0(r14)
cmpwi r14,0
bne END
lbz	r0, 0x2224 (r31)
rlwinm.	r0, r0, 0, 31, 31
bne END
branch r12,0x80081918
END:
