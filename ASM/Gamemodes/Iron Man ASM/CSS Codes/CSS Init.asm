#To be inserted at 802669dc

.include "Common/common.s"

lwz r20,IMgameOverFlag(rtoc)
cmpwi r20,2
beq END
lwz r20,IMtype(rtoc)
cmpwi r20,0
beq END
cmpwi r20,1
beq END
cmpwi r20,2
beq MONEY
b END

MONEY:
backupall
li r22,0
stw r21,0(r20)
li r17,0
bl GETCOORDINATES
mflr r15
li 	r3,0
load 	r4,0x804a1f58			#get text objects ID?
lwz 	r4,0x0(r4)
branchl r12,0x803a6754
mr	r29,r3					#backup text pointer
li	r3,0x1
stb 	r3,0x4A(r29)
stb 	r3,0x49(r29)
li r3,-1
stw r3,0x30(r29)
LOOP:

#set colour to white
mr r3,r29
bl TEXT
mflr r4
li r24,0
stw r24,0(r4)
stw r24,4(r4)
load r24,IMcharCost
#Get text loop
mulli r25,r17,4
lwzx r26,r25,r24

branchl r12,storeAscii
cmpwi r17,0x12
bne STORETEXT

li r22,0x7c
stbx r22,r16,r4
li r22,0
add r4,r4,r16
addi r4,r4,1
addi r25,r25,4
lwzx r26,r25,r24
branchl r12,storeAscii
bl TEXT
mflr r4
addi r17,r17,1
STORETEXT:

lfs f1,0x10(r4)
stfs f1,0x24(r29)
stfs f1,0x28(r29)
mulli r18,r17,8
lfsx f1,r18,r15
addi r18,r18,4
lfsx f2,r18,r15

li r5,0
branchl r12,0x803a6b98
addi r17,r17,1
cmpwi r17,26
bne LOOP


b TRUEEND

GETCOORDINATES:
blrl
.float 347
.float -249 #falcon
.float 233
.float -249 #dk
.float -343
.float -131 #fox
.float 116
.float -14 #gnw
.float 2
.float -131 #kirby
.float -114
.float -249 #bowser
.float 347
.float -131 #link
.float -229
.float -249 #luigi
.float -343
.float -249 #mario
.float 233
.float -14 #marth
.float 2
.float -14 #mewtwo
.float -229
.float -131 #ness
.float 2
.float -249 #peach
.float -229
.float -14 #pikachu
.float -114
.float -131 #ics
.float -114
.float -14 #puff
.float 116
.float -131 #samus
.float 116
.float -249 #yoshi
.float 233
.float -131 #zelda
.float 233
.float -131  #sheik
.float -457
.float -125 #falco
.float 460
.float -125 #yl
.float -457
.float -243 #doc
.float 347
.float -9 #roy
.float -343
.float -9 #pichu
.float 460
.float -243 #ganon



TEXT:
blrl
.long 0
.long 0
.long 0
.long 0
.long 0x3D79DB22



TRUEEND:
restoreall
END:
lwz	r0, 0x0024 (sp)
