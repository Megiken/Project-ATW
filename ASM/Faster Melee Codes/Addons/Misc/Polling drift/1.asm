#To be inserted at 801A4DB4

stw r0, 0(r28)
lis r12, 0x8001
ori r12, r12, 0x95FC
mtctr r12
bctrl
