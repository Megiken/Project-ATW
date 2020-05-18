#To be inserted at 8032C924

.include "Common/common.s"

backup
li r20,1
li r21,8
branchl r12,goToCSS
cmpwi r14,1
bne END

bl THERE
.long 0x41522e64
.long 0x61740000
THERE:

mflr r20
lwz r21,newHeapStart(rtoc)
branchl r12,loadbackupstoreGCT




END:
restore
blr
