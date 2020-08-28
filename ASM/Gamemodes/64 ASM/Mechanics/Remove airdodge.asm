#To be inserted at 80099A58

.include "Common/common.s"

loadwz r12,airdodge64Flag
compareieq r12,0,END 
li r3,0
blr
b LOL
END:
mflr r0
LOL:
