#To be inserted at 8002f474

.include "Common/common.s"

load r20,cameraFlag
lwz r20,0(r20)
cmpwi r20,1
bne END
branch r12,0x8002f8f4
END:
lis	r3, 0x8045
