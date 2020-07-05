#To be inserted at 8016e91c

.include "Common/common.s"

backup
branchl r12,getCustomEntityStruct
mflr r3
lis r4,0x4100
stw r4,0x18(r3)
stw r4,0x24(r3)
li r4,MrSaturn
stw r4,8(r3)
branchl r12,EntityItemSpawn
stw r3,mrsaturndata(rtoc)
lwz r20,0x2c(r3)
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

load r20,stageData-4
load r21,stageData+0x70
li r0,2
mtctr r0
LOOP:
lwzu r22,4(r21)
stwu r22,4(r20)
bdnz LOOP



restore
lwz	r0, 0x0024 (sp)
