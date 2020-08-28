#To be inserted at 802FF2CC

.include "Common/common.s"

mr r3, r0
loadwz r20,showNanaPercent
compareieq r20,1,END
stwu r1, -256(r1)
stmw r20, 8(r1)
mflr r0
stw r0, 252(r1)
mr r29, r3
mr r3, r29
lis r4, 0x8045
ori r4, r4, 0x3080
mulli r3, r3, 0xE90
add r3, r3, r4
lhz r3, 98(r3)
mr r6, r3
lis r3, 0x804A
ori r3, r3, 0x1F58
mulli r4, r29, 0x14
add r3, r3, r4
lwz r3, 12(r3)
li r4, 0x0
bl loc_0xA8
mflr r5
lis r12, 0x803A
ori r12, r12, 0x70A0
mtctr r12
bctrl
lwz r0, 252(r1)
mtlr r0
lmw r20, 8(r1)
addi r1, r1, 0x100
lis r12, 0x802F
ori r12, r12, 0xF348
mtctr r12
bctr

loc_0xA8:
blrl
.long 0x25642081
.long 0x93000000

loc_0xB4:
mr r3, r29
lwz r0, 252(r1)
mtlr r0
lmw r20, 8(r1)
addi r1, r1, 0x100
END:
mulli r4, r3, 0x14
