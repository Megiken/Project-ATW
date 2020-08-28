################################################################################
# Address: 80266be4
################################################################################\

.include "Common/Common.s"

backupall
lwz r15,thirdFileInHeap(rtoc)
branchl r12,removerestoreGCT

restoreall

li r3,6
