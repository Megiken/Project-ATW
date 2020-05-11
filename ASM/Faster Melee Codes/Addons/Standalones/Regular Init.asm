#To be inserted at 8032C8c8

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
li r17,0
stw r17,IMtype(rtoc)
stw r17,IMcount(rtoc)
stw r17,IMgameOverFlag(rtoc)
li r3,1
branchl r12,goToCSSClearChars

branchl r12,IMgetFirst
mflr r23,
branchl r12,IMhardClearStruct

branchl r12,IMgetSecond
mflr r23,
branchl r12,IMhardClearStruct

restore
END:
blr
