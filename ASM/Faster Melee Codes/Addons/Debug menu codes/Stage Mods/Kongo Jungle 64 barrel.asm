#To be inserted at 8020f4c0

.include "Common/common.s"

load r20,kongoJungle64Barrel
lwz r20,0(r20)
cmpwi r20,0
bne END

branchl r12,0x8020f52c

END:
