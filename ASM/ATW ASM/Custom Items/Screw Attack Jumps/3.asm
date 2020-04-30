#To be inserted at 800D738C

.include "Common/common.s"

branchl r12,getItemVars
mflr r20
addi r20,r20,36
  lbz r21, 12(r28)
  lbzx r20, r20, r21
  cmpwi r20, 0x1
  bne- loc_0x28
  cmpwi r3, 0x69
  b loc_0x2C

loc_0x28:
  cmpw r3, r3

loc_0x2C:
