#To be inserted at 8032c888

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
lwz r3,0x2028(r3)
cmpwi r3,0
bne ARMOR
mr r3,r16
branchl r12,getPlayerEntity
li r4,0x21c
li r5,0x32
branchl r12,0x800c8348
ARMOR:
mr r3,r16
branchl r12,getPlayerData
li r22,50
branchl r12,Int2Float
stfs f8,0x18b4(r3)

b END
REMOVEFLAG:
subi r15,r15,4
li r19,0
stbx r19,r15,r16
mr r3,r16
branchl r12,getPlayerData
stw r19,0x18b4(r3)

END:
restoreall
blr
