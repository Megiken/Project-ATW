#To be inserted at 8032C914

.include "Common/common.s"

cmpwi r3,1
bne END

lwz r20,gameID(rtoc)
cmpwi r20,0
beq END

backup

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
li r3,1
branchl r12,goToCSSClearChars


restore

END:

blr
