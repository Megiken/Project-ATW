#To be inserted at 80178528

.include "Common/memcard.s"

backup
branchl r12,getCharData
mflr r14
load r15,gameType
lwz r15,0(r15)
mulli r15,r15,0x18
bl FUNCTIONDATA
mflr r16
add r15,r15,r16
load r16,0x8045acb8
load r19,0x80479da4
li r18,0x0
load r22,doublesByte
lbz r22,0(r22)
cmpwi r22,0
beq ffaEndLooplol

#Doubles get winning team ID
DOUBLESLOOP:

load r3,0x8047c028
branchl r12,0x801654a0
mr r25,r3
load r26,playerCSSdata1-2
li r18,0

doublesEndLoop:
mulli r3,r18,0x24
lbzx r3,r3,r26
cmpw r3,r25
bne doublesLost

#Win

addi r22,r15,0xc
b LOOP2

doublesLost:
mr r22,r15
b LOOP2

NEXT2:
addi r18,r18,1
cmpwi r18,0x4
blt doublesEndLoop
b END

LOOP2:
lwz r23,0(r22)
cmpwi r23,0
beq NEXT2
addi r22,r22,4
mtctr r23
bctrl
cmpwi r20,3
bne LOOP2
li r20,0
b NEXT2


ffaEndLooplol:
load r3,0x8047c028
branchl r12,0x80165418
mr r25,r3

ffaEndLoop:

mr r3,r18
branchl r12,0x8003241c            #branch to PlayerBlock_LoadSlotType
cmpwi r3,0x3                     #check if slot is empty
beq NEXT

cmpw r18,r25
bne ffaLost

#Win
addi r22,r15,0xc
b LOOP


ffaLost:
mr r22,r15
b LOOP

NEXT:
addi r18,r18,1
cmpwi r18,0x4
blt ffaEndLoop
b END




FUNCTIONDATA:
blrl

.long removePlayerCheck
.long removeCharacter
.long 0

.long 0
.long 0
.long 0

.long removePlayerCheck
.long removeCharacter
.long 0

.long swapCharacter
.long 0
.long 0

.long 0
.long 0
.long 0

.long removePlayerCheck
.long removeCharacter
.long 0

.long swapCharacter
.long 0
.long 0

.long removePlayerCheck
.long removeCharacter
.long 0




LOOP:
lwz r23,0(r22)
cmpwi r23,0
beq NEXT
addi r22,r22,4
mtctr r23
bctrl
cmpwi r20,3
bne LOOP
li r20,0
b NEXT

END:
restore
lbz r0,0x98(r26)
