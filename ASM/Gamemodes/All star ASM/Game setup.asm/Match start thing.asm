#To be inserted at 8016e750

.include "Common/common.s"

backupall
load r20,0x804320af
load r21,0x1a000100
stw r21,0(r20)
branchl r12,compareGameCache
restoreall
lis r4,0x8017
