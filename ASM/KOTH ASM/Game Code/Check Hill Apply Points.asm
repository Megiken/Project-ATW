#To be inserted at 8006CA9C

.include "Common/common.s"

backupallnomflr

lwz r16,4(r31)
cmpwi r16,0xb
beq END

branchl r12,getKOTHdata
mflr r15

lfs f8,0xb0(r31)
lfs f9,0(r15)
fcmpo 0,f8,f9
blt END
lfs f9,4(r15)
fcmpo 0,f8,f9
bgt END
lfs f8,0xb4(r31)
lfs f9,8(r15)
fcmpo 0,f8,f9
blt END
lfs f9,0xc(r15)
fcmpo 0,f8,f9
bgt END

#Add points

lbz r3,0xc(r31)
li r20,0
load r21,0x80453080
li r10,0x70
LOOP:
cmpw r20,r3
beq NEXT
mulli r22,r20,0xe90
add r22,r22,r21
lwz r23,0(r22)
cmpwi r23,2
beq FOUND
NEXT:
addi r20,r20,1
addi r10,r10,4
b LOOP
FOUND:
branchl r12,getPlayerStatic
lwzx r4,r3,r10
addi r4,r4,1
stwx r4,r3,r10
load r20,0x8046b970
lbz r21,0xc(r31)
mulli r21,r21,0xa8
lwzx r4,r20,r21
addi r4,r4,1

load r20,KOTHgameType
lwz r20,0(r20)
cmpwi r20,0
bne END

load r20,KOTHmaxScore
lwz r20,0(r20)
cmpw r20,r4
bne END
#End game
load r20,timerSeconds
li r21,0
stw r21,0(r20)
li r21,59
sth r21,4(r20)
END:
restoreallnomtlr
lbz	r0, 0x221E (r31)
