#To be inserted at 802705A8

.include "Common/common.s"
backup
lbz r21, 12(r28)
branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,1
bne- loc_0x20
li r14, 0x0
stb r14, 8851(r28)
lwz r14, 16(r28)
sth r14, 8848(r28)

loc_0x20:
restore
stw r21, 6420(r28)
