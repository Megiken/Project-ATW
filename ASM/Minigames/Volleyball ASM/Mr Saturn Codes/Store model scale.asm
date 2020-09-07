#To be inserted at 80267f14

.include "Common/common.s"

lwz r20,0x10(r28)
cmpwi r20,7
bne END
loadfloat f0,r20,0x3FD47AE2
END:
stfs f0,0x38(r28)
