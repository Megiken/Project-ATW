#To be inserted at 8032C920

.include "Common/common.s"

backup
bl THERE
.long 0x53532e64
.long 0x61740000
THERE:
li r20,0
li r21,3
mflr r22
branchl r12,goToCSS
restore
blr