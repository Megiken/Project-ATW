#To be inserted at 80277c08

.include "Common/common.s"

lwz r20,0x10(r31)
compareieq r20,MrSaturn,SATURN
stw	r4, 0x0040 (r31)
b END
SATURN:

lfs f10,0x40(r31)
loadfloat f11,r21,0x3DA3D70A
fsub f13,f10,f11
lfs f12,rtoczero(rtoc)
fcompareeq f10,f12,END
fcomparelt f10,f12,NEGATIVE
fcomparelt f13,f12,ZERO
stfs f13,0x40(r31)
b END
NEGATIVE:
fadd f13,f10,f11
fcomparelt f12,f13,ZERO
stfs f13,0x40(r31)
b END
ZERO:
stfs f12,0x40(r31)

END:
