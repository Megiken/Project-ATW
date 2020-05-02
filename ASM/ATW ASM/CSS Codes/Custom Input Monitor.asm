#To be inserted at 80263250

.include "Common/common.s"

lis r15, 0x8047
ori r15, r15, 0x9D30
lbz r15, 0(r15)
cmpwi r15, 0x2
bne- END

bl STARTVAR
.long 0
STARTVAR:
mflr r20
lwz r21,0(r20)
addi r21,r21,1
stw r21,0(r20)

rlwinm. r0, r7, 0, 26, 26
bne RPRESSED
rlwinm.	r0, r7, 0, 25, 25
bne LPRESSED
rlwinm.	r0, r7, 0, 23, 23
bne APRESSED
rlwinm.	r0, r7, 0, 19, 19
bne STARTPRESSED
rlwinm.	r0, r7, 0, 31, 31
bne DPADLEFTPRESSED
b END

STARTPRESSED:
cmpwi r21,120
blt END
mr r14,r20
li r18,0x1000
branchl r12,checkInput
load r16,0x803F0E08
mulli r15,r17,0x24
add r16,r16,r15
lbz r16,0(r16)
cmpwi r16,0
bne END
li r21,0
stw r21,0(r14)
b REALEND

RPRESSED:
li r18,0x20
branchl r12,checkInput
load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
lbz r20,0(r20)
cmpwi r20,0
bne END
backup
bl LOL
mflr r0
stw r0,4(sp)
stwu sp,-0x18(sp)
stw r31,0x14(sp)
branchl r12,0x80266cfc
LPRESSED:
li r18,0x40
branchl r12,checkInput
load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
lbz r20,0(r20)
cmpwi r20,0
bne END
stb r17,-0x49a7(r13)
backup
bl LOL
mflr r0
stw r0,4(sp)
stwu sp,-0x18(sp)
stw r31,0x14(sp)
branchl r12,0x80266d2c
LOL:
blrl
restore
b END
APRESSED:
li r18,0x100
branchl r12,checkInput

load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
lbz r18,0(r20)
cmpwi r18,3
bne END

branchl r12,getCharData
mflr r14

lbzx r18,r14,r17
load r21,numOfChars
lwz r21,0(r21)
cmpw r18,r21

beq END

mulli r15,r17,4
load r16,firstChars
lwzx r15,r15,r16
subi r15,r15,1
cmpwi r15,-1
beq RANDOM
branchl r12,getCharStruct
mflr r16
lbzx r15,r15,r16


#CHECKSHEIK
cmpwi r15,0x19
bne STORE
li r15,0xf
branchl r12,getCharData
mflr r14
addi r14,r14,108
li r21,1
stbx r21,r14,r17
b STORE

RANDOM:
li r3,26
branchl r12,0x80380580
cmpwi r3,25
bne STORELOL
li r3,15
addi r15,r14,108
li r20,1
stbx r20,r15,r17

STORELOL:
mr r15,r3

STORE:
mr r3,r17
li r4,0
branchl r12,0x8025fb50
load r20,0x803F0E08
mulli r21,r17,0x24
add r20,r20,r21
li r21,0
stb r21,0(r20)
stb r21,-0x1(r20)
stb r15,3(r20)
load r3,doublesType
load r4,doublesByte
lwz r3,0(r3)
lbz r4,0(r4)
cmpwi r4,0
beq LOLS
cmpwi r3,4
bge RANDOM3
cmpwi r17,0
beq RED
sub r21,r3,r17
cmpwi r21,0
beq RED
li r3,1
stb r3,-0x2(r20)
b LOLS

RED:
li r3,0
stb r3,-0x2(r20)
b LOLS

RANDOM3:

load r20,playerCSSdata1-2

li r19,0
stb r19,0(r20)
lwz r3,redTeamMate(rtoc)
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


LOLS:
load r20,0x80480820
mulli r21,r17,0x24
add r20,r20,r21
li r21,0
stb r21,1(r20)
mr r3,r17
branchl r12,0x8025db35
b END

DPADLEFTPRESSED:
li r18,0x861
branchl r12,checkData
cmpwi r17,-1
beq END
branchl r12,getCSSplayers
cmpwi r3,0
bne END

branchl r12,getCharData
mflr r3
load r4,0x01010101
stw r4,0(r3)
addi r3,r3,4
li r4,108
branchl r12,0x8000c160
load r20,0x8045acb8
lis r21,0x1a03
li r22,0
LOOP:
stw r21,0(r20)
addi r20,r20,0x24
addi r22,r22,1
cmpwi r22,4
bne LOOP
li r3,0xdf
li r4,0xfe
li r5,0x80
li r7,7
branchl r12,playsfx
b END



END:
li r7,0
REALEND:
lbz r0, -18862(r13)
