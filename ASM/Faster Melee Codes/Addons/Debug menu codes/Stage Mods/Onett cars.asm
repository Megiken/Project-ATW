#To be inserted at 801e379c

.include "Common/common.s"

load r20,onettCars
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x801e37f4

END:
