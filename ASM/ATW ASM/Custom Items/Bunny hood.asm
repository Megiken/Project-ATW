#To be inserted at 800d120c

.include "Common/common.s"

lwz r3,0x168(r30)
addi r3,r3,1
stw r3,0x168(r30)

branch r12,0x800d1324
