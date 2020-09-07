#To be inserted at 8032C95c

.include "Common/common.s"

backup

branchl r12,getCustomEntityStruct
mflr r3
lis r4,0x4100
stw r4,0x18(r3)
stw r4,0x24(r3)
li r4,MrSaturn
stw r4,8(r3)
cmpwi r11,0
blt GO
beq PLUS
load r4,0xC3510000
stw r4,0x14(r3)
stw r4,0x20(r3)
b GO
PLUS:
load r4,0xC2EE7E14
stw r4,0x14(r3)
stw r4,0x20(r3)
GO:
branchl r12,EntityItemSpawn
stw r3,mrsaturndata(rtoc)
lwz r20,0x2c(r3)
li r3,27
stw r3,0xc9c(r20)
lbz r3, 3536(r20)
li r4, 0x1
rlwimi r3, r4, 4, 27, 27
stb r3, 3536(r20)
lbz r3, 3531(r20)
li r4, 0x0
rlwimi r3, r4, 3, 28, 28
stb r3, 3531(r20)
li r3, 0x0
lis r12, 0x8002
ori r12, r12, 0x9044
mtctr r12
bctrl
stw r3, 1312(r20)


restore

blr
