#To be inserted at 802b7e54
.include "Common/common.s"
load r20,meleeVersion
lwz r20,0(r20)
cmpwi r20,1
bne END
branch r12,0x802b7edc
END:
lbz	r3, 0x2240 (r31)
