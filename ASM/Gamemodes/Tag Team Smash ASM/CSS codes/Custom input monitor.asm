#To be inserted at 80263250

.include "Common/common.s"

backupallnor0

lis r15, 0x8047
ori r15, r15, 0x9D30
lbz r15, 0(r15)
cmpwi r15, 0x2
bne- END

rlwinm.	r0, r7, 0, 20, 20
bne YPRESSED
ISA:
rlwinm.	r0, r7, 0, 23, 23
bne APRESSED
rlwinm.	r0, r7, 0, 19, 19
bne STARTPRESSED
rlwinm.	r0, r7, 0, 29, 29
bne DOWNPADPRESSED
b END


YPRESSED:

li r18,0x0840
branchl r12,checkData
cmpwi r17,-1
beq ISA
mr r3,r17
branchl r12,getCorrectData
cmpwi r3,-1
beq ISA


lhz r20,6(r3)
cmpwi r20,2
beq ISA

load r20,playerCSSdata2

lbz r21,3(r3)

mulli r22,r21,0x24
lbzx r21,r22,r20
cmpwi r21,0x1a
bge CHECKA

loadwz r15,allowDuplicates
compareieq r15,0,FIRSTONE

lhz r15,6(r3)
compareieq r15,0,FIRSTONE
lbz r15,8(r3)
compareeq r15,r21,CHECKA

FIRSTONE:

load r15,0x8043208f
lbz r16,3(r3)
mulli r16,r16,8
lbzx r14,r16,r15
compareieq r14,0x21,CHECKA


cmpwi r21,0x12
bne GOCHECKCLONE

lhz r20,6(r3)
compareine r20,0,CHECKA

load r23,digitalData
lbz r24,3(r3)
mulli r24,r24,0x44
lwzx r24,r24,r23
andi. r25,r24,0x850
cmpwi r25,0x850
beq GOCHECKCLONE

li r21,0x13

GOCHECKCLONE:


lbzx r21,r22,r20
cmpwi r21,0x12
bne NOTSHEIK

load r23,digitalData
lbz r24,3(r3)
mulli r24,r24,0x44
lwzx r24,r24,r23
andi. r25,r24,0x850
cmpwi r25,0x850
beq NOTSHEIK

lwzx r21,r22,r20
lis r24,0x0100
add r21,r21,r24
li r24,1
stb r24,2(r3)
b STORE


NOTSHEIK:

lwzx r21,r22,r20



STORE:

lhz r20,6(r3)
mulli r22,r20,4
addi r22,r22,8
stwx r21,r3,r22

addi r20,r20,1
sth r20,6(r3)


lbz r3,3(r3)
branchl r12,getCorrectData
mr r15,r3
li r3,0xdf
li r4,0xfe
li r5,0x80
li r7,7
branchl r12,playsfx

b ISA



CHECKA:
li r3,0xaf
li r4,0xfe
li r5,0x80
li r7,3
branchl r12,playsfx
b ISA

APRESSED:

lwz r20,IMcount(rtoc)
cmpwi r20,2
bge END

li r18,0x100
branchl r12,checkInput

load r20,playerCSSdata2
mulli r21,r17,0x24
lhzx r21,r21,r20
cmpwi r21,0x1a03
bne END

lwz r20,IMcount(rtoc)
cmpwi r20,0
beq FIRST
branchl r12,IMgetSecond
b GOT
FIRST:
branchl r12,IMgetFirst
GOT:
mflr r20
lis r21,0x6969
add r21,r21,r17
stw r21,0(r20)
mr r25,r20


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
lwz r20,IMcount(rtoc)
addi r20,r20,1
stw r20,IMcount(rtoc)
li r7,0

b END

STARTPRESSED:



branchl r12,IMgetFirst
mflr r20
lhz r20,6(r20)
cmpwi r20,2
bne NOSTART
branchl r12,IMgetSecond
mflr r20
lhz r20,6(r20)
cmpwi r20,2
bne NOSTART
li r0,0
b END

NOSTART:
restoreallnor0
li r0,1
li r7,0
b TRUEEND


DOWNPADPRESSED:



li r18,4
branchl r12,checkInput

branchl r12,IMgetFirst
mflr r20
lbz r21,3(r20)
cmpw r21,r17
beq CLEAR2
branchl r12,IMgetSecond
mflr r20
lbz r21,3(r20)
cmpw r21,r17
bne END


CLEAR2:
mr r23,r20
branchl r12,IMclearStruct
li r3,0xac
li r4,0xfe
li r5,0x80
li r7,3
branchl r12,playsfx
b END



END:
restoreallnor0
TRUEEND:
lbz	r0, -0x49AE (r13)
