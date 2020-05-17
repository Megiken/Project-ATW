#To be inserted at 8032c850

.include "Common/common.s"

backup

cmpwi r3,1
bne END
lwz r22,gameID(rtoc)
cmpwi r22,0
beq END

li r3,1
branchl r12,0x80024030
li r3,2
branchl r12,0x801a42f8
branchl r12,0x801a4b60
li r3,0

END:
restore
blr
