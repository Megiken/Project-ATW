#To be inserted at 80268b58

.include "Common/common.s"

backupall
branchl r12,getCustomEntityStruct
mflr r3
li r4,0x40
branchl r12,zeromem
restoreall
blr
