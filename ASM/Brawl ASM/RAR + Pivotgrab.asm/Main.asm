#To be inserted at 800c9ee0

.include "Common/common.s"

stwu	sp, -0x0008 (sp)
lfs f0, 140(r30)
fneg f0, f0
stfs f0, 140(r30)
mr r20,r3
branchl r12,0x800d8a38
cmpwi r3,0
beq END
branch r12,0x800c9eec
END:
mr r3,r20
