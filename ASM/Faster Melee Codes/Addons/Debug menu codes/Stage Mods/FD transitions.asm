#To be inserted at 8021AAE4

.include "Common/common.s"

load r20,fdFlag
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x8021b2e8

END:
