#To be inserted at 800d1138

.include "Common/common.s"

loadfz f8,r20,flightModeFloats
stfs f8,0x17c(r30)
stfs f8,0x158(r30)
loadfz f8,r20,flightModeFloats+4
stfs f8,0x15c(r30)
loadfz f8,r20,flightModeFloats+8
stfs f8,0x174(r30)
loadfz f8,r20,flightModeFloats+12
stfs f8,0x178(r30)


lfs	f0, -0x6A7C (rtoc)
