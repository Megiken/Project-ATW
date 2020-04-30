#To be inserted at 8032C8dc

.include "Common/common.s"

#input r26 = int
#stores to r4
backup
li r23,0
li r27,10000
LOOP2:
divw r25,r26,r27
cmpwi r25,0
beq NEXT
LOOP3:
li r22,1
mr r28,r25
addi r28,r28,0x30
stbx r28,r23,r4
addi r23,r23,1
mullw r25,r25,r27
sub r26,r26,r25
b NOZERO
NEXT:
cmpwi r22,0
beq NOZERO
li r25,0x30
stbx r25,r23,r4
addi r23,r23,1
NOZERO:
li r25,10
divw r27,r27,r25
cmpwi r27,0
bne LOOP2
mr r16,r23
restore

blr
