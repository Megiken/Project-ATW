#To be inserted at 8032C968

.include "Common/common.s"

backup
bl THERE
.long 0x4359502e
.long 0x64617400
THERE:
mflr r22
li r20,0
li r21,8
branchl r12,goToCSS
restore
blr
