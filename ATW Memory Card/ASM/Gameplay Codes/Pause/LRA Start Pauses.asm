#To be inserted at 8016BDF0

.include "Common/memcard.s"

lbz r14,0x24ca(r29)
rlwinm. r14,r14,29,31,31
beq END

lwz r0,0(r3)
andi. r3,r0,0x1160
cmpwi r3,0x1160
bne NOPAUSE
mr r18,r0
li r3,0
load r17,0x804C1FAC
LOOP:
lwz r16,0(r17)
cmpw r16,r18
beq GO
addi r3,r3,1
addi r17,r17,0x44
cmpwi r3,5
bne LOOP
GO:
lwz r18,8(r17)
cmpwi r18,0x1000
bne NOPAUSE
branchl r12,0x8003241c
cmpwi r3,3
beq NOPAUSE



li r0,0x1000
b END

NOPAUSE:
li r0,0

END:
rlwinm r0,r0,0,19,19
