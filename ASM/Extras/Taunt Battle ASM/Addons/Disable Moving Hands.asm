#To be inserted at 8026074C

.include "Common/common.s"

li r22,26
branchl r12,Int2Float
fneg f8,f8
stfs f8,0x10(r31)
