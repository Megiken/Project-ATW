#To be inserted at 80081104

.include "Common/common.s"

backup
compareine r29,2,END
lwz r20,4(r30)
compareine r20,FoxinID,END
lwz r20,0xe0(r30)
compareine r20,0,END
lwz r20,0x10(r30)
compareieq r20,24,END
lfs f20,0xb0(r30)
loadfloat f21,r21,0x42540000
lfs f23,rtocone(rtoc)
li r3,2
load  r4,0x021F1305
load  r5,0x00001455
branchl r12,prim.new
fadd f22,f21,f20
stfs f22,0(r3)
lfs f24,0xb4(r30)
lfs f25,rtocone(rtoc)
fadd f24,f24,f25
stfs f24,4(r3)
li r22,0
stw r22,8(r3)

bl THERE
.long 0xff0000ff
.long 0x0000ffff
.long 0xFFF033ff
.long 0x00ff00ff

THERE:
mflr r15
lbz r16,0xc(r30)
mulli r16,r16,4
lwzx r17,r15,r16
stw r17,0xc(r3)
fadd f22,f22,f23
stfs f22,0x10(r3)
stfs f24,0x14(r3)
stw r22,0x18(r3)
stw r17,0x1c(r3)

li r3,2
load  r4,0x021F1305
load  r5,0x00001455
branchl r12,prim.new

fsubs f22,f20,f21
stfs f22,0(r3)
stfs f24,4(r3)
stw r22,8(r3)
stw r17,0xc(r3)
fsubs f22,f22,f23
stfs f22,0x10(r3)
stfs f24,0x14(r3)
stw r22,0x18(r3)
stw r17,0x1c(r3)

branchl r12,prim.close



END:
restore
lmw	r27, 0x008C (sp)
