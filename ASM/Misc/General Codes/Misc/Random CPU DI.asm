#To be inserted at 8008e5c4

.include "Common/common.s"

mr r31,r3
backupall
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r4,8(r3)
compareine r4,1,END

li r3,4
branchl r12,randomI
bl NUMS
.long 127
.long 50
.long -50
.long -127
.long 127
.long 0
.long -127
NUMS:
mflr r20
mulli r3,r3,4
lwzx r21,r3,r20
stb r21,0x1A8C(r31)
li r3,3
branchl r12,randomI
mulli r3,r3,4
lwzx r21,r3,r20
stb r21,0x1a8d(r31)
mr r3,r31
branchl r12,0x800a17e4
stfs	f1, 0x0620 (r31)
mr r3,r31
branchl r12,0x800a1874
stfs	f1, 0x0624 (r31)

END:
restoreall
