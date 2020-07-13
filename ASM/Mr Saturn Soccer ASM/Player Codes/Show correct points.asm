#To be inserted at 80166a18

.include "Common/common.s"

mr r3,r26
branchl r12,getPlayerStatic
mr r21,r3
li r18,0x70
li r20,0
LOOP:
lwzx r19,r18,r21
cmpwi r19,0
ble NEXT
mr r3,r20
branchl r12,getPlayerStatic
lbz r22,0x47(r21)
lbz r23,0x47(r3)
cmpw r22,r23
bne END
NEXT:
addi r20,r20,1
addi r18,r18,4
cmpwi r20,5
bne LOOP
li r19,0
END:
mr r3,r19
cmpwi r3,7
bne LOL
load r14,timerSeconds
li r12,0
stw r12,0(r14)
li r12,59
sth r12,4(r14)
LOL:
stw	r3, 0x0084 (r25)
