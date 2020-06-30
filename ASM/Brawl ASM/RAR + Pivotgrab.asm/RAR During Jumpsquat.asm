#To be inserted at 800cb6b4

.include "Common/common.s"

lwz r20,0x2c(r3)
lfs	f2, 0x0620 (r20)
lfs	f1, 0x002C (r20)
lfs	f0, -0x6B48 (rtoc)
fmuls	f1,f2,f1
fcmpo	cr0,f1,f0
bge END
lfs f0, 0x2c(r20)
fneg f0, f0
stfs f0, 0x2c(r20)
END:
stwu	sp, -0x0008 (sp)
