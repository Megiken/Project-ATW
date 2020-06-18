#To be inserted at 80017be4

.include "Common/common.s"

cmpwi r17,0x6969
bne END
load r3,2182400
END:
stw r3,0xc(r26)
