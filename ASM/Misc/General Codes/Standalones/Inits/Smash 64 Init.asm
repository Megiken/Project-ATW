#To be inserted at 8032C93c

.include "Common/common.s"

backup
bl THERE
.long 0x5336342e
.long 0x64617400
THERE:
mflr r22
li r20,0
li r21,6
branchl r12,goToCSS
restore
blr
