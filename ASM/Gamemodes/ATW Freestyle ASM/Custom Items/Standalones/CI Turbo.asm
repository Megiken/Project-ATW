#To be inserted at 8032c88c

.include "Common/common.s"

backupall
addi r15,r15,4
mulli r18,r16,2
lhzx r19,r15,r18
cmpwi r19,0
beq REMOVEFLAG
subi r19,r19,1
sthx r19,r15,r18


mr r3,r16
branchl r12,getPlayerData
li r4,0xc
li r5,0
branchl r12,0x800bffd0


b END
REMOVEFLAG:
subi r15,r15,4
li r19,0
stbx r19,r15,r16


END:
restoreall
blr
