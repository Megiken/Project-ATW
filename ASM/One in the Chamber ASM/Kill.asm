#To be inserted at 8008e254

.include "Common/common.s"

backup
lwz r20,0x1868(r29)
lhz r19,0(r20)
cmpwi r19,6
bne END
lwz r20,0x2c(r20)
lwz r21,0x10(r20)
cmpwi r21,0x27
beq DIE
cmpwi r21,0x23
bne END
DIE:
lwz r20,0x518(r20)
lwz r20,0x2c(r20)
lwz r20,0x1974(r20)
lwz r20,0x2c(r20)
lwz r21,0xd4c(r20)
addi r21,r21,1
stw r21,0xd4c(r20)
branchl r12,0x800d40b8
restore
b THERE
END:
restore
branchl r12,0x800693ac
THERE:
