#To be inserted at 8016D9B8

.include "Common/common.s"

branchl r12,IMgetFirst
mflr r20
lbz r21,3(r20)
cmpw r21,r28
beq GO
branchl r12,IMgetSecond
mflr r20
GO:
lbz r21,2(r20)
cmpwi r21,1
bne ZELDA
li r4,19
b END
ZELDA:
li r4,18
END:
