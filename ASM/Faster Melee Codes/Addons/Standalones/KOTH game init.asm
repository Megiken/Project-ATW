#To be inserted at 8032C910

.include "Common/common.s"

backup
li r20,0
li r21,3
branchl r12,goToCSS
cmpwi r14,0
beq END

bl THERE
.long 0x4b54482e
.long 0x64617400
THERE:
cmpwi r14,2
beq END
mflr r20
lwz r21,newHeapStart(rtoc)
branchl r12,loadbackupstoreGCT




END:
restore
blr
