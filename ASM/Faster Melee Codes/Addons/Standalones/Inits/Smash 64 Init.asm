#To be inserted at 8032C93c

.include "Common/common.s"

backup
li r20,0
li r21,7
branchl r12,goToCSS
cmpwi r14,0
beq END

bl THERE
.long 0x5336342e
.long 0x64617400
THERE:
cmpwi r14,2
beq END
mflr r20
lwz r21,secondFileInHeap(rtoc)
branchl r12,loadbackupstoreGCT




END:
restore
blr
