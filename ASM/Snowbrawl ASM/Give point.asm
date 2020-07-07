#To be inserted at 8006cc7c

.include "Common/common.s"

backupall
mr r31,r3
load r23,doublesByte
lbz r23,0(r23)
cmpwi r23,0
beq NODOUBLES
lbz r24,0x61b(r31)
NODOUBLES:
lbz r22,0xc(r31)
lwz r20,0x1868(r31)
lhz r21,0(r20)
cmpwi r21,6
bne END
lwz r20,0x2c(r20)
lwz r21,0x10(r20)
cmpwi r21,3
bne END
lwz r20,0x518(r20)
lwz r20,0x2c(r20)
lbz r3,0xc(r20)
cmpw r3,r22
beq END
cmpwi r23,0
beq REAL
lbz r25,0x61b(r20)
cmpw r25,r24
beq END
REAL:
cmpwi r23,0
beq GETLOL
li r26,0
LOOP:
mr r3,r26
branchl r12,getPlayerData
lbz r27,0x61b(r3)
cmpw r27,r25
bne FOUND
addi r26,r26,1
b LOOP
FOUND:
mulli r26,r26,4
addi r10,r26,0x70
lbz r3,0xc(r20)
b STORE
GETLOL:
li r20,0
load r21,0x80453080
li r10,0x70
LOOP2:
cmpw r20,r3
beq NEXT
mulli r22,r20,0xe90
add r22,r22,r21
lwz r23,0(r22)
cmpwi r23,2
beq FOUND2
NEXT:
addi r20,r20,1
addi r10,r10,4
b LOOP2
FOUND2:
STORE:
branchl r12,getPlayerStatic
lwzx r4,r3,r10
addi r4,r4,1
stwx r4,r3,r10
load r20,0x8046b970
lbz r21,0xc(r31)
mulli r21,r21,0xa8
lwzx r4,r20,r21
addi r4,r4,1
END:
restoreall
mflr r0
