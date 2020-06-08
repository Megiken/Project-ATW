#To be inserted at 80017920

.include "Common/common.s"

backup
cmpwi r17,0x6969
beq END
bl THERE
.long 0
THERE:
mflr r20
lwz r21,0(r20)
cmpwi r21,4
bne NORMAL
li r21,0
stw r21,0(r20)
NORMAL:
cmpwi r21,0
bne GO
lhz r16,4(r3)
cmpwi r16,0x2e64
bne END
load


END:
restore
branchl r12,0x8033796c
