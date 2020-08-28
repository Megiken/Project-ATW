#To be inserted at 8008e5a4

.include "Common/common.s"

loadwz r12,DI64Flag
compareieq r12,1,END
mflr r0
b LOL
END:
blr
LOL:
