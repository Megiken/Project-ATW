#To be inserted at 800d14c8

.include "Common/common.s"

load r20,gravityFlag
lwz r20,0(r20)
cmpwi r20,0
beq END
cmpwi r20,1
beq LIGHT

lfs f10,0x16c(r30)
bl THERE
.long 0x40000000
THERE:
mflr r20
lfs f9,0(r20)
fmul f10,f10,f9
stfs f10,0x16c(r30)

b END
LIGHT:

lfs f10,0x16c(r30)
bl THEREAGAIN
.long 0x3F000000
THEREAGAIN:
mflr r20
lfs f9,0(r20)
fmul f10,f10,f9
stfs f10,0x16c(r30)

END:
lwz	r0, 0x004C (sp)
