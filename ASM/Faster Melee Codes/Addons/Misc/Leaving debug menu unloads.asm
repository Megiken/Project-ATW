#To be inserted at 801b0a14

.include "Common/common.s"

lwz r20,gameID(rtoc)
cmpwi r20,0
beq END

li r20,0
stw r20,gameID(rtoc)
lwz r15,secondFileInHeap(rtoc)
branchl r12,removerestoreGCT
li r20,0
stw r20,IMcount(rtoc)
stw r20,IMp1Stocks(rtoc)
stw r20,IMp2Stocks(rtoc)
stw r20,IMgameOverFlag(rtoc)
stw r20,IMtype(rtoc)
stw r20,IMpickban(rtoc)
load r21,ATWsubmenu
stw r20,0x120(r21)
stw r20,0x128(r21)

END:
li r3,1
