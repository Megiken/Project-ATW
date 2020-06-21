#To be inserted at 80093050

.include "Common/common.s"

bl THERE
.float 1.62
THERE:
mflr r20
lfs f10,0(r20)
li r22,4
branchl r12,Int2Float
fmul f10,f10,f2
fadd f10,f10,f8
