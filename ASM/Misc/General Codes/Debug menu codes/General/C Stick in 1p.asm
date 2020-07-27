#To be inserted at 8016B480

.include "Common/common.s"

load r20,CstickFlag
lwz r20,0(r20)
cmpwi r20,0
beq END
branch r12,0x8016b488
END:
