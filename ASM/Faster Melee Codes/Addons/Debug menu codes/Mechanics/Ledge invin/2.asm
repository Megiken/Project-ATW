#To be inserted at 8006A414

.include "Common/common.s"

load r14,ledgeInvincibility
lwz r14,0(r14)
cmpwi r14,0
bne END

lwz r3, 6540(r31)
lwz r4, 6536(r31)
or r3, r3, r4
cmpwi r3, 0x0
bne- loc_0x28
lwz r3, 4200(r31)
cmpwi r3, 0x0
beq+ loc_0x28
subi r3, r3, 0x1
stw r3, 4200(r31)
loc_0x28:
END:
lwz r3, 6544(r31)
