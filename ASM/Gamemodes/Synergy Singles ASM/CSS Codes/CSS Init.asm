#To be inserted at 802668a8

.include "Common/common.s"
addi	r30, r3, 0
backup
li r20,0
stw r20,SynStop(rtoc)
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
restore
