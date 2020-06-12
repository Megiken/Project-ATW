#To be inserted at 8006B620

.include "Common/common.s"

load r14,autoLCancel
lwz r14,0(r14)
cmpwi r14,0
beq END
lwz	r0, 0x0668 (r31)
rlwinm.	r0, r0, 0, 0, 0
bne END
branch r12,0x8006b630
END:
