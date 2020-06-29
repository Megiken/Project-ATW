#To be inserted at 80079534

.include "Common/common.s"

lwz r20,0x10(r27)
cmpwi r20,0xb2
blt END
cmpwi r20,0xb6
bgt END
li r3,0
b LOL
END:
branchl r12,0x80007bcc
LOL:
