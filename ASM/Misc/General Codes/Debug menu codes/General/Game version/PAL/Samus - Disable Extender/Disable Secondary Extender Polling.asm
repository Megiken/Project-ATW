#To be inserted at 802b808c
.include "Common/common.s"

load r20,meleeVersion
lwz r20,0(r20)
cmpwi r20,1
bne END

branch r12,0x802b8110

END:
cmpwi	r3, 2
