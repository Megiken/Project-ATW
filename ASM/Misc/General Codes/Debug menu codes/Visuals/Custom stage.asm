#To be inserted at 801c06e8

.include "Common/common.s"

mr r14,r3
loadwz r20,gamemodeTextures
compareieq r20,0,GONORMAL
lwz r20,gameID(rtoc)
compareine r20,0,END
GONORMAL:
li r19,0
compareieq r31,0x24,GOOD
addi r19,r19,1
compareieq r31,0x25,GOOD
addi r19,r19,1
compareieq r31,0xa,GOOD
addi r19,r19,1
compareieq r31,0xc,GOOD
addi r19,r19,1
compareieq r31,0x1c,GOOD
compareieq r31,0x10,PKMN
b END
GOOD:
load r20,BFSkin
mulli r18,r19,4
lwzx r22,r18,r20
compareieq r22,0,END

lwz r4,8(r3)
bl THERE
mflr r3
li r5,16
branchl r12,memcpy
bl THERE
mflr r3
subi r20,r3,1
movetctr 15
LOOP:
lbzu r21,1(r20)
compareieq r21,0x2e,FOUND
bdnz LOOP
b 0
FOUND:
li r21,0x30
stb r21,1(r20)
stb r21,2(r20)
compareieq r22,6,RANDOM
STORE:
subi r23,r22,1
add r21,r21,r23
stb r21,2(r20)
bl THERE
mflr r20
mr r3,r20
branchl r12,0x8033796c
compareieq r3,-1,END
mr r4,r20
b LOL
RANDOM:
li r3,5
branchl r12,randomI
addi r22,r3,1
b STORE

PKMN:
loadwz r20,PSSkin
compareieq r20,0,END
lwz r4,8(r3)
bl THERE
mflr r3
mr r15,r3
li r5,16
branchl r12,memcpy
compareieq r20,6,RANDOMPS
STOREPS:
addi r20,r20,0x2f
stb r20,4(r15)
mr r3,r15
branchl r12,0x8033796c
compareieq r3,-1,END
mr r4,r15
b LOL

RANDOMPS:
li r3,5
branchl r12,randomI
addi r20,r3,1
b STOREPS



THERE:
blrl
.long 0
.long 0
.long 0
.long 0
END:
mr r3,r14
lwz r4,8(r3)
LOL:
