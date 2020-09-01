#To be inserted at 8016e91c

.include "Common/common.s"

backup
li r20,0
li r21,2
movetctr 4
LOOP:
mr r3,r20
li r4,0xe90
mullw r4,r4,r3
lis r5,0x8045
ori r5,r5,0x3080
add r3,r4,r5
stb r21,0x8e(r3)
addi r20,r20,1
bdnz LOOP


restore
lwz	r0, 0x0024 (sp)
