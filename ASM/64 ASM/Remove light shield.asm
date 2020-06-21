#To be inserted at 8006afe4

.include "Common/common.s"

bne THERE
b END
THERE:
bl LOL
.float 1
LOL:
mflr r20
lwz r20,0(r20)
stw r20,0x650(r31)
branch r12,0x8006aff0
END:
