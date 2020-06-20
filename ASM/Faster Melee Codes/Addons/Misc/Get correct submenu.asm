#To be inserted at 80303fd4

.include "Common/common.s"

load r20,0x803fa4e0
cmpw r20,r5
bne END
lwz r20,gameID(rtoc)
cmpwi r20,0
beq OK
subi r20,r20,1
b GOOD
OK:
load r20,0x804a04f0
lbz r20,0(r20)
cmpwi r20,0xc
bne END
load r20,cssID
lbz r20,0(r20)
cmpwi r20,6
bge END
GOOD:
backup
bl THERE
.long ATWsubmenu
.long IMsubmenu
.long squadStrikesubmenu
.long allStarsubmenu
.long smash64submenu
.long brawlsubmenu
THERE:
mflr r21
mulli r20,r20,4
lwzx r5,r21,r20
restore

END:
mflr r0
