#To be inserted at 80294DCC

.include "Common/common.s"

lwz r20,suddenDeathItem(rtoc)
cmpwi r20,0
bne END
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
mr r0,r20
li r5,0
