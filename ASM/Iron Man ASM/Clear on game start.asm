#To be inserted at 801b0a1c

.include "Common/common.s"

branchl r12,IMgetFirst
mflr r23
branchl r12,IMhardClearStruct
branchl r12,IMgetSecond
mflr r23
branchl r12,IMhardClearStruct
li r20,0
stw r20,IMgameOverFlag(rtoc)
stw r20,IMcount(rtoc)
branchl r12,0x801a4b60

load r20,0x8045bf14
li r21,0
stb r21,3(r20)
