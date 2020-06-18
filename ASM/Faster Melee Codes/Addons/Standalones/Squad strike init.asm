#To be inserted at 8032C920

.include "Common/common.s"

backup
li r20,0
li r21,5
branchl r12,goToCSS
cmpwi r14,0
beq END

bl THERE
.long 0x53532e64
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
