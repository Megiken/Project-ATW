#To be inserted at 8032C924

.include "Common/common.s"

backup
bl THERE
.long 0x53594e2e
.long 0x64617400
THERE:
mflr r22
li r20,1
li r21,5
branchl r12,goToCSS
li r20,0
stw r20,SynData(rtoc)
restore
blr
