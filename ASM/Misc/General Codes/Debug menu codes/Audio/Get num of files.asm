#To be inserted at 801601a8

.include "Common/common.s"

backup
li r20,0
bl TEXT
mflr r21
LOOP:
mr r3,r21
branchl r12,0x8033796c
compareieq r3,-1,END

NORMAL:
addi r20,r20,1
lbz r22,14(r21)
compareieq r22,0x39,NINE
addi r22,r22,1
stb r22,14(r21)
b LOOP
NINE:
li r22,0x30
stb r22,14(r21)
lbz r22,13(r21)
addi r22,r22,1
compareieq r22,0x40,FIXIT
stb r22,13(r21)
b LOOP
FIXIT:
li r22,0x30
stb r22,13(r21)
lbz r22,12(r21)
addi r22,r22,1
stb r22,12(r21)
b LOOP




TEXT:
blrl
.string "CustomAudio/000.hps"
.align 2
END:
stw r20,numOfSongs(rtoc)
restore
branchl r12,0x801a4510
