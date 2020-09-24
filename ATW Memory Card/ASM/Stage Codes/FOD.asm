#To be inserted at 800d32e8

.include "Common/memcard.s"

load r20,stageData
lwz r20,0x88(r20)
cmpwi r20,0xc
bne END

lbz r3,0xc(r30)
branchl r12,getPlayerStatic
lhz r4,0x60(r3)
addi r4,r4,5
sth r4,0x60(r3)

li r22,5
branchl r12,Int2Float
lfs f9,0x1830(r30)
fadd f9,f9,f8
stfs f9,0x1830(r30)

lis r3,0x8022
ori r3,r3,0x4b68
mtlr r3
blrl
lfs f15,0xb4(r30)
fsubs f15,f1,f15
stfs f1,0xb4(r30)
stfs f1,0x6F8(r30)
li r3,4
mtctr r3
addi r3,r30,0x82c

HITBOX_LOOP:
lfsu f1,0x138(r3)
fadds f1,f1,f15
stfs f1,0(r3)
bdnz+ HITBOX_LOOP

lis r3,0x800d
ori r3,r3,0x31a4
mtctr r3
bctr

END:
mr	r3, r31
