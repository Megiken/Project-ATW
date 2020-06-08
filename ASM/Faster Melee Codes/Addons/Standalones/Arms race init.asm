#To be inserted at 8032C924

.include "Common/common.s"

backup
li r20,1
li r21,6
branchl r12,goToCSS
cmpwi r14,0
beq END

bl THERE
.long 0x41522e64
.long 0x61740000
THERE:
cmpwi r14,2
beq END
mflr r20
lwz r21,newHeapStart(rtoc)
branchl r12,loadbackupstoreGCT




END:
restore
blr
