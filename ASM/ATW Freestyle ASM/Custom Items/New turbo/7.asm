#To be inserted at 80068684

.include "Common/common.s"

lbz r21, 12(r31)
branchl r14,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,1
bne- loc_0x28
li r0, -1
sth r0, 8848(r6)
li r0, 0x0
stb r0, 8850(r6)
li r0, 0x28
stb r0, 8851(r6)

loc_0x28:
lbz r3, 12(r31)
