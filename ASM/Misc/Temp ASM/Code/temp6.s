#To be inserted at 80015184

.include "Common/common.s"

backup
bl THERE
.long 0
THERE:
mflr r14
lwz r14,0(r14)

restore
cmpwi r14,0
beq END

blr
END:
mflr r0
