#To be inserted at 803a746c

.include "Common/common.s"

backupall


load r20,doublesByte
lbz r20,0(r20)
cmpwi r20,0
beq END

mr r30,r3
mr r29,r4

branchl r12,countPlayersInMatch
cmpwi r3,2
blt END

mr r3,r30
mr r4,r29

load r20,playerCSSdata1
mulli r21,r4,0x24
add r21,r21,r20
lbz r22,-0x2(r21)
mulli r22,r22,4
bl STUFF
mflr r5
add r5,r22,r5


lis r12,0x803a
ori r12,r12,0x74f0
mtlr r12
blrl
b END

STUFF:
blrl
.long 0xff00007f
.long 0x0000ff7f
.long 0x00ff007f

END:
restoreall
