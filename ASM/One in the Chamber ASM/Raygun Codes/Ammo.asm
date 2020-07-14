#To be inserted at 8028E754

.include "Common/common.s"

loadwz r20,infiniteAmmo
cmpwi r20,1
beq END
li r4,10000
b LOL
END:
li r4,1
LOL:
