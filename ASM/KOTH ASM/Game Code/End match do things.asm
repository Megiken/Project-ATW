#To be inserted at 8016d310

.include "Common/common.s"

load r20,0x8046b6a0
lbz r20,0x8(r20)
cmpwi r20,0
beq END

backupallnomflr

li r14,0x6969
branchl r12,KOTHThink
branchl r12,getKOTHdata
li r4,0x54
branchl r12,zeromem

restoreallnomtlr
END:
lwz	r31, 0x0034 (sp)
