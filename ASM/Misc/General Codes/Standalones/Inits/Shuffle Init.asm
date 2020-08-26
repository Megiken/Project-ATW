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
addi r20,r20,20
rlwinm.	r4, r20, 0, 27, 31
sub r4,r20,r4
li r21,-1
stw r21,0(r4)
stw r4,thirdFileInHeap(rtoc)
END:
restore
blr
