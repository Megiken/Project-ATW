#To be inserted at 800d1200

.include "Common/common.s"

load r20,headFlag
lwz r20,0(r20)
cmpwi r20,2
bne END 
li r0,1
b LOL

END:
lwz	r0, 0x197C (r30)
LOL:
