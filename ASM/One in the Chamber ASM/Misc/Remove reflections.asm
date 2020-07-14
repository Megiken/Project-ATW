#To be inserted at 80079534

.include "Common/common.s"

loadwz r20,oitcReflections
cmpwi r20,0
bne END
branchl r12,0x80007bcc
b LOL
END:
li r3,0
LOL:
