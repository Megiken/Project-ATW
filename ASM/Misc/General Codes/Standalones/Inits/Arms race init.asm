#To be inserted at 8032C924

.include "Common/common.s"

backup
bl THERE
.long 0x41532e64
.long 0x61740000
THERE:
mflr r22
li r20,1
li r21,4
branchl r12,goToCSS
branchl r12,getASdata
mflr r21
li r20,5
sth r20,0(r21)
restore
blr
