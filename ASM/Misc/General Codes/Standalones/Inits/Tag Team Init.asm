#To be inserted at 8032C984

.include "Common/common.s"

backup
bl THERE
.long 0x54542e64
.long 0x61740000
THERE:
mflr r22
li r20,0
li r21,7
branchl r12,goToCSS
restore
blr