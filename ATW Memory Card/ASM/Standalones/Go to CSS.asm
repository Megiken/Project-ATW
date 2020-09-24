#To be inserted at 8032C90c

.include "Common/common.s"

#input r20 = clear css flag, 0 = no, 1 = yes
#input r21 = gameID to store

backup
li r14,0
cmpwi r3,1
bne END

load r24,0x804a04f0
li r23,0xc
stb r23,0(r24)

li r14,1
stw r21,gameID(rtoc)

cmpwi r20,0
beq GO
li r20,0
LOOP:
mr r3,r20
branchl r12,removePlayerFromCSS
addi r20,r20,1
cmpwi r20,4
bne LOOP

GO:

lwz r15,secondFileInHeap(rtoc)
branchl r12,removerestoreGCT

mr r20,r22
lwz r21,secondFileInHeap(rtoc)
branchl r12,loadbackupstoreGCT

li r3,1
branchl r12,0x80024030
li r3,2
branchl r12,0x801a42f8
branchl r12,0x801a4b60
li r3,0

END:
restore
blr
