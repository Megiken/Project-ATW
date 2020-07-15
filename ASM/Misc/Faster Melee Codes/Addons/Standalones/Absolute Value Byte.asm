#To be inserted at 8032c874

.include "Common/common.s"

#input r20
#output r21

li r21,0
cmpwi r20,0xf0
blt PLUS
cmpwi r20,0x100
bgt PLUS
LOOP:
addi r20,r20,1
addi r21,r21,1
cmpwi r20,0x100
bne LOOP
b END
PLUS:
mr r21,r20
END:
blr
