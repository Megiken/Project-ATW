#To be inserted at 8007fb3c

.include "Common/common.s"

load r20,headFlag
lwz r20,0(r20)
cmpwi r20,2
beq END
branchl r12,0x8026abd8
END:
