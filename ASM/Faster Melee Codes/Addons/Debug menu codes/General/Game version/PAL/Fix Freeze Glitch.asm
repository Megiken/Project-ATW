#To be inserted at 801239a8
.include "Common/common.s"

load r20,meleeVersion
lwz r20,0(r20)
cmpwi r20,1
beq END
stw	r0, 0x1A5C (r31)
END:
