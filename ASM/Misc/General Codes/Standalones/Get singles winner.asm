#To be inserted at 8032C9A8

.include "Common/common.s"

backup
li r20,0
li r23,0
LOOP:
mr r3,r20
branchl r12,getPlayerStatic
lwz r21,0(r3)
compareine r21,2,NEXT
lbz r21,0x8e(r3)
compareieq r21,0,NEXT
addi r23,r23,1
compareieq r23,2,TWO
mr r24,r20
NEXT:
addi r20,r20,1
compareine r20,4,LOOP
b END
TWO:
li r24,-1
END:
mr r3,r24
restore
blr
