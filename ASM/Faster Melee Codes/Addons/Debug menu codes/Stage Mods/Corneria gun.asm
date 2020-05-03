#To be inserted at 801E1390

.include "Common/common.s"

load r20,corneriaGun
lwz r20,0(r20)
cmpwi r20,0
bne DEFAULT
cmpwi r0,0
blt END
branch r12,0x801e17c0
DEFAULT:
cmpwi r0,0
blt END
branch r12,0x801e13a8


END:
