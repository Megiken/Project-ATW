#To be inserted at 801b139c

.include "Common/common.s"

load r20,0x804a04f0
lbz r20,0(r20)
cmpwi r20,0xc
bne END

backupall

load r20,customGamemodeFlag
lwz r20,0(r20)
cmpwi r20,1
beq END3

load r20,cssID
lbz r20,0(r20)


load r21,cssID
lbz r21,-0x3(r21)
mulli r21,r21,0x100
add r21,r21,r20

bl STUFF
mflr r20
li r22,0

LOOP:
lhzx r23,r22,r20
cmpw r23,r21
beq FOUND
addi r22,r22,2
cmpwi r22,numOfFiles*2
bge END2
b LOOP

FOUND:
li r21,2
divw r22,r22,r21
addi r22,r22,1
stw r22,gameID(rtoc)
cmpwi r22,4
blt GOTHERE
subi r24,r22,4
stw r24,IMtype(rtoc)


GOTHERE:
subi r22,r22,1
mulli r22,r22,8
addi r22,r22,numOfFiles*2
add r20,r20,r22
lwz r21,newHeapStart(rtoc)
branchl r12,loadbackupstoreGCT
b END2


STUFF:
blrl
.long 0x0c000c01
.long 0x0c020c03
.long 0x0c040c05
.long 0x4154572e
.long 0x64617400
.long 0x44502e64
.long 0x61740000
.long 0x4b54482e
.long 0x64617400
.long 0x494d2e64
.long 0x61740000
.long 0x494d2e64
.long 0x61740000
.long 0x494d2e64
.long 0x61740000


END2:
restoreall
li r3,2




b LOL
END3:
restoreall
END:
lbz r3,0(r3)
LOL:
