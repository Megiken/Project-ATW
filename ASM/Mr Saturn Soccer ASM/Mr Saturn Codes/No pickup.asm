#To be inserted at 800947c8

.include "Common/common.s"

lwz r20,mrsaturndata(rtoc)
cmpw r20,r3
bne END
branch r12,0x80094800
END:
branchl r12,0x8026b2b4
