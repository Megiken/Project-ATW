#To be inserted at 8008f0c4

.include "Common/common.s"

lwz r20,0x2c(r3)
lwz r20,0x1868(r20)
lwz r20,0x2c(r20)
lwz r20,0x1974(r20)
lwz r20,0x2c(r20)
lwz r21,0xd4c(r20)
loadwz r23,oitcReward
add r21,r21,r23
stw r21,0xd4c(r20)
branchl r12,0x800d40b8
