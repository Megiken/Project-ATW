#To be inserted at 8025b8bc

.include "Common/Common.s"

backupall
lwz r15,thirdFileInHeap(rtoc)
branchl r12,removerestoreGCT

restoreall


li r3,6
