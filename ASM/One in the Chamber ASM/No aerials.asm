#To be inserted at 8008cda8

.include "Common/common.s"

mr r3,r30
branchl r12,0x800cdda0
cmpwi r3,0
beq NEXT
branch r12,0x8008cdf4
NEXT:
mr r3,r31
branchl r12,0x8008ce68
