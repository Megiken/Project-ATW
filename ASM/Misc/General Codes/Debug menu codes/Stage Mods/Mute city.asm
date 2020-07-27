#To be inserted at 801f0188

.include "Common/common.s"

load r20,muteCityCars
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x801f1a34

END:
