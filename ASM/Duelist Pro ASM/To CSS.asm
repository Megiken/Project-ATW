#To be inserted at 801B0A0C

.include "Common/common.s"

load r20,0x8045acb8
lis r21,0x1a03
li r22,0
LOOP:
stw r21,0(r20)
addi r20,r20,0x24
addi r22,r22,1
cmpwi r22,4
bne LOOP
li r3,0
