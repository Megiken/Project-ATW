#To be inserted at 80260700

.include "Common/common.s"

backupallnomflr
lwz r15,thirdFileInHeap(rtoc)
branchl r12,removerestoreGCT
restoreallnomtlr
stb	r0, -0x49AA (r13)
