#To be inserted at 80213C10

.include "Common/common.s"

load r20,greenGreensTree
lwz r20,0(r20)
cmpwi r20,1
bne END

blr

END:
mflr r0
