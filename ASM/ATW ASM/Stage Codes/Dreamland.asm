#To be inserted at 802109D0

.include "Common/common.s"

backup
bl STRUCT
mflr r20
lwz r21,0x0(r20)
subi r21,r21,1
stw r21,0x0(r20)
cmpwi r21,0
bne END
load r21,redeadTimer
lwz r21,0(r21)
stw r21,0x0(r20)
addi r3,r20,0x18
branchl r12,0x80224fdc
addi r20,r20,4
lwz r21,0x14(r20)
stw r21,0x20(r20)
lwz r21,0x18(r20)
stw r21,0x24(r20)
li r21,0x2c
stw r21,0x8(r20)
lis r21,0x3f80
stw r21,0x38(r20)
lis r21,0x8000
stw r21,0x44(r20)
mr r3,r20
branchl r12,0x80268b18
b END
STRUCT:
blrl
.long 723
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0

END:
restore
blr
