#To be inserted at 8026dcd8

.include "Common/common.s"

bl THERE
.long 0
THERE:
lfs f20,0x44(r31)
mflr r20
lfs r21,0(r20)
fcomparene f20,f21,END
li r21,0
stw r21,0x44(r31)
stw r21,0(r20)
stw r21,0x28(r31)
b LOL
END:
stfs f20,0(r20)
LOL:
lfs f2,rtoczero(rtoc)
