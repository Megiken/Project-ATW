#To be inserted at 8006CA9C

.include "Common/common.s"

backupall
lwz r3,0(r31)
branchl r12,0x8007b7a4
restoreall
lbz	r0, 0x221E (r31)
