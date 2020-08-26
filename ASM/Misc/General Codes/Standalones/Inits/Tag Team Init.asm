#To be inserted at 8032C984

.include "Common/common.s"

backup
bl THERE
.long 0x54542e64
.long 0x61740000
THERE:
mflr r22
li r20,1
li r21,4
branchl r12,goToCSS

cmpwi r14,0
beq END

branchl r12,IMgetFirst
mflr r23
branchl r12,IMhardClearStruct

branchl r12,IMgetSecond
mflr r23
branchl r12,IMhardClearStruct

li r20,0
stw r20,IMcount(rtoc)
END:
restore
blr
