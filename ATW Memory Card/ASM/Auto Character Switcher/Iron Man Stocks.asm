#To be inserted at 8016d310

.include "Common/memcard.s"

backupallnomflr

load r20,0x8046b6a0
lbz r20,0x8(r20)
cmpwi r20,0
beq ENDAGAIN
load r20,saveStocks
lwz r20,0(r20)
cmpwi r20,1
beq END
#Change stocks

li r17,0
LOOP:
mr r3,r17
branchl r12,getPlayerStatic
lbz r20,0x8e(r3)
cmpwi r20,0
bgt STORE
load r21,0x8045bf14
lbz r20,0(r21)
STORE:
addi r19,r17,ATWstocks
stbx r20,r19,rtoc
cmpwi r17,4
addi r17,r17,1
bne LOOP


END:
load r16,0x69696969
stw r16,spawnVar(rtoc)
branchl r12,getItemVars
mflr r3
li r4,0x3c
branchl r12,0x8000c160
ENDAGAIN:
restoreallnomtlr
lwz	r31, 0x0034 (sp)
