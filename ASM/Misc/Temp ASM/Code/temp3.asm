#To be inserted at 8038fd54

.include "Common/common.s"

mflr r0
load r12,0x80080e18
cmpw r4,r12
bne END
nop
END:
