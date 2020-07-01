#To be inserted at 800d1138

.include "Common/common.s"

bl THERE
.float 10
THERE:
mflr r20
lwz r20,0(r20)
stw r20,0x168(r30)

END:
lfs	f0, -0x6A7C (rtoc)
