#To be inserted at 80303fd4

.include "Common/common.s"

load r20,0x803fa4e0
cmpw r20,r5
bne END
lwz r20,gameID(rtoc)
cmpwi r20,0
beq END
backup
subi r20,r20,1
bl THERE
.long 0x801970ec
.long 0x8019782c
.long 0x80197bec
.long 0x80197f8c
THERE:
mflr r21
mulli r20,r20,4
lwzx r5,r21,r20
restore

END:
mflr r0
