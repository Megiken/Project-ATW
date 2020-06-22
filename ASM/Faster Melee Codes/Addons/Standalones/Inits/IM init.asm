#To be inserted at 8032C91c

.include "Common/common.s"

backup


li r17,0
stw r17,IMgameOverFlag(rtoc)
stw r17,IMcount(rtoc)

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
b GO
BANFIRST:
li r20,0
stw r20,IMpickban(rtoc)
GO:
branchl r12,IMgetFirst
mflr r23
branchl r12,IMhardClearStruct

branchl r12,IMgetSecond
mflr r23
branchl r12,IMhardClearStruct

load r20,IMsubmenu
li r21,1
stw r21,0x120(r20)
bl THERE
.long 0x52657375
.long 0x6d650000
THERE:
mflr r21
stw r21,0x128(r20)
restore
blr
