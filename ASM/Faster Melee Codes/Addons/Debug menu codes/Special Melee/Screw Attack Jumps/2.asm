#To be inserted at 800CB56C

.include "Common/common.s"

load r20,statusFlag
lwz r20,0(r20)
cmpwi r20,1
beq SCREW
lwz r20,gameID(rtoc)
cmpwi r20,1
bne NOSCREW

branchl r12,getItemVars
mflr r20
addi r20,r20,36
lwz r21,0x2c(r31)
  lbz r21, 12(r21)
  lbzx r20, r20, r21
  cmpwi r20, 0x1
  bne- NOSCREW
SCREW:
  cmpwi r3, 0x69
  b loc_0x2C

NOSCREW:
  cmpw r3, r3

loc_0x2C:
