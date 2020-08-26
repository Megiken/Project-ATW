#To be inserted at 8032C990

.include "Common/common.s"

backup
bl THERE
.long 0x53464c2e
.long 0x64617400
THERE:
mflr r22
li r20,0
li r21,9
branchl r12,goToCSS
compareieq r14,0,END
bl THER
.long 0x53464c2e
.long 0x64617400
THER:
mflr r3
branchl r12,0x800163d8
lwz r20,secondFileInHeap(rtoc)
add r20,r20,r3
stw r20,thirdFileInHeap(rtoc)
END:
restore
blr
