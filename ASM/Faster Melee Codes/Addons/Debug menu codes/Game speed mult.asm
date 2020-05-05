#To be inserted at 801a584c

.include "Common/common.s"

addi	r29, r4, 0

load r15,0x8045acb8
li r16,0
LOOPAGAIN:
mulli r17,r16,0x24
addi r17,r17,0xc
lbzx r18,r17,r15
ori r18,r18,1
ori r18,r18,8
ori r18,r18,0x20
xori r18,r18,1
xori r18,r18,8
xori r18,r18,0x20
stbx r18,r17,r15
addi r17,r17,8
sthx r19,r17,r15
cmpwi r16,3
beq READY
addi r16,r16,1
b LOOPAGAIN

READY:

load r20,gameSpeedMult
lwz r20,0(r20)
stw r20,0x3c(r29)
load r20,speedFlag
lwz r20,0(r20)
cmpwi r20,0
beq END
cmpwi r20,1
beq SLOW
load r20,0x83d60
b STORE
SLOW:
load r20,0x149970
STORE:
load r21,frameRate
stw r20,0(r21)


END:

load r20,percentStaminaFlag
lwz r20,0(r20)
cmpwi r20,0
beq TRUEEND
load r15,0x8045acb8
li r16,0
cmpwi r20,1
beq PERCENT
load r19,staminaAmount
lwz r19,0(r19)
LOOP:
mulli r17,r16,0x24
addi r17,r17,0xc
lbzx r18,r17,r15
ori r18,r18,1
stbx r18,r17,r15
addi r17,r17,8
sthx r19,r17,r15
cmpwi r16,3
beq TRUEEND
addi r16,r16,1
b LOOP
PERCENT:
mulli r17,r16,0x24
addi r17,r17,0x12
li r19,300
sthx r19,r17,r15
cmpwi r16,3
beq TRUEEND
addi r16,r16,1
b PERCENT


TRUEEND:

load r20,bodyFlag
lwz r20,0(r20)
cmpwi r20,0
beq LOLEND
load r15,0x8045acb8
li r16,0
cmpwi r20,1
beq METAL

LOOPLOL:

mulli r17,r16,0x24
addi r17,r17,0xc
lbzx r18,r17,r15
ori r18,r18,8
stbx r18,r17,r15
addi r17,r17,8
sthx r19,r17,r15
cmpwi r16,3
beq LOLEND
addi r16,r16,1
b LOOPLOL


METAL:
mulli r17,r16,0x24
addi r17,r17,0xc
lbzx r18,r17,r15
ori r18,r18,0x20
stbx r18,r17,r15
addi r17,r17,8
sthx r19,r17,r15
cmpwi r16,3
beq LOLEND
addi r16,r16,1
b METAL

LOLEND:
