#To be inserted at 8032C8b0

.include "Common/common.s"

backupall


addi r4,r20,4

branchl r12, getKOTHdata
mflr r16
addi r3,r16,0x10
lwz r5,0(r20)
stw r5,0x50(r16)
mulli r5,r5,0x10
branchl r12,copymem


restoreall

blr
