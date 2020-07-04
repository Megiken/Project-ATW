#To be inserted at 80081104

.include "Common/common.s"
backup

lwz    r24, -0x4044 (r13)
load  r3,0x80452C68
lwz r3,0x0(r3)
lwz r3,0x28(r3)
branchl r12,0x80368458

li r3,5
load  r4,0x00301306
li r5,0x1455
branchl r12,prim.new

bl THERE
.float -80
.float 80
.float -10
.long 0x89cff0ff
.float 80
.float 80
.float -10
.long 0x89cff0ff
.float 80
.float -20
.float -10
.long 0x89cff0ff
.float -80
.float -20
.float -10
.long 0x89cff0ff
.float -80
.float 80
.float -10
.long 0x89cff0ff
THERE:
mflr r20
li r0,20
mtctr r0
subi r3,r3,4
subi r20,r20,4
LOOP:
lwzu r21,4(r20)
stwu r21,4(r3)
bdnz LOOP

branchl r12,prim.close
mr  r3,r24
branchl r12,0x80368458
restore
lmw	r27, 0x008C (sp)
