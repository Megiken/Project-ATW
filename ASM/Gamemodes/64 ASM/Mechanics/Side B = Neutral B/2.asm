#To be inserted at 800967c0

.include "Common/common.s"

loadwz r12,sideB64Flag
compareieq r12,1,END
lis	r3, 0x803C
b LOL
END:
branch r12,0x80096874
LOL:
