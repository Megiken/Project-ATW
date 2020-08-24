#To be inserted at 80263250

.include "Common/common.s"

backupall

lis r15, 0x8047
ori r15, r15, 0x9D30
lbz r15, 0(r15)
cmpwi r15, 0x2
bne- END

rlwinm.	r0, r7, 0, 20, 20
bne YPRESSED
ISA:
rlwinm.	r0, r7, 0, 21, 21
bne XPRESSED
ISAA:
rlwinm.	r0, r7, 0, 23, 23
bne APRESSED
rlwinm.	r0, r7, 0, 19, 19
bne STARTPRESSED
rlwinm.	r0, r7, 0, 29, 29
bne DOWNPADPRESSED
b END

XPRESSED:

lwz r23,IMtype(rtoc)
cmpwi r23,1
bne ISAA

li r18,0x0440
branchl r12,checkData
cmpwi r17,-1
beq ISAA
mr r3,r17
branchl r12,getCorrectData
cmpwi r3,-1
beq ISAA
lhz r23,IMpickban+2(rtoc)
cmpwi r23,0
bne ISAA

load r20,playerCSSdata2

lbz r21,3(r3)

mulli r22,r21,0x24
lbzx r21,r22,r20
cmpwi r21,0x1a
bge CHECKAA


cmpwi r21,0x12
bne GOCHECKCLONE2

load r23,digitalData
lbz r24,3(r3)
mulli r24,r24,0x44
lwzx r24,r24,r23
andi. r25,r24,0x450
cmpwi r25,0x450
beq GOCHECKCLONE2

li r21,0x13

GOCHECKCLONE2:
lbz r17,3(r3)
branchl r12,IMgetCorrectBans
branchl r12,checkBanClone
cmpwi r17,1
bne CHECKAA
mr r9,r3
cmpwi r14,1
beq GETTHESECOND
branchl r12,IMgetFirst
b OKAYLETSGO
GETTHESECOND:
branchl r12,IMgetSecond
OKAYLETSGO:
mflr r3
branchl r12,checkClone
cmpwi r17,1
bne CHECKAA
mr r3,r9


lbzx r21,r22,r20
cmpwi r21,0x12
bne NOTSHEIK2

load r23,digitalData
lbz r24,3(r3)
mulli r24,r24,0x44
lwzx r24,r24,r23
andi. r25,r24,0x450
cmpwi r25,0x450
beq NOTSHEIK2

lbzx r21,r22,r20
addi r21,r21,1
b STORE2


NOTSHEIK2:

lbzx r21,r22,r20

STORE2:
lbz r17,3(r3)
branchl r12,IMgetCorrectBans
lwz r20,0(r25)
addi r22,r25,4
stbx r21,r22,r20
addi r20,r20,1
stw r20,0(r25)
mr r15,r3
li r3,0xdf
li r4,0xfe
li r5,0x80
li r7,7
branchl r12,playsfx

addi r20,r14,IMpickban
subi r20,r20,1
li r21,1
stbx r21,r20,rtoc
lhz r20,IMpickban(rtoc)
cmpwi r20,0x0101
bne TEXT2
li r20,1
sth r20,IMpickban+2(rtoc)

TEXT2:

li r20,1
branchl r12,updateBanText


PLAYSFX:


b ISAA



YPRESSED:

li r18,0x0840
branchl r12,checkData
cmpwi r17,-1
beq ISA
mr r3,r17
branchl r12,getCorrectData
cmpwi r3,-1
beq ISA

lwz r23,IMtype(rtoc)
cmpwi r23,1
bne STARTY

lhz r20,IMpickban+2(rtoc)
cmpwi r20,1
bne ISA


STARTY:


lwz r20,IMtype(rtoc)
cmpwi r20,2
beq NONUMOFCHARS

lhz r20,6(r3)
load r21,IMnumOfChars
lwz r21,0(r21)
cmpw r20,r21
beq ISA

NONUMOFCHARS:

load r20,playerCSSdata2

lbz r21,3(r3)

mulli r22,r21,0x24
lbzx r21,r22,r20
cmpwi r21,0x1a
bge CHECKA


cmpwi r21,0x12
bne GOCHECKCLONE

load r23,digitalData
lbz r24,3(r3)
mulli r24,r24,0x44
lwzx r24,r24,r23
andi. r25,r24,0x850
cmpwi r25,0x850
beq GOCHECKCLONE

li r21,0x13

GOCHECKCLONE:

mr r11,r21
branchl r12,checkClone
cmpwi r17,1
bne CHECKA


lwz r23,IMtype(rtoc)
cmpwi r23,2
bne NOPRICE

lwz r23,IMmoneyOffset(r3)
load r24,IMcharCost
mulli r25,r21,4
lwzx r25,r24,r25
cmpw r23,r25
blt CHECKA
sub r23,r23,r25
stw r23,IMmoneyOffset(r3)
mr r26,r23

branchl r12,IMupdateText




NOPRICE:
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
b STORE


NOTSHEIK:

lwzx r21,r22,r20



STORE:
mr r10,r21
lwz r23,IMtype(rtoc)
cmpwi r23,1
bne ACTUALLY
mr r21,r11
cmpwi r14,1
beq GETONE
branchl r12,IMgetFirstBans
b OKLOL
GETONE:
branchl r12,IMgetSecondBans
OKLOL:
mflr r25
branchl r12,checkBanClone
cmpwi r17,1
bne CHECKAA
mr r21,r10



ACTUALLY:

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

lhz r23,IMtype+2(rtoc)
cmpwi r23,1
bne PLAYSFX2

addi r20,r14,IMpickban
subi r20,r20,1
li r21,0
stbx r21,r20,rtoc
lhz r20,IMpickban(rtoc)
cmpwi r20,0
bne TEXTLOL
li r20,0
sth r20,IMpickban+2(rtoc)
TEXTLOL:
li r20,0
branchl r12,updateBanText


PLAYSFX2:



b ISA

CHECKA:
li r3,0xaf
li r4,0xfe
li r5,0x80
li r7,3
branchl r12,playsfx
b ISA

CHECKAA:
li r3,0xaf
li r4,0xfe
li r5,0x80
li r7,3
branchl r12,playsfx
b ISAA

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

lwz r20,IMtype(rtoc)
cmpwi r20,2
bne END
load r20,IMplayerMoney
lwz r20,0(r20)
stw r20,IMmoneyOffset(r25)


b END

STARTPRESSED:

lwz r20,IMtype(rtoc)
cmpwi r20,2
beq END

load r21,IMnumOfChars
lwz r21,0(r21)
branchl r12,IMgetFirst
mflr r20
lhz r20,6(r20)
cmpw r20,r21
bne NOSTART
branchl r12,IMgetSecond
mflr r20
lhz r20,6(r20)
cmpw r20,r21
bne NOSTART
b END

NOSTART:
restoreall
li r7,0
b TRUEEND


DOWNPADPRESSED:

lwz r20,IMtype(rtoc)
cmpwi r20,2
beq CLEAR
cmpwi r20,0
bne END
CLEAR:

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
restoreall
TRUEEND:
