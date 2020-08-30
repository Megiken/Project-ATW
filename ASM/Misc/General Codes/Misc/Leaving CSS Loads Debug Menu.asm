#To be inserted at 801a56b0

.include "Common/common.s"

load r20,0x8045acc2-0x24
load r21,0x8048082a-0x24
movetctr 4
LOOP:
lbzu r22,0x24(r21)
stbu r22,0x24(r20)
bdnz LOOP

lwz r20,gameID(rtoc)
cmpwi r20,0
beq END

li r3,6
b LOL

END:
li r3,1
LOL:
