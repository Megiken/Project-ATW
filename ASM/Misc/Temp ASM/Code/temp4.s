#To be inserted at 80005234

.include "Common/common.s"

load r3,0x81ff6ee0
load r4,0x817f6ee0
load r5,0x9120
branchl r12,copymem
lis r20,0x0200
lis r21,0x8000
stw r20,0x28(r21)
stw r20,0xf0(r21)
oris r20,r20,0x8000
stw r20,0xec(r21)
load r20,0x81ff6ee0
stw r20,0xf4(r21)
addi r20,r20,0x2000
stw r20,0x34(r21)
stw r20,0x38(r21)


li r0,-1
