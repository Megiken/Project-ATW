#To be inserted at 8032C8A4

.include "Common/common.s"

backup
load r20,playerCSSdata2+1
li r21,0
li r23,0
LOOP:
mulli r22,r21,0x24
lbzx r22,r20,r22
addi r21,r21,1
cmpwi r22,0
bne NO
addi r23,r23,1
NO:
cmpwi r21,4
bne LOOP
mr r3,r23
restore
blr
