#To be inserted at 8032C918

.include "Common/common.s"

backup
li r20,1
li r21,2
branchl r12,goToCSS
cmpwi r14,0
beq END
bl THERE
.long 0x44502e64
.long 0x61740000
THERE:
cmpwi r14,2
beq END
mflr r20
lwz r21,secondFileInHeap(rtoc)
branchl r12,loadbackupstoreGCT

END:
restore
blr