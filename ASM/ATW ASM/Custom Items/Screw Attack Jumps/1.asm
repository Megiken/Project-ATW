#To be inserted at 800CB9EC

.include "Common/common.s"

branchl r12,getItemVars
mflr r20
addi r20,r20,36
  lbz r21, 12(r30)
  lbzx r20, r20, r21
  cmpwi r20, 0x1
  bne- loc_0x28
  cmpwi r3, 0x69
  b loc_0x2C

loc_0x28:
  cmpw r3, r3

loc_0x2C:
