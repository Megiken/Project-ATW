#To be inserted at 80069388

.include "Common/common.s"

load r20,headFlag
lwz r20,0(r20)
cmpwi r20,0
beq END
backupall
cmpwi r20,1
beq FLOWER
branchl r12,getCustomEntityStruct
mflr r3
li r4,0x1f
stw r4,0x8(r3)
li r4,1
branchl r12,EntityItemSpawn
mr r4,r3
mr r3,r31
branchl r12,0x8007fa58
li r3,0
stw r3,0x197c(r30)
b LOL
FLOWER:

bl THERE
.long 0x47C35000
THERE:
mflr r20
lfs f1,0(r20)
mr r3,r31
branchl r12,0x8007fc7c

LOL:
restoreall
END:
mr	r3, r31
