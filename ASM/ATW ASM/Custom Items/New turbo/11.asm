#To be inserted at 80076DC8

.include "Common/common.s"

lbz r21, 12(r31)
branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,1
 bne- loc_0x20
 li r14, 0x0
 stb r14, 8851(r29)
 lwz r14, 16(r29)
 sth r14, 8848(r29)

loc_0x20:
 stw r3, 6564(r31)
