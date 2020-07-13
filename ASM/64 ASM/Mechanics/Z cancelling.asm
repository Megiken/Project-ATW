#To be inserted at 8008d708

.include "Common/common.s"

lwz r20,0x2c(r3)
li r21,7
lbz r22,0x067F(r20)
cmpw r22,r21
bge FAILED
li r4,0x2a
li r5,1
li r6,0
lfs	f1, -0x6A00 (rtoc)
lfs	f2, -0x69FC (rtoc)
branch r12,0x800d5aec
FAILED:
mflr r0
