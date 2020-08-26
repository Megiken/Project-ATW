#To be inserted at 8016E7D8

li r3, 0x3
lis r14, 0x8006
ori r14, r14, 0x737C
mtctr r14
bctrl
li r3, 0x1F
