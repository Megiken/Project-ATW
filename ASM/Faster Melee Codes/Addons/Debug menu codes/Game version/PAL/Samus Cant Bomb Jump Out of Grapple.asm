#To be inserted at 803ce4d4
.include "Common/common.s"

load r20,meleeVersion
lwz r20,0(r20)
cmpwi r20,1
bne NORMAL

.long 0x00240464
b END

NORMAL:
.long 0x00200000
END:
