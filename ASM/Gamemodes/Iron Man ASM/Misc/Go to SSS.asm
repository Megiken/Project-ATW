#To be inserted at 80263254

.include "Common/common.s"

loc_0x0:


lwz r20,IMgameOverFlag(rtoc)
cmpwi r20,1
beq END
backupallnor0
cmpwi r20,2
beq GOTOSSS

rlwinm.	r0, r7, 0, 19, 19
beq loc_0x10

load r20,IMcharOrder
lwz r20,0(r20)
cmpwi r20,0
beq CHECKSHEIK
branchl r12,IMgetFirst
mflr r3
bl THING
branchl r12,IMgetSecond
mflr r3
bl THING
branchl r12,0x80018254
GOTOSSS:
lwz r20,IMtype(rtoc)
cmpwi r20,2
bne LOLTHERE
lwz r3,IMmoneyTextStruct(rtoc)
branchl r12,0x803a5cc4
LOLTHERE:

restoreallnor0
li r7,0x1000
b END


THING:
lbz r20,3(r3)
lbz r15,8(r3)
load r17,cssStruct2
mulli r21,r20,8
addi r21,r21,3
stbx r15,r21,r17
lbz r15,11(r3)
addi r21,r21,1
stbx r15,r21,r17
load r17,playerCSSdata2
lbz r20,3(r3)
lwz r15,8(r3)
mulli r21,r20,0x24
stwx r15,r21,r17
blr

CHECKSHEIK:
branchl r12,IMgetFirst
mflr r20
lbz r21,8(r20)
cmpwi r21,0x13
bne CHECKP2
li r21,1
stb r21,2(r20)
CHECKP2:
branchl r12,IMgetFirst
mflr r20
lbz r21,8(r20)
cmpwi r21,0x13
bne LOLTHERE
li r21,1
stb r21,2(r20)
b LOLTHERE

loc_0x10:
restoreallnor0
END:
lbz r0, -18862(r13)
cmplwi	r0, 0
