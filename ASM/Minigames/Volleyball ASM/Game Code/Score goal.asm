#To be inserted at 8026ddfc

.include "Common/common.s"

backupall
lwz r31,0x2c(r3)
branchlr r14,getHitData
lwz r20,0x10(r14)
lwz r21,0x14(r14)
comparene r20,r21,GOAL
compareieq r20,0,END
GOAL:
li r20,0
subi r14,r14,4
movetctr 6
LOOP:
stwu r20,4(r14)
bdnz LOOP
loadfloat f10,r20,0xC3200000
lfs f11,0x4c(r31)
fcomparelt f11,f10,BLUESCORE
#red score
li r11,0
branchl r12,scoregoal
b END
BLUESCORE:
li r11,1
branchl r12,scoregoal

END:
restoreall
mflr r0
