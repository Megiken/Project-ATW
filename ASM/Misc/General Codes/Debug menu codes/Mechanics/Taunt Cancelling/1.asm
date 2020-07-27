#To be inserted at 800CA4CC

.include "Common/common.s"

load r14,tauntCancel
lwz r14,0(r14)
cmpwi r14,0
bne END
cmpwi r3,0
beq LOL
branch r12,0x800ca524
END:
cmpwi r3,0
beq LOL
branch r12,0x800ca500
LOL:
