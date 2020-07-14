#To be inserted at 800DED40
mr r31, r3
lis r17, 0x8045
ori r17, r17, 0xBF12
lbz r17, 0(r17)
cmpwi r17, 0x3
bne- loc_0x90
lbz r3, 1659(r31)
lwz r4, 140(r31)
lwz r5, 32(r31)
cmpw r4, r5
bne- loc_0x30
b loc_0x44

loc_0x30:
cmpwi r3, 0x0
bne- loc_0x40
li r3, 0x1
b loc_0x44

loc_0x40:
li r3, 0x0

loc_0x44:
cmpwi r3, 0x2
bne- loc_0x50
li r3, 0x1

loc_0x50:
rlwinm r3, r3, 2, 0, 29
addi r3, r3, 0x518
li r4, 0x0
stw r4, 1304(r31)
stw r4, 1308(r31)
stw r4, 1312(r31)
stw r4, 1320(r31)
stw r4, 1324(r31)
stw r4, 1328(r31)
stw r4, 1332(r31)
lis r4, 0x4344
stw r4, 1316(r31)
li r4, 0x91
stb r4, 1380(r31)
lis r4, 0x437F
stwx r4, r31, r3

loc_0x90:
mr r3, r31
