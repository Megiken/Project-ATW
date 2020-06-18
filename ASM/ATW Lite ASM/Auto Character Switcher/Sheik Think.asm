#To be inserted at 8016D9B8

.include "Common/common.s"

branchl r12,getCharData
mflr r20
addi r20,r20,108
lbzx r21,r20,r28
cmpwi r21,1
bne ZELDA
li r4,19
b END
ZELDA:
li r4,18
END:
