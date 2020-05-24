#To be inserted at 8032C914

.include "Common/common.s"

backup
li r20,1
li r21,1
branchl r12,goToCSS

cmpwi r14,0
beq ENDLOL
branchl r12,getCharData
mflr r20
load r21,0x01010101
stw r21,0(r20)
addi r3,r20,4
li r4,108
branchl r12,zeromem

load r20,ATWsubmenu
li r21,1
stw r21,0x120(r20)
bl THERE
.long 0x52657375
.long 0x6d650000
THERE:
mflr r21
stw r21,0x128(r20)

bl THER
.long 0x4154572e
.long 0x64617400
THER:
cmpwi r14,2
beq ENDLOL
mflr r20
lwz r21,newHeapStart(rtoc)
branchl r12,loadbackupstoreGCT

ENDLOL:
restore

END:

blr
