#To be inserted at 8026a8ec

.include "Common/common.s"

lwz r20,mrsaturndata(rtoc)
cmpw r20,r3
bne END
cmpwi r18,0x6969
beq END
blr
END:
mflr r0
