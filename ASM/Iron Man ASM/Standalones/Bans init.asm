#To be inserted at 8032C8cc

.include "Common/common.s"

cmpwi r3,1
bne END
mflr r0
stw	r0, 0x0004 (sp)
stwu	sp, -0x0008 (sp)
li r17,0
stw r17,IMgameOverFlag(rtoc)
li r17,1
stw r17,IMtype(rtoc)

branchl r12,IMgetFirstBans
mflr r3
li r4,32
branchl r12,zeromem
branchl r12,IMgetSecondBans
mflr r3
li r4,32
branchl r12,zeromem
load r20,IMbanOrder
lwz r20,0(r20)
cmpwi r20,0
beq BANFIRST
li r20,1
stw r20,IMpickban(rtoc)
li r17,0x6969
branch r12,0x801b0a0c
BANFIRST:
li r20,0
stw r20,IMpickban(rtoc)
li r17,0x6969
branch r12,0x801b0a0c
END:
blr
