#To be inserted at 801E3348

.include "Common/common.s"

load r20,yoshisFlag
lwz r20,0(r20)
cmpwi r20,0
bne END
branchl r12,0x801E3418

END:
