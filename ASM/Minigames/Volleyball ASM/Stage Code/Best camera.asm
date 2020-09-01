#To be inserted at 8021c7c0

.include "Common/common.s"

load r20,stageData
load r21,0xc3216666
stw r21,0x5c(r20)
lis r21,0x420c
stw r21,0x60(r20)
load r21,0x43938000
stw r21,0x64(r20)
lis r21,0x41f0
stw r21,0x68(r20)
li r21,0
stw r21,0x6c(r20)
lfs f2,8(sp)
