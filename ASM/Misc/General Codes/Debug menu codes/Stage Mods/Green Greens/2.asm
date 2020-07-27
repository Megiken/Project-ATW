#To be inserted at 80216B24

.include "Common/common.s"

load r20,greenGreensBlocks
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x80215ed8

END:
