#To be inserted at 801b0a14

.include "Common/common.s"

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
stw r20,0x40(r21)
stw r20,0x48(r21)
load r21,IMsubmenu
stw r20,0x40(r21)
stw r20,0x48(r21)

li r3,1
