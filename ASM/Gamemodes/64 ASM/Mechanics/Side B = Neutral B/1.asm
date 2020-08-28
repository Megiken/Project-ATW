#To be inserted at 80096638

.include "Common/common.s"

loadwz r12,sideB64Flag
compareieq r12,0,END
.long 0x81840000
b LOL
END:
.long 0x81840294
LOL:
