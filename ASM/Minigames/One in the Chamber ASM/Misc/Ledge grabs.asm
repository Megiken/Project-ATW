#To be inserted at 800c3b0c

.include "Common/common.s"

loadwz r20,oitcLedge
cmpwi r20,0
beq END
li r3,0
END:
blr
