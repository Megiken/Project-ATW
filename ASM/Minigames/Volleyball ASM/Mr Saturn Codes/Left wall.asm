#To be inserted at 802779d8

.include "Common/common.s"

lwz r20,0x10(r31)
compareine r20,MrSaturn,END

backup

lfs f10,0x40(r31)
fneg f10,f10
stfs f10,0x40(r31)

restore
branch r12,0x80277c1c

END:
branchl r12,0x8000dc6c
