#To be inserted at 8016e750

.include "Common/common.s"

backupall
load r21,0x804ddc28
loadwz r20,showNanaPercent
compareieq r20,1,GONORMAL
lis r20,0x40c0
b LOLNORMAL
GONORMAL:
load r20,0x404ccccd
LOLNORMAL:
stw r20,0(r21)
load r21,0x8043208f
branchl r12,IMgetFirst
mflr r20
bl THING
branchl r12,IMgetSecond
mflr r20
addi r21,r21,8
bl THING
b END

THING:
movetctr 2
addi r20,r20,8
mr r22,r21
LOOP:
lbz r15,0(r20)
lbz r16,3(r20)
mulli r15,r15,0x100
add r15,r15,r16
sth r15,0(r22)

addi r22,r22,0x10
addi r20,r20,4

bdnz LOOP
blr
END:
branchl r12,compareGameCache
branchl r12,compareGameCache
restoreall
lis r4,0x8017
