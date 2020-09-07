#To be inserted at 8006be5c

.include "Common/common.s"

lbz r20,0x61b(r31)
compareieq r20,0,RED
loadfloat f10,r20,0xC31F4A3D
fcomparele f10,f0,END
fmr f0,f10
b END
RED:
loadfloat f10,r20,0xC3234A3D
fcomparele f0,f10,END
fmr f0,f10


END:
stfs f0,0xb0(r31)
