#To be inserted at 8032c88c

.include "Common/common.s"

backupall


mr r3,r16
branchl r12,getPlayerData
li r4,0xc
li r5,0
branchl r12,0x800bffd0


restoreall
blr
