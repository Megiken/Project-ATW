#To be inserted at 8026a8ec

.include "Common/common.s"

lwz r20,mrsaturndata(rtoc)
cmpw r20,r3
bne END
blr
END:
mflr r0
