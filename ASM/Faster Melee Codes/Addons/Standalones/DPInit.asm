#To be inserted at 8032C918

.include "Common/common.s"

backup
li r20,1
li r21,2
branchl r12,goToCSS
cmpwi r14,1
bne END
bl THERE
.long 0x44502e64
.long 0x61740000
THERE:

mflr r20
lwz r21,newHeapStart(rtoc)
branchl r12,loadbackupstoreGCT

END:
restore
blr
