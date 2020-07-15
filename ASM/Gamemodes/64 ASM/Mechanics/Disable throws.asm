#To be inserted at 800dd398

cmpwi r4,0xdd
beq BACK
cmpwi r4,0xde
bne NORMAL
BACK:
blr
NORMAL:
mflr r0
