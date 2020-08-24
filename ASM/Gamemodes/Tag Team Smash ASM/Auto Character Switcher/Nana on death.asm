#To be inserted at 800d3338

.include "Common/common.s"

lwz	r31, 0x002C (r3)
backup
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r20,0xb4(r3)
lwz r20,0x2c(r20)
comparene r20,r31,END
lbz r0,0x221f(r31)
ori r0,r0,8
stb r0,0x221f(31)
END:
restore
