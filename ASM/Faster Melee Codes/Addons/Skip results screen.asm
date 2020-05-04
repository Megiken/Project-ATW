#To be inserted at 801A5B00

.include "Common/common.s"

load r20,idleScreenFlag
lwz r20,0(r20)
cmpwi r20,0
beq LOL
addi r27,r4,0
b END
LOL:
.long 0x3B600000
END:
