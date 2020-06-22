#To be inserted at 80079820

.include "Common/common.s"

lwz r4, 44(r26)
lwz r4, 1304(r4)
cmpwi r4,0
beq loc_0x38
lwz r4, 44(r4)
lbz r21, 12(r4)
branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,1
bne- loc_0x38
lbz r4, 66(r23)
rlwinm. r4, r4, 29, 31, 31
bne- loc_0x38
lwz r4, 44(r26)
lwz r4, 1304(r4)
lwz r4, 44(r4)
li r5, 0x0
stb r5, 8851(r4)
lwz r5, 16(r4)
sth r5, 8848(r4)

loc_0x38:
rlwinm. r0, r3, 27, 31, 31
