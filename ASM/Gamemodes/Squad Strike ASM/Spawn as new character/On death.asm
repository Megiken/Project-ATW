#To be inserted at 800d3338

.include "Common/common.s"

lwz r31,0x2c(r3)
lwz r20,4(r31)
cmpwi r20,NanainID
beq ENDLOL
backupall

load r20,0x8043208f
load r21,0x21000100
stw r21,0x18(r20)
branchl r12,0x80018254

lbz r25,0xc(r31)
mr r3,r25
branchl r12,getOppositeData
lwz r21,IMmoneyOffset(r3)
mr r3,r25
branchl r12,getCorrectData
addi r20,r21,200
stw r20,IMmoneyOffset(r3)
lhz r20,4(r3)
addi r20,r20,1
sth r20,4(r3)

load r24,0x80480590
mulli r15,r25,0x24
add r24,r24,r15

load r20,0x8043208f
lbz r21,0(r20)
stb r21,0(r24)
lbz r21,1(r20)
stb r21,3(r24)
mr r3,r25
branchl r12,getPlayerStatic
lwz r19,0x8c(r3)
li r17,0x6969
lwz r18,0x890(r31)
lwz r16,0(r31)
li r15, 0xFF
stb r15, 7(r16)
stb r15, 6(r16)

lwz r3,0x2c(r16)
li r4,0x235c
branchl r12,zeromem

mr r3,r25
mr r4,r24

branchl r12,0x8016d8ac
mr r3,r25
branchl r12,0x80031ad0

mr r3,r25
branchl r12,getPlayerStatic
stw r19,0x8c(r3)




END:
restoreall
ENDLOL:
