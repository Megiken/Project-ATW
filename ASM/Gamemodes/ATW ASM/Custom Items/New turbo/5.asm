#To be inserted at 800693AC

.include "Common/common.s"

mflr r14
lwz r20,0x2c(r3)
lbz r21, 12(r20)
branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
mtlr r14
cmpwi r20,1
bne- loc_0x100
lwz r15, 44(r3)
lbz r0, 8850(r15)
rlwinm. r0, r0, 0, 31, 31
beq- loc_0xF8
lhz r14, 8848(r15)
cmpw r14, r4
bne- loc_0x30
blr

loc_0x30:
lfs f13, 128(r15)
lis r14, 0x4000
ori r14, r14, 0x0
stw r14, -4(r1)
lfs f14, -4(r1)
fcmpo cr0, f13, f14
blt- loc_0x54
stfs f14, 128(r15)
b loc_0x64

loc_0x54:
fneg f14, f14
fcmpo cr0, f13, f14
bgt- loc_0x64
stfs f14, 128(r15)

loc_0x64:
lfs f13, 132(r15)
lis r14, 0x4040
ori r14, r14, 0x0
stw r14, -4(r1)
lfs f14, -4(r1)
fcmpo cr0, f13, f14
blt- loc_0x84
stfs f14, 132(r15)

loc_0x84:
lwz r0, -29720(r2)
stw r0, 6492(r15)
subi r1, r1, 0x30
stw r3, 32(r1)
stw r4, 36(r1)
stw r5, 8(r1)
stw r6, 12(r1)
stfs f1, 16(r1)
stfs f2, 20(r1)
stfs f3, 24(r1)
mflr r0
stw r0, 28(r1)
lis r14, 0x8006
ori r14, r14, 0xA1BC
mtctr r14
bctrl
lwz r3, 32(r1)
lwz r4, 36(r1)
lwz r5, 8(r1)
lwz r6, 12(r1)
lfs f1, 16(r1)
lfs f2, 20(r1)
lfs f3, 24(r1)
lwz r0, 28(r1)
mtlr r0
addi r1, r1, 0x30
li r0, 0x28
stb r0, 8851(r15)
sth r4, 8848(r15)

loc_0xF8:
li r0, -1
sth r0, 8848(r15)

loc_0x100:
mflr r0
