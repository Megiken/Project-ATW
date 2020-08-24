#To be inserted at 80263250

.include "Common/common.s"

backupallnor0

lis r15, 0x8047
ori r15, r15, 0x9D30
lbz r15, 0(r15)
cmpwi r15, 0x2
bne- END


rlwinm.	r0, r7, 0, 29, 29
bne DOWNPADPRESSED
b END





DOWNPADPRESSED:



li r18,4
branchl r12,checkInput
compareieq r17,-1,END
li r20,0
movetctr 4
addi r21,rtoc,SynData
LOOP:
lbzx r22,r21,r20
compareeq r22,r17,FOUND
addi r20,r20,1
bdnz LOOP
FOUND:
compareigt r20,1,SECOND
li r20,0
b LOL
SECOND:
li r20,1
LOL:
mulli r20,r20,2
lbzx r22,r21,r20
addi r23,r20,1
lbzx r24,r23,r21
stbx r22,r23,r21
stbx r24,r21,r20
lbz r20,SynData(rtoc)
bl SETLEFT
lbz r20,SynData+1(rtoc)
bl SETRIGHT
lbz r20,SynData+2(rtoc)
bl SETLEFT
lbz r20,SynData+3(rtoc)
bl SETRIGHT

b END

SETLEFT:
backup
mulli r22,r20,0x4 #get offset
subi r23,r13,UCFTextPointers #get pointers
lwzx r3,r22,r23 #get players pointer
li r4,0
bl TEXT.LEFT
mflr r5
branchl r12,0x803a70a0
restore
blr
SETRIGHT:
backup
branchl r12,removePlayerFromCSS
mr r3,r20
branchl r12,CSS_UpdateCSPInfo
mulli r22,r20,0x4 #get offset
subi r23,r13,UCFTextPointers #get pointers
lwzx r3,r22,r23 #get players pointer
li r4,0
bl TEXT.RIGHT
mflr r5
branchl r12,0x803a70a0
restore
blr

TEXT.LEFT:
blrl
.string "Side: Left"
.align 2

TEXT.RIGHT:
blrl
.string "Side: Right"
.align 2


END:
restoreallnor0
TRUEEND:
lbz	r0, -0x49AE (r13)
