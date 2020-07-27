#To be inserted at 800DEE70

.include "Common/common.s"

load r14,tauntCancel
lwz r14,0(r14)
cmpwi r14,0
bne END
branchl r12,0x80084280
b LOL
END:
branchl r12,0x80084104
LOL:
