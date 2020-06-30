#To be inserted at 800d1138

.include "Common/common.s"

lfs f0,0x16c(r30)
bl FLOAT
mflr r20
lfs f1,0(r20)
fmul f0,f0,f1
stfs f0,0x16c(r30)

lfs f1,8(r20)

lfs f0,0x150(r30)
fmul f0,f0,f1
stfs f0,0x150(r30)

lfs f0,0x164(r30)
fmul f0,f0,f1
stfs f0,0x164(r30)

lfs f0,0x128(r30)
lfs f1,4(r20)
fmul f0,f0,f1
stfs f0,0x128(r30)
lfs f0,0x180(r30)
fmul f0,f0,f1
stfs f0,0x180(r30)
b END
FLOAT:
blrl
.float 0.75
.float 1.25
.float 0.9
END:
lfs	f0, -0x6A7C (rtoc)
