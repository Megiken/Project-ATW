#To be inserted at 8016e750

.include "Common/common.s"

backupall
branchl r12,IMgetFirst
mflr r3
lbz r4,3(r3)
load r20,0x8043208f
mulli r21,r4,8
lwzx r15,r21,r20

branchl r12,IMgetSecond
mflr r3
lbz r4,3(r3)
mulli r21,r4,8
lwzx r16,r21,r20
li r0,8
mtctr r0
load r21,0x21000100
li r22,0
subi r20,r20,4
LOOP:
stwu r21,4(r20)
stwu r22,4(r20)
bdnz LOOP
branchl r12,compareGameCache
load r20,0x8043208f
load r21,0x14000100
load r22,0x1d000100
stw r21,0(r20)
branchl r12,compareGameCache
branchl r12,compareGameCache
stw r15,8(r20)
branchl r12,compareGameCache
branchl r12,compareGameCache
stw r22,0x10(r20)
branchl r12,compareGameCache
branchl r12,compareGameCache
stw r16,0x18(r20)
branchl r12,compareGameCache
branchl r12,compareGameCache

restoreall
lis r4,0x8017
