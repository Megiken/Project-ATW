#To be inserted at 8032C8d0

.include "Common/common.s"

backup
bl THER
.long 0x494d2e64
.long 0x61740000
THER:
mflr r22
li r20,1
li r21,2

branchl r12,goToCSS
cmpwi r14,0
beq END
li r17,2
stw r17,IMtype(rtoc)
branchl r12,IMinit
restore
blr
