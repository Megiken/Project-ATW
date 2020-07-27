#To be inserted at 80202b7c

.include "Common/common.s"

load r20,jungleJapesFlag
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x801c49f8

END:
