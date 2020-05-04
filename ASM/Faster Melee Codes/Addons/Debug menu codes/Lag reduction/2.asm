#To be inserted at 80376238

.include "Common/common.s"

load r20,lagReduction
lwz r20,0(r20)
cmpwi r20,1
beq END
THERE:
branch r12,0x80376250
END:
cmpwi r0,3
beq THERE
