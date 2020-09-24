#To be inserted at 8026DE5C

.include "Common/memcard.s"

lwz r20,0x10(r31)
cmpwi r20,0x1e
bne END
li r3,0

END:
cmpwi r3,0
