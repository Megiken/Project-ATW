#To be inserted at 800d120c

.include "Common/memcard.s"

lwz r20,0x168(r30)
addi r20,r20,1
stw r20,0x168(r30)
branch r12,0x800d1324
