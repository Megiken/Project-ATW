#To be inserted at 800d31e0

.include "Common/common.s"

lbz r3,0xc(r30)
branchl r12,getPlayerStatic
lhz r4,0x60(r3)
addi r4,r4,20
sth r4,0x60(r3)
li r22,20
branchl r12,Int2Float
lfs f7,0x1830(r30)
fadd f7,f8,f7
stfs f7,0x1830(r30)
li r22,999
branchl r12,Int2Float
fcmpo 0,f7,f8
bge NORMAL

lis	r3,0x8022
ori	r3,r3,0x4b50
mtlr	r3
blrl
lfs	f15,0xb0(r30)
fsubs	f15,f15,f1
stfs	f1,0xb0(r30)
stfs	f1,0x6F4(r30)
li	r3,4
mtctr	r3
addi	r3,r30,0x828

HITBOX_LOOP:
lfsu	f1,0x138(r3)
fsubs	f1,f1,f15
stfs	f1,0(r3)
bdnz+	HITBOX_LOOP

lis	r3,0x800d
ori 	r3,r3,0x31a4
mtctr	r3
bctr

NORMAL:
mr r3,r31
