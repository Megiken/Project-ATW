#To be inserted at 801a584c

.include "Common/common.s"

addi	r29, r4, 0

load r20,gameSpeedMult
lwz r20,0(r20)
stw r20,0x3c(r29)
