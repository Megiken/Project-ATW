#To be inserted at 8032C8c8

.include "Common/common.s"


cmpwi r3,1
bne END
mflr r0
stw	r0, 0x0004 (sp)
stwu	sp, -0x0008 (sp)
branchl r12,IMgetFirstBans
mflr r3
li r4,32
branchl r12,zeromem
branchl r12,IMgetSecondBans
mflr r3
li r4,32
branchl r12,zeromem
li r17,0
stw r17,IMtype(rtoc)
stw r17,IMgameOverFlag(rtoc)
li r17,0x6969
branch r12,0x801b0a0c
END:
blr
