#To be inserted at 803761ec

.include "Common/common.s"

load r20,lagReduction
lwz r20,0(r20)
cmpwi r20,1
beq END
branch r12,0x80376208
END:
