#To be inserted at 800C1444

.include "Common/common.s"

load r20,invincAfterBury
lwz r20,0(r20)
cmpwi r20,1
beq END
branchl r12,0x8007b7a4
END:
