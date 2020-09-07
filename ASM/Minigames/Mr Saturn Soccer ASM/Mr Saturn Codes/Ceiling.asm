#To be inserted at 8026e1dc

.include "Common/common.s"

lwz r20,0x10(r29)
compareine r20,MrSaturn,END
GOOD:

rlwinm. r0,r31,0,30,30
beq END
lfs f10,0x44(r29)
fneg f10,f10
stfs f10,0x44(r29)


END:
rlwinm. r0,r31,0,31,31
