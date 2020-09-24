#To be inserted at 800D2FE4

.include "Common/memcard.s"

backupall
mr r3,r4
li r4,25
branchl r12,0x8006cf5c
restoreall
