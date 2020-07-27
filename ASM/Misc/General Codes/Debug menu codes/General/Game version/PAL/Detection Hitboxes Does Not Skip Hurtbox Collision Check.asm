#To be inserted at 800796e0
.include "Common/common.s"

load r12,meleeVersion
lwz r12,0(r12)
cmpwi r12,1
beq END
li	r18, 1
END:
li r12,0
