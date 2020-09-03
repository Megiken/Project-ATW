#To be inserted at 80283974

.include "Common/common.s"

loadfloat f1,r20,0x3DA3D70A
lfs f12,rtoctwo(rtoc)
lwz r20,0x2c(r3)
lfs f10,0x44(r20)
lfs f9,rtoczero(rtoc)
fcomparelt f10,f9,NODOUBLE
fmul f1,f1,f12
NODOUBLE:
lfs f10,0x40(r20)
loadfloat f11,r21,0x3CA3D70A
fsub f13,f10,f11
lfs f12,rtoczero(rtoc)
fcomparelt f10,f12,NEGATIVE
fcomparelt f13,f12,END
stfs f13,0x40(r20)
NEGATIVE:
fadd f13,f10,f11
fcomparelt f12,f13,END
stfs f13,0x40(r20)
END:
