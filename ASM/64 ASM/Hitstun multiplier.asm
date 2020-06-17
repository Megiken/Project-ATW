#To be inserted at 8008DD90
lis r14, 0x3FA0 #1.25x
lwz r15, 0(r2)
stw r14, 0(r2)
lfs f14, 0(r2)
stw r15, 0(r2)
fmul f0, f0, f14
stfs f0, 9024(r29)
