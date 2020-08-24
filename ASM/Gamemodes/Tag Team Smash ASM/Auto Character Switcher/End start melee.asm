#To be inserted at 8016e91c

.include "Common/common.s"

backup
movetctr 2
branchlr r14,IMgetFirst
LOOP:
lbz r3,3(r14)
branchl r12,getPlayerStatic
lwz r20,0xb0(r3)
lwz r21,0xb4(r3)
lwz r20,0x2c(r20)
lwz r21,0x2c(r21)
li r22,5
stw r22,0x1a94(r20)
addi r22,r22,1
stw r22,0x1a94(r21)
lbz r0,0x221f(r21)
ori r0,r0,8
stb r0,0x221f(r21)
lbz r0,0x221f(r20)
ori r0,r0,8
xori r0,r0,8
stb r0,0x221f(r20)


branchlr r14,IMgetSecond
bdnz LOOP

restore


lwz	r0, 0x0024 (sp)
