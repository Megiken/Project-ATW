#To be inserted at 801a56b0

.include "Common/common.s"

lwz r20,gameID(rtoc)
cmpwi r20,0
beq END

li r3,6
b LOL

END:
li r3,1
LOL:
