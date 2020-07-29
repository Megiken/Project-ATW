#To be inserted at 800d3338

.include "Common/common.s"

lwz r31,0x2c(r3)
lwz r20,4(r31)
cmpwi r20,NanainID
beq ENDLOL
backupall
lbz r25,0xc(r31)
mr r3,r25
branchl r12,getOppositeData
lwz r21,IMmoneyOffset(r3)
mr r3,r25
branchl r12,getCorrectData
addi r20,r21,180
stw r20,IMmoneyOffset(r3)
lhz r20,4(r3)
addi r20,r20,1
sth r20,4(r3)


END:
restoreall
ENDLOL:
