#To be inserted at 80093050

.include "Common/common.s"

bl THERE
.float 0.375
THERE:
mflr r20
lfs f10,0(r20)
fmul f10,f10,f2
