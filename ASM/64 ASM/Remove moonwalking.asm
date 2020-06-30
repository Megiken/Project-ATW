#To be inserted at 800CA57C

.include "Common/common.s"

fmuls f1, f3, f0
lfs f4, -27464(r2)
fcmpo cr0, f1, f4
blt- loc_0x24
beq- loc_0x44
lfs f5, 44(r3)
fcmpo cr0, f5, f4
bgt- loc_0x44
b loc_0x34

loc_0x24:
lfs f5, 44(r3)
fcmpo cr0, f5, f4
bgt- loc_0x34
b loc_0x44

loc_0x34:
li r14,0
stw r14, -4(r1)
lfs f0, -4(r1)

loc_0x44:
lfs f2, -27464(r2)
lfs f1, 1568(r3)
fcmpo cr0, f1, f2
fmuls f1, f3, f0
