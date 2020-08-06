#To be inserted at 80263250

.include "Common/common.s"

backupallnor0

lis r15, 0x8047
ori r15, r15, 0x9D30
lbz r15, 0(r15)
cmpwi r15, 0x2
bne- END

rlwinm.	r0, r7, 0, 23, 23
bne APRESSED
CHECKSTART:
rlwinm.	r0, r7, 0, 19, 19
bne STARTPRESSED
CHECKDPAD:
rlwinm.	r0, r7, 0, 29, 29
bne DOWNPADPRESSED
b END


APRESSED:

branchl r12,getASdata
mflr r14
lhz r20,0(r14)
cmpwi r20,4
blt CHECKSTART

li r18,0x100
branchl r12,checkInput

cmpwi r17,-1
beq CHECKSTART
sth r17,0(r14)


load r20,cssStruct
lwz r20,0(r20)
li r21,3
sub r21,r21,r17
addi r21,r21,1
mtctr r21
LOOP:
lwz r20,8(r20)
bdnz LOOP
lwz r20,0x2c(r20)

li r22,22
branchl r12,Int2Float
fmr f9,f8
li r22,0
branchl r12,Int2Float
fsubs f9,f8,f9
stfs f9,0x10(r20)
mulli r20,r17,0x24
load r21,playerCSSdata2
load r22,0x1a000000
stwx r22,r21,r20

b CHECKSTART

STARTPRESSED:

li r18,0x1000
branchl r12,checkInput
cmpwi r17,-1
beq CHECKDPAD
branchl r12,getASdata
mflr r14
lhz r20,0(r14)
cmpw r20,r17
beq CHECKDPAD
cmpwi r20,4
bgt CHECKDPAD
mulli r20,r20,0x24
load r21,playerCSSdata2
lbzx r20,r21,r20
cmpwi r20,0x1a
beq CHECKDPAD
sth r17,2(r14)
load r20,playerCSSdata1
mulli r21,r17,0x24
li r22,0
stbx r22,r21,r20
load r20,playerCSSdata2
addi r20,r20,1
stbx r22,r21,r20
mr r3,r17
mr r4,r3
branchl r12,0x8025fb50
mr r3,r17
branchl r12,0x8025db34


li r0,0
b END

DOWNPADPRESSED:

lwz r20,IMtype(rtoc)
cmpwi r20,2
beq CLEAR
cmpwi r20,0
bne END
CLEAR:

li r18,4
branchl r12,checkInput

cmpwi r17,-1
beq END
branchl r12,getASdata
mflr r14
lhz r20,0(r14)
cmpw r20,r17
bne END

# clear struct and remove player 1 from css

branchl r12,removePlayerFromCSS
li r20,5
sth r20,0(r14)

li r3,0xac
li r4,0xfe
li r5,0x80
li r7,3
branchl r12,playsfx
b END



END:
restoreallnor0
TRUEEND:
