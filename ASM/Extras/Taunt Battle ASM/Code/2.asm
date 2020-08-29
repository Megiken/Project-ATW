#To be inserted at 8016C348

.include "Common/common.s"

loadwz r20,tauntPoints
mr r0,r20
lis r31, 0x803C
ori r31, r31, 0x6630
lwz r29, 0(r31)
cmpw r29, r0
bge- loc_0x34
lwz r29, 4(r31)
cmpw r29, r0
bge- loc_0x34
li r3, 0x0
b loc_0x38

loc_0x34:
li r3, 0x2

loc_0x38:
lmw r27, 36(r1)
