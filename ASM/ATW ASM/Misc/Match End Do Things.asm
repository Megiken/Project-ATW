#To be inserted at 8016d30c

.include "Common/common.s"

backupallnomflr

load r20,0x8046b6a0
lbz r20,0x8(r20)
cmpwi r20,0
beq END


load r16,0x69696969
stw r16,spawnVar(rtoc)
branchl r12,getItemVars
mflr r3
li r4,0x3c
branchl r12,0x8000c160
END:
restoreallnomtlr
lwz	r0, 0x003C (sp)
