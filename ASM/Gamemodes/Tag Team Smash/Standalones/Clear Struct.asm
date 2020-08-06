#To be inserted at 8032C8d4

.include "Common/common.s"

#input r23 = struct to clear

backupall

addi r3,r23,4
li r4,112
branchl r12,zeromem
lwz r20,IMtype(rtoc)
cmpwi r20,2
bne END
load r20,IMplayerMoney
lwz r20,0(r20)
stw r20,IMmoneyOffset(r23)
mr r26,r20
branchl r12,IMgetFirst
mflr r20
cmpw r20,r23
li r14,1
beq CHANGETEXT
li r14,2
CHANGETEXT:
branchl r12,IMupdateText



END:
restoreall

blr
