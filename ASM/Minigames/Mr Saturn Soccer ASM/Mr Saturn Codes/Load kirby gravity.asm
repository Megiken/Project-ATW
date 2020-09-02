#To be inserted at 80283974

.include "Common/common.s"

loadfloat f1,r20,0x3DA3D70A
lfs f12,rtoctwo(rtoc)
fmul f1,f1,f12
lwz r20,0x2c(r3)
lfs f10,0x40(r20)
loadfloat f11,r21,0x3CA3D70A
fsub f11,f10,f11
lfs f12,rtoczero(rtoc)
fcomparelt f11,f12,END
stfs f11,0x40(r20)
END:
