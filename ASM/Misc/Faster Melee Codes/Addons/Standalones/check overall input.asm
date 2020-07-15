#To be inserted at 8032C8c0

.include "Common/common.s"

load r20,0x804C1FAC
li r17,4
mtctr r17
li r17,0
LOOP:
lwz r21,0(r20)
and r21,r21,r18
cmpw r21,r18
beq END
addi r17,r17,1
addi r20,r20,0x44
bdnz LOOP
li r17,-1
END:
blr
