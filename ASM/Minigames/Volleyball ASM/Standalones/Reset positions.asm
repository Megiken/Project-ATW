#To be inserted at 8032C960

.include "Common/common.s"

#input r14 = port

#output r15 = x
#output r16 = y

backup

bl THERE
b TWO
b ONE
b THREE
b FOUR
THERE:
mflr r20
mr r3,r14
branchl r12,getPlayerStatic
lbz r21,0x47(r3)
li r16,0
LOOP:
mr r3,r16
cmpw r3,r14
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
cmpw r14,r16
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
load r15,0xc36af0d4
load r16,0x3f8b7d41
load r17,0x3f800000
b END
TWO:
load r15,0xC351F0D4
load r16,0x3f8b7d41
load r17,0x3f800000
b END
THREE:
load r15,0xc2be7e14
load r16,0x3f8b7d41
load r17,0xbf800000
b END
FOUR:
load r15,0xC2F07E14
load r16,0x3f8b7d41
load r17,0xbf800000
b END
END:

restore
blr
