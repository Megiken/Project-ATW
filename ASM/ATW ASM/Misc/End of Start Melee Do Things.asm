#To be inserted at 8016e920

.include "Common/common.s"

backupallnomflr

branchl r12,getItemVars
mflr r3
li r4,0x3c
branchl r12,0x8000c160
load r15,0x69696969
stw r15,spawnVar(rtoc)
restoreallnomtlr
lwz	r31, 0x001C (sp)
