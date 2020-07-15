#To be inserted at 8032c894

.include "Common/common.s"

backupall

mr r3,r16
branchl r12,getPlayerData
lwz r3,0x1974(r3)
cmpwi r3,0
beq ZERO
lwz r3,0x2c(r3)
cmpwi r3,0
beq ZERO
lwz r3,0x10(r3)
cmpwi r3,0x1e
beq TEST
BEFOREZERO:
subi r15,r15,4
ZERO:
li r19,0
stbx r19,r15,r16
addi r15,r15,4
stbx r19,r15,r16
addi r15,r15,4
stbx r19,r15,r16
b END


TEST:
addi r15,r15,4
lbzx r19,r16,r15
cmpwi r19,0
beq GO
subi r19,r19,1
stbx r19,r16,r15
b END
GO:
addi r15,r15,4
lbzx r19,r15,r16
cmpwi r19,15
subi r15,r15,4
beq BEFOREZERO
li r19,60
stbx r19,r16,r15
addi r15,r15,4
lbzx r19,r15,r16
addi r19,r19,1
stbx r19,r15,r16
li r3,5
branchl r12,0x80380580
addi r3,r3,1
mr r19,r3
mr r3,r16
branchl r12,getPlayerData
mr r4,r19
branchl r12,0x8006cf5c


END:
restoreall
blr
