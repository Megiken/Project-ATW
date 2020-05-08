#To be inserted at 8023caa0

.include "Common/common.s"

backupall




restoreall
branchl r12,0x80024030
