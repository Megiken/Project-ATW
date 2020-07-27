#To be inserted at 80266890

.include "Common/common.s"

backupallnomflr
lwz r20,gameID(rtoc)
cmpwi r20,0
bne END 
load r20,BFSkin-4
bl OFFSETS
mflr r19
subi r19,r19,4
load r18,0x2e303074
load r17,0x2e646174
li r0,6
mtctr r0
LOOP:
lwzu r21,4(r20)
lwzu r22,4(r19)
stw r17,0(r22)
cmpwi r21,0
beq NEXT
subi r21,r21,1
mulli r21,r21,0x100
add r23,r18,r21
stw r23,0(r22)

NEXT:
bdnz LOOP

load r20,PSSkin
lwz r20,0(r20)
load r22,0x804d45ec
cmpwi r20,0
bne CUSTOM
li r21,0x73
stb r21,0(r22)
b THERE
CUSTOM:
li r21,0x30
subi r20,r20,1
addi r21,r20,r21
stb r21,0(r22)
THERE:
load r20,CSSSkin
lwz r20,0(r20)
load r22,0x803f115b
cmpwi r20,0
bne CUSTOM2
load r21,0x2e757364
stw r21,0(r22)
b END
CUSTOM2:
subi r20,r20,1
mulli r20,r20,0x100
add r20,r18,r20
stw r20,0(r22)
b END

OFFSETS:
blrl
.long 0x803E7E32
.long 0x803E7F8a
.long 0x803e2745
.long 0x803e2745
.long 0x803e0e55
.long 0x803e6741

END:
restoreallnomtlr
lis	r4, 0x803F
