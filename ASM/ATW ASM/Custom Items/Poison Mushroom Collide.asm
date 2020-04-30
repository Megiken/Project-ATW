#To be inserted at 800D1E80

.include "Common/common.s"

backup

lwz r20,0x2c(r3)
lbz r20,0xc(r20)

branchl r12,getATWstats
mflr r21
li r23,1
addi r21,r21,Stats_poisonmushroomTouch
stbx r23,r20,r21

restore


  lis r12, 0x800C
  ori r12, r12, 0x318C
  mtctr r12
  bctr
