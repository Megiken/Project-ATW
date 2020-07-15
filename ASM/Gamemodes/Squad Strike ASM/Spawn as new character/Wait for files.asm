#To be inserted at 800d3e20

.include "Common/common.s"

backupallnor0
lbz r3,0xc(r5)
branchl r12,getCorrectData
cmpwi r3,-1
beq END
lwz r20,IMmoneyOffset(r3)
subi r20,r20,1
stw r20,IMmoneyOffset(r3)
mr r0,r20
END:
restoreallnor0
cmpwi r0,0
