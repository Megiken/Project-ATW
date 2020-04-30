#To be inserted at 801B0A0C

.include "Common/common.s"

cmpwi r4,0x6969
beq END
branchl r12,getCharData
mflr r3
load r4,0x01010101
stw r4,0(r3)
addi r3,r3,4
li r4,108
branchl r12,0x8000c160
li r3,1
load r4,0x803FA600
stw r3,0(r4)
bl TEXT
mflr r3
stw r3,8(r4)
load r20,0x8045acb8
lis r21,0x1a03
li r22,0
LOOP:
stw r21,0(r20)
addi r20,r20,0x24
addi r22,r22,1
cmpwi r22,4
bne LOOP
b END

TEXT:
blrl
.long 0x52657375
.long 0x6d650000


END:
li r3,0
