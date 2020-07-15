#To be inserted at 801d5290

.include "Common/common.s"

load r20,kongoJungleBarrel
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x801d5340

END:
