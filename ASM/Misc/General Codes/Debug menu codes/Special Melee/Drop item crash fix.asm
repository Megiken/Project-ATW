#To be inserted at 8006a6ec
.include "Common/common.s"

load r20,headFlag
lwz r20,0(r20)
cmpwi r20,1
bne END
li r0,1
b LOL
END:
lwz	r0, 0x2018 (r31)
LOL:
