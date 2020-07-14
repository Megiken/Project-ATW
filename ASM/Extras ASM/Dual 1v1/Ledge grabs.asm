#To be inserted at 80082E74

lbz r15, 1659(r28)
lbz r16, 1659(r29)
cmpw r15, r16
beq- loc_0x20
lis r15, 0x8008
ori r15, r15, 0x2EF4
mtctr r15
bctr

loc_0x20:
cmplw r29, r28
