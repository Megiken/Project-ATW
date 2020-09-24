#To be inserted at 8032C9A4

.include "Common/common.s"

backup
li r20,0
li r22,0
li r23,0
LOOP:
mr r3,r20
branchl r12,getPlayerStatic
lbz r21,0x8e(r3)
compareieq r21,0,NEXT
lbz r21,0x47(r3)
compareieq r21,0,RED
addi r23,r23,1
b NEXT
RED:
addi r22,r22,1
NEXT:
addi r20,r20,1
compareine r20,4,LOOP
compareeq r23,r22,INVALID
comparegt r23,r22,BLUEWINS
li r22,0
b THERE
BLUEWINS:
li r22,1
THERE:
li r20,0
li r23,0
LOOP2:
mr r3,r20
branchl r12,getPlayerStatic
lbz r21,0x47(r3)
comparene r21,r22,NEXT2
compareine r23,0,SECOND
addi r23,r23,1
mr r24,r20
b NEXT2
SECOND:
mr r25,r20
b END
NEXT2:
addi r20,r20,1
compareine r20,4,LOOP2
INVALID:
li r24,-1
li r25,-1
END:
mr r3,r24
mr r4,r25
restore
blr
