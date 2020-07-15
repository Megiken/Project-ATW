#To be inserted at 800957f4

.include "Common/common.s"

lwz r20,0x2c(r3)
lwz r20,0xe0(r20)
cmpwi r20,0
beq GROUND
branch r12,0x800cdda0
GROUND:
branch r12,0x800cdd14
