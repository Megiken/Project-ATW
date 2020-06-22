#To be inserted at 8006B8AC

lbz r14, 8307(r31)
cmplwi r14, 17
blt+ loc_0x110
cmplwi r14, 20
bgt+ loc_0x110
lbz r14, 8307(r31)
lbz r15, 8855(r31)
cmpw r14, r15
beq- loc_0x110
mflr r0
bl loc_0xFC
mflr r14
mtlr r0
lwz r15, 4(r31)
li r16, 0x0
cmpwi r15, 0x8
blt- loc_0x6C
subi r15, r15, 0x8
addi r16, r16, 0x4
cmpwi r15, 0x8
blt- loc_0x6C
subi r15, r15, 0x8
addi r16, r16, 0x4
cmpwi r15, 0x8
blt- loc_0x6C
subi r15, r15, 0x8
addi r16, r16, 0x4

loc_0x6C:
lwzx r16, r16, r14

loc_0x70:
rlwinm r16, r16, 4, 0, 31
cmplwi r15, 0
subi r15, r15, 0x1
bgt+ loc_0x70
andi. r16, r16, 0xF
lbz r15, 8307(r31)
subi r15, r15, 0x11

loc_0x8C:
rlwinm r14, r16, 0, 31, 31
rlwinm r16, r16, 31, 1, 31
cmplwi r15, 0
subi r15, r15, 0x1
bgt+ loc_0x8C
cmpwi r14, 0x1
bne- loc_0x110
lwz r14, 2196(r31)
lis r15, 0x40A0
cmpw r14, r15
bgt- loc_0x110
lfs f14, 128(r31)
lbz r14, 1629(r31)
lwz r15, 44(r31)
lis r16, 0x0
cmpw r15, r16
blt- loc_0xDC
cmpwi r14, 0x4
beq- loc_0xE8
b loc_0x110

loc_0xDC:
cmpwi r14, 0x8
beq- loc_0xE8
b loc_0x110

loc_0xE8:
fneg f14, f14
stfs f14, 128(r31)
li r0, 0x1
stw r0, 6388(r31)
b loc_0x110

loc_0xFC:
blrl
subic r29, r19, 19661
sth r29, -17518(r27)
sth r29, 13115(r19)
addi r31, r16, 0x0

loc_0x110:
blrl
