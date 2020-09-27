#To be inserted at 801fa4a8

.include "Common/common.s"

bl THERE
.long 0
.float 0.05
THERE:
mflr r20
lwz r21,0(r20)
addi r21,r21,1
stw r21,0(r20)
compareine r21,600,GOOD
li r21,0
stw r21,0(r20)
lfs f0,4(r20)
fneg f0,f0
stfs f0,4(r20)
GOOD:
lfs f0,4(r20)
stfs f0,0(r30)
