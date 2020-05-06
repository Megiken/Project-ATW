#To be inserted at 801E1390

.include "Common/common.s"

load r20,corneriaGun
lwz r20,0(r20)
cmpwi r20,0
beq DEFAULT
cmpwi r0,0
blt END
branch r12,0x801e17c0
DEFAULT:
cmpwi r0,0
bge THERE
b END
THERE:
branch r12,0x801e13a8


END:
