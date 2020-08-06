#To be inserted at 800d3e20

.include "Common/common.s"

lbz r20,0xc(r5)
branchlr r14,getASdata
lhz r21,0(r14)
cmpw r21,r20
beq END
lwz r20,AStimer(rtoc)
subi r20,r20,1
stw r20,AStimer(rtoc)
mr r0,r20
END:
cmpwi r0,0
