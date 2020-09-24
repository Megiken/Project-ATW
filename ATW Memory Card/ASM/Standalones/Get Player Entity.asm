#To be inserted at 8032C86c

.include "Common/common.s"

#input r3 = player slot
#output r3 = offset

li r4,0xe90
mullw r4,r4,r3
lis r5,0x8045
ori r5,r5,0x3080
add r3,r4,r5
lwz r3,0xb0(r3)
blr
