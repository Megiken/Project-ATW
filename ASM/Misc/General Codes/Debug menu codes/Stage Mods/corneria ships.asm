#To be inserted at 801DDA48

.include "Common/common.s"

load r20,corneriaShips
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x801dce1c

END:
