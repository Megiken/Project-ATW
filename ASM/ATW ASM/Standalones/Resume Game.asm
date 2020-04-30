#To be inserted at 8032c850

.include "Common/common.s"

cmpwi r3,1
bne END
mflr r0
li r4,0x6969
li r17,0x6969
cmpwi r3,1
branch r12,0x801b0a00
END:
blr
