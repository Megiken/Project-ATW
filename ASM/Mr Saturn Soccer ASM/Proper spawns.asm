#To be inserted at 800327c0

.include "Common/common.s"

bl THERE
b ONE
b TWO
b THREE
b FOUR
THERE:
mflr r20
mr r3,r30
branchl r12,getPlayerStatic
lbz r21,0x47(r3)
li r16,0
LOOP:
mr r3,r16
cmpw r3,r30
beq NEXT
branchl r12,getPlayerStatic
lbz r22,0x47(r3)
cmpw r22,r21
beq FOUND
NEXT:
addi r16,r16,1
cmpwi r16,5
beq LOWEST
b LOOP
FOUND:
cmpw r30,r16
blt LOWEST
mulli r21,r21,8
add r20,r20,r21
addi r20,r20,4
mtctr r20
bctr
LOWEST:
mulli r21,r21,8
add r20,r20,r21
mtctr r20
bctr

ONE:
load r3,0xC2C80000
load r4,0x41200000
mr r0,r4
b END
TWO:
load r3,0xC2480000
load r4,0x41200000
mr r0,r4
b END
THREE:
load r3,0x42480000
load r4,0x41200000
mr r0,r4
b END
FOUR:
load r3,0x42C80000
load r4,0x41200000
mr r0,r4
b END
END:
mulli r5,r30,3728
