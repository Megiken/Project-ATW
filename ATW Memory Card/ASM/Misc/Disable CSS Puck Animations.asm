#To be inserted at 803641D4

.include "Common/memcard.s"

mflr r10
load r12,0x80363128
cmpw r12,r10
bne END
lhz r10,4(r4)
li r12,0x6969
cmpw r10,r12
bne END
branch r12,0x80364324


END:
stw r0,0(r31)
