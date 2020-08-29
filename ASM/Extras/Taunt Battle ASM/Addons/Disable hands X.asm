#To be inserted at 80260740

.include "Common/common.s"

li r22,26
branchl r12,Int2Float
fneg f8,f8
stfs f8,0xc(r31)
