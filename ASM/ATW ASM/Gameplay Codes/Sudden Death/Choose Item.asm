#To be inserted at 80294DCC

.include "Common/common.s"

mr r23,r3
lwz r20,suddenDeathItem(rtoc)
cmpwi r20,0
bne END
NEW:
li r3,60
branchl r12,randomI
li r4,10
divw r3,r3,r4
bl THERE
.long 0x11220c0e
.long 0x07060000
THERE:
mflr r21
lbzx r20,r3,r21
stw r20,suddenDeathItem(rtoc)
END:
lwz r20,suddenDeathItem(rtoc)
cmpwi r20,0x22
bgt NEW
mr r0,r20
mr r3,r23
li r5,0
