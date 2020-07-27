#To be inserted at 8032C980

.include "Common/common.s"

backup
bl THERE
.long 0x4354462e
.long 0x64617400
THERE:
mflr r22
li r20,0
li r21,8
branchl r12,goToCSS
restore
blr
