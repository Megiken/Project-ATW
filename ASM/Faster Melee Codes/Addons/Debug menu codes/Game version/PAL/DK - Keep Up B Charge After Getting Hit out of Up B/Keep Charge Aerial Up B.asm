#To be inserted at 8010fc48
.include "Common/common.s"

load r20,meleeVersion
lwz r20,0(r20)
cmpwi r20,1
beq END
stw	r0, 0x21DC (r5)
END:
