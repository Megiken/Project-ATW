#To be inserted at 8021c7ec

.include "Common/common.s"

backup
li r3,6
li r4,7
li r5,0
bl SPIKEGX
mflr r6
li r7,8
branchl r12,createCustomGObj
b END

SPIKEGX:
blrl
backup
mr r31,r3
lwz r30,0x2c(r31)
li r3,8
load  r4,0x00101300
li r5,0x1450
branchl r12,prim.new
subi r29,r3,4
mr r28,r3
lwz r3,-0x51e8(r13)
addi r3,r3,0xc8-0x14
movetctr 4
li r21,0
li r22,0x00ff
LOOP:
lwzu r4,0x14(r3)
stwu r4,4(r29)
lwzu r4,4(r3)
stwu r4,4(r29)
stwu r21,4(r29)
stwu r22,4(r29)
bdnz LOOP

lwz r3,-0x51e8(r13)
addi r3,r3,0xc8+0x34
movetctr 2
LOOP2:
lwzu r4,0x14(r3)
stwu r4,4(r29)
lwzu r4,4(r3)
stwu r4,4(r29)
stwu r21,4(r29)
stwu r22,4(r29)
bdnz LOOP2

lwz r3,-0x51e8(r13)
addi r3,r3,0xc8-0x14
movetctr 2
LOOP3:
lwzu r4,0x14(r3)
stwu r4,4(r29)
lwzu r4,4(r3)
stwu r4,4(r29)
stwu r21,4(r29)
stwu r22,4(r29)
bdnz LOOP3



branchl r12,prim.close
ENDGX:
restore
blr

END:
restore
lwz	r0, 0x001C (sp)
