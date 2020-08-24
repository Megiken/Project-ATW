#To be inserted at 8026688C

.include "Common/common.s"

backupall
lwz r20,SynData(rtoc)
cmpwi r20,0
bne END
loadwz r20,synTeams
compareieq r20,0,ZERO
compareieq r20,1,ONE
load r20,0x00030102
b STORE
ZERO:
load r20,0x00010203
b STORE
ONE:
load r20,0x00020103
STORE:
stw r20,SynData(rtoc)
END:
restoreall
mflr r0
