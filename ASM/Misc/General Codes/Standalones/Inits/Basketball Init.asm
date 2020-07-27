#To be inserted at 8032C97c

.include "Common/common.s"

backup
bl THERE
.long 0x42422e64
.long 0x61740000
THERE:
mflr r22
li r20,0
li r21,8
branchl r12,goToCSS
restore
blr
