#To be inserted at 8032C96c

.include "Common/common.s"

backup
bl THERE
.long 0x434d2e64
.long 0x61740000
THERE:
mflr r22
li r20,0
li r21,10
branchl r12,goToCSS
restore
blr
