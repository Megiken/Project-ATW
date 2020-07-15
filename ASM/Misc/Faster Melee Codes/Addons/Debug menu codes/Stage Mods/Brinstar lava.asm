#To be inserted at 801D99E0

.include "Common/common.s"

load r20,brinstarLava
lwz r20,0(r20)
cmpwi r20,1
bne END

blr

END:
mflr r0
