#To be inserted at 8026688c

.include "Common/common.s"

backupall
li r22,0
LOOP:
addi r22,r22,1
compareieq r22,10000,END
load r20,shuffleSettings
li r3,13
branchl r12,randomI
mulli r23,r3,4
lwzx r21,r20,r23
compareine r21,0,LOOP
lwz r19,shuffleID(rtoc)
compareeq r19,r3,LOOP
stw r3,shuffleID(rtoc)
lwz r15,thirdFileInHeap(rtoc)
branchl r12,removerestoreGCT
bl THERE
.long 0x53532e64
.long 0x61740000
.long 0x54542e64
.long 0x61740000
.long 0x5336342e
.long 0x64617400
.long 0x42524c2e
.long 0x64617400
.long 0x44502e64
.long 0x61740000
.long 0x4b54482e
.long 0x64617400
.long 0x53422e64
.long 0x61740000
.long 0x4f54432e
.long 0x64617400
.long 0x494a5a2e
.long 0x64617400
.long 0x4359502e
.long 0x64617400
.long 0x4d53532e
.long 0x64617400
.long 0x56422e64
.long 0x61740000
.long 0x42422e64
.long 0x61740000


THERE:
mflr r20
mulli r23,r23,2
add r20,r20,r23
lwz r21,thirdFileInHeap(rtoc)
branchl r12,loadbackupstoreGCT

li r21,0
LOOP2:
mr r20,r21
branchl r12,removePlayerFromCSS
addi r21,r21,1
compareine r21,4,LOOP2
load r20,doublesByte
li r21,0
stb r21,0(r20)






END:
restoreall
mflr r0
