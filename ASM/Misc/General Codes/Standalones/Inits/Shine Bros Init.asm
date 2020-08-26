#To be inserted at 8032C98c

.include "Common/common.s"

backup
bl THERE
.long 0x5353422e
.long 0x64617400
THERE:
mflr r22
li r20,0
li r21,10
branchl r12,goToCSS
restore
blr
