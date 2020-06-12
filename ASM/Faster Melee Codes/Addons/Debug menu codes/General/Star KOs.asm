#To be inserted at 800d3258

.include "Common/common.s"

load r20,starKOFlag
lwz r20,0(r20)
cmpwi r20,0
beq END
cmpwi r3,0
bne END 
branch r12,0x800d3268

END:
