#To be inserted at 8016e91c

.include "Common/common.s"

li r20,0
li r21,2
LOOP:
mulli r4,r20,0xe90
lis r5,0x8045
ori r5,r5,0x3080
add r4,r4,r5
stb r21,0x8e(r4)
addi r20,r20,1
cmpwi r20,4
bne LOOP
load r20,timerSeconds
li r21,135
stw r21,0(r20)

lwz	r0, 0x0024 (sp)
