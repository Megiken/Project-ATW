#To be inserted at 8032C940

.include "Common/common.s"

backup
bl THERE
.long 0x42524c2e
.long 0x64617400
THERE:
mflr r22
li r20,0
li r21,7
branchl r12,goToCSS

restore
blr
