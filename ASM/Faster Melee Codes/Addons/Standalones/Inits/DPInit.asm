#To be inserted at 8032C918

.include "Common/common.s"

backup
bl THERE
.long 0x44502e64
.long 0x61740000
THERE:
mflr r22
li r20,1
li r21,8
branchl r12,goToCSS
restore
blr
