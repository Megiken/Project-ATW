#To be inserted at 80303fd4

.include "Common/common.s"

load r20,0x803fa4e0
cmpw r20,r5
bne END
load r20,0x804a04f0
lbz r20,0(r20)
cmpwi r20,0xc
bne END
lwz r20,gameID(rtoc)
cmpwi r20,0
beq NEXT
subi r20,r20,1
cmpwi r20,3
ble GOOD
subi r20,r20,2
b GOOD
NEXT:
load r20,cssID
lbz r20,0(r20)
cmpwi r20,6
bge END
GOOD:
backup
bl THERE
.long 0x8065e8d4
.long 0x8065ee48
.long 0x8065f154
.long 0x8065f460
.long 0x8065fe9c
.long 0x806600c8
THERE:
mflr r21
mulli r20,r20,4
lwzx r5,r21,r20
restore

END:
mflr r0
