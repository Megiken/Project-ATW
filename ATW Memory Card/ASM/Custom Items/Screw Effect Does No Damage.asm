#To be inserted at 8006D374

.include "Common/memcard.s"

lfs	f31, 0x1838 (r30)
lwz r20,0x1860(r30)
cmpwi r20,0xe
bne END
branch r12,0x8006d380


END:
