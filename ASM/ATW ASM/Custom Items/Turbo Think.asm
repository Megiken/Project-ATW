#To be inserted at 8006B090

.include "Common/common.s"

lfs f1, 1616(r31)


lwz r20, 44(r24)
lbz r21, 12(r20)

branchl r12,getATWstats
mflr r20
li r23,1
addi r20,r20,Stats_turboPickup
stbx r23,r20,r21


branchl r12,getItemVars
mflr r20
addi r20,r20,24
lbzx r20,r20,r21
cmpwi r20,0
beq loc_0x348


lfs f0, -30604(r2)
fcmpu cr0, f0, f1
beq- loc_0x38
lfs f1, 1620(r31)
fcmpu cr0, f0, f1
bne- loc_0x38
stw r3, -8(r1)
mr r3, r30
lwz r30, -8(r1)
bl loc_0x40
stw r3, -8(r1)
mr r3, r30
lwz r30, -8(r1)

loc_0x38:
lfs f1, -30604(r2)
b loc_0x348

loc_0x40:
mflr r0
stw r0, 4(r1)
stwu r1, -208(r1)
stfd f1, 8(r1)
stmw r3, 16(r1)
lwz r31, 44(r3)

loc_0x58:
lwz r30, 4(r31)
lbz r29, 8307(r31)
li r28, 0x0
li r27, 0x0
li r26, 0x0
bl loc_0xAC
mflr r3
lhz r4, 0(r3)

loc_0x78:
rlwinm. r0, r4, 0, 25, 31
beq- loc_0xE4
cmpw r0, r29
bne- loc_0xA4
rlwinm r0, r4, 24, 26, 31
cmpw r0, r30
bne- loc_0xA4
rlwinm r28, r4, 17, 31, 31
rlwinm r27, r4, 18, 31, 31
rlwinm r26, r4, 25, 31, 31
b loc_0xE4

loc_0xA4:
lhzu r4, 2(r3)
b loc_0x78

loc_0xAC:
blrl
.long 0x01910194
.long 0x81138493
.long 0x0496049C
.long 0x04a204a9
.long 0x05948713
.long 0x47940991
.long 0x0C948C13
.long 0x0E940F91
.long 0x90139313
.long 0x53941691
.long 0x16949613
.long 0x17949713
.long 0x00000000

loc_0xE4:
lwz r3, 6744(r31)
cmpwi r3, 0x0
beq- loc_0x100
lwz r3, 44(r3)
li r0, 0x0
stw r0, 6732(r3)
b loc_0x200

loc_0x100:
lwz r25, 16(r31)
cmpwi r25, 0x11
ble- loc_0x1B8
cmpwi r25, 0x18
beq- loc_0x15C
cmpwi r25, 0x27
beq- loc_0x15C
cmpwi r25, 0x29
blt- loc_0x14C
cmpwi r25, 0x2B
ble- loc_0x15C
cmpwi r25, 0x46
blt- loc_0x14C
cmpwi r25, 0x4A
ble- loc_0x15C
cmpwi r25, 0xE9
blt- loc_0x14C
cmpwi r25, 0xEC
ble- loc_0x15C

loc_0x14C:
cmpwi r29, 0x0
beq- loc_0x1B8
cmpwi r29, 0x58
beq- loc_0x1B8

loc_0x15C:
lbz r3, 8734(r31)
ori r0, r3, 0x80
stb r0, 8734(r31)
lwz r3, 0(r31)
bl loc_0x224
lwz r3, 16(r31)
cmpw r3, r25
beq- loc_0x188
cmpwi r26, 0x0
bne+ loc_0x58
b loc_0x1B8

loc_0x188:
cmpwi r27, 0x0
bne- loc_0x1B8
lwz r3, 4(r31)
cmpwi r3, 0x7
bne- loc_0x1B0
lwz r3, 16(r31)
cmpwi r3, 0x15E
beq- loc_0x1B8
cmpwi r3, 0x161
beq- loc_0x1B8

loc_0x1B0:
lwz r3, 0(r31)
bl loc_0x2D0

loc_0x1B8:
lwz r3, 16(r31)
cmpwi r3, 0x1D
blt- loc_0x200
cmpwi r3, 0x26
bgt- loc_0x200
cmpwi r28, 0x0
beq- loc_0x200
lwz r3, 0(r31)
li r4, 0x1
li r5, 0x1
lwz r6, -20812(r13)
lfs f1, 832(r6)
lfs f2, 836(r6)
li r6, 0x0
lis r12, 0x8009
ori r12, r12, 0x6900
mtlr r12
blrl

loc_0x200:
lbz r26, 8734(r31)
andi. r26, r26, 0x7F
stb r26, 8734(r31)
lmw r3, 16(r1)
lfd f1, 8(r1)
addi r1, r1, 0xD0
lwz r0, 4(r1)
mtlr r0
blr

loc_0x224:
mflr r0
stw r0, 4(r1)
stwu r1, -24(r1)
stmw r30, 16(r1)
lwz r31, 44(r3)
lfs f1, 2204(r31)
stfs f1, -8(r1)
lfs f1, -6044(r2)
lwz r3, 0(r31)
lis r12, 0x8006
ori r12, r12, 0xF190
mtlr r12
blrl
lwz r3, 0(r31)
lis r12, 0x8006
ori r12, r12, 0xEBA4
mtlr r12
blrl
lwz r3, 0(r31)
lis r12, 0x8006
ori r12, r12, 0xC80C
mtlr r12
blrl
lwz r3, 0(r31)
lis r12, 0x8006
ori r12, r12, 0xA360
mtlr r12
blrl
lfs f0, -6044(r2)
lfs f1, 2204(r31)
fcmpu cr0, f1, f0
bne- loc_0x2BC
lfs f1, -8(r1)
lwz r3, 0(r31)
lis r12, 0x8006
ori r12, r12, 0xF190
mtlr r12
blrl

loc_0x2BC:
lmw r30, 16(r1)
addi r1, r1, 0x18
lwz r0, 4(r1)
mtlr r0
blr

loc_0x2D0:
mflr r0
stw r0, 4(r1)
stwu r1, -16(r1)
stw r31, 8(r1)
lwz r31, 44(r3)
lbz r3, 8307(r31)
cmpwi r3, 0x0
beq- loc_0x334
lwz r3, 224(r31)
cmpwi r3, 0x0
beq- loc_0x30C
lis r3, 0x800C
ori r3, r3, 0xB2F8
stw r3, 8608(r31)
b loc_0x318

loc_0x30C:
lis r3, 0x8009
ori r3, r3, 0x9E80
stw r3, 8608(r31)

loc_0x318:
li r3, 0x1
stw r3, 2212(r31)
lwz r3, 0(r31)
lis r12, 0x8006
ori r12, r12, 0xA360
mtlr r12
blrl

loc_0x334:
lwz r31, 8(r1)
addi r1, r1, 0x10
lwz r0, 4(r1)
mtlr r0
blr

loc_0x348:
