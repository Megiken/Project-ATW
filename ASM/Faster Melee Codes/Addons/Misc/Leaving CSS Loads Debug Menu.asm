#To be inserted at 801a56b0

.include "Common/common.s"

lwz r20,gameID(rtoc)
cmpwi r20,0
beq END

li r20,0
stw r20,gameID(rtoc)

branchl r12,removerestoreGCT

END:
li r3,1
LOL:
