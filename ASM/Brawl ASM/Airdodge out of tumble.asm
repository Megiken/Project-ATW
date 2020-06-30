#To be inserted at 800908c4

.include "Common/common.s"

mr r3,r30
branchl r12,0x800cb394
cmpwi r3,0
beq END 
branch r12,0x80090924
END:
lfs	f1, 0x0620 (r31)
