#To be inserted at 802146EC

.include "Common/common.s"

load r20,greenGreensBlocks
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x80214b58

END:
