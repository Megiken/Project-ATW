#To be inserted at 802668a8

.include "Common/common.s"

addi	r30, r3, 0
backup

lis r17,0x803e
ori r17,r17,0x6742
li r16,0x7261
sth r16,0(r17)

#Set doubles

DUBS:

load r20,doublesType
lwz r20,0(r20)
cmpwi r20,1
blt TESTDUBS
cmpwi r20,3
bgt TESTDUBS
b DOUBLES


TESTDUBS:

load r22,doublesByte
li r21,0
stb r21,0(r22)

b NEXT

DOUBLES:

load r22,doublesByte
load r20,doublesType
lwz r20,0(r20)
cmpwi r20,0
beq NO
cmpwi r20,5
blt YES
branchl r12,getCSSplayers
compareile r3,2,NEXT
li r3,40
branchl r12,randomI
cmpwi r3,28
blt NO

YES:
li r21,1
stb r21,0(r22)

cmpwi r20,4
blt NEXT

load r20,playerCSSdata1-2
AGAINLOL:
li r3,30
branchl r12,randomI

li r4,10
divw r3,r3,r4
addi r3,r3,1
lwz r4,redTeamMate(rtoc)
compareeq r4,r3,AGAINLOL
stw r3,redTeamMate(rtoc)


li r19,1
LOOPING:
cmpw r19,r3
mulli r21,r19,0x24
beq REDTEAM
li r22,1
stbx r22,r21,r20
b NEXTLOOP
REDTEAM:
li r22,0
stbx r22,r21,r20
NEXTLOOP:
addi r19,r19,1
cmpwi r19,4
bne LOOPING

b NEXT

NO:
li r21,0
stb r21,0(r22)

NEXT:



END:
lis r15,0x804d
li r16,0
stw r16,0x6730(r15)
restore
