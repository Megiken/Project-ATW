#To be inserted at 8032C8d0

.include "Common/common.s"

cmpwi r3,1
bne END
lwz r20,gameID(rtoc)
cmpwi r20,0
beq END
backup
branchl r12,IMgetFirstBans
mflr r3
li r4,32
branchl r12,zeromem
branchl r12,IMgetSecondBans
mflr r3
li r4,32
branchl r12,zeromem
li r17,2
stw r17,IMtype(rtoc)
li r17,0
stw r17,IMgameOverFlag(rtoc)
stw r17,IMcount(rtoc)
li r3,1
branchl r12,goToCSS
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
END:
blr
