#To be inserted at 801CC8B4

.include "Common/common.s"

load r20,FODflag
lwz r20,0(r20)
cmpwi r20,0
bne END
lwz	r0, 0x0014 (r27)
END:
branch r12,0x801cc9f0
LOL:
