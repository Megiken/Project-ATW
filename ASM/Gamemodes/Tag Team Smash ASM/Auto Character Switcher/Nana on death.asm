#To be inserted at 800d3338

.include "Common/common.s"

lwz	r31, 0x002C (r3)
backup
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r20,0xb0(r3)
lwz r21,0xb4(r3)
lwz r20,0x2c(r20)
lwz r21,0x2c(r21)
li r22,5
stw r22,0x1a94(r20)
li r22,6
stw r22,0x1a94(r21)
lbz r0,0x221f(r20)
ori r0,r0,8
xori r0,r0,8
stb r0,0x221f(r20)
lbz r0,0x221f(r21)
ori r0,r0,8
stb r0,0x221f(r21)
END:
restore
