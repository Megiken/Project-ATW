#To be inserted at 8025bb44

.include "Common/common.s"

lbz r15,0x9(r4)
branchl r12,getCustomStageByte
sth r15,0x1e(r3)
