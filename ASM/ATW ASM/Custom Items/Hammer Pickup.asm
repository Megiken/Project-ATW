#To be inserted at 802940fc

.include "Common/common.s"

backup

lwz r20,0x518(r3)
cmpwi r20,0
beq END
lwz r20,0x2c(r20)
cmpwi r20,0
beq END
lbz r20,0xc(r20)

branchl r12,getATWstats
mflr r21
li r23,1
addi r21,r21,Stats_hammerPickup
stbx r23,r20,r21

END:

restore

mflr r0
