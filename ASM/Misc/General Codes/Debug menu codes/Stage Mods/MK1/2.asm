#To be inserted at 801fab7c

.include "Common/common.s"

load r20,mushroomKingdom1Blocks
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x801fb3f0

END:
