#To be inserted at 800CA4CC

.include "Common/common.s"

cmpwi r3,0
beq LOL
branch r12,0x800ca524
LOL:
