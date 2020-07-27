#To be inserted at 8032C954

.include "Common/common.s"

backup
bl THERE
.long 0x494a5a2e
.long 0x64617400
THERE:
mflr r22
li r20,0
li r21,8
branchl r12,goToCSS
restore
blr
