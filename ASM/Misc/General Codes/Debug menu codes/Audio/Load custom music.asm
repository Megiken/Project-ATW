#To be inserted at 80024000

.include "Common/common.s"

loadwz r20,playlistFlag
compareieq r20,1,END
lwz r20,numOfSongs(rtoc)
compareile r20,1,END
lis	r20, 0x8048
subi	r20, r20, 25296
lbz r20,0(r20)
compareieq r20,1,GOOD
compareieq r20,2,GOOD
compareine r20,VSModeID,END
GOOD:
lwz r3,numOfSongs(rtoc)
branchl r12,randomI
bl THING
mflr r20
lwz r21,0(r20)
compareeq r3,r21,GOOD
bl TEXT
mflr r20
addi r4,r20,12
compareige r3,100,STORE
addi r4,r4,1
compareige r3,10,STORE
addi r4,r4,1
STORE:
li r22,0
mr r26,r3
branchl r12,storeAscii
mr r3,r20
b LOL
THING:
blrl
.long 0

TEXT:
blrl
.string "CustomAudio/000.hps"
.align 2

LOL:
li r4,127
END:
li r5,1
