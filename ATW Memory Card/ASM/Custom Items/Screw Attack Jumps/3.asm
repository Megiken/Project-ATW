#To be inserted at 800D738C

.include "Common/memcard.s"

load r20,statusFlag
lwz r20,0(r20)
cmpwi r20,1
beq SCREW

branchl r12,getItemVars
mflr r20
addi r20,r20,36
  lbz r21, 12(r28)
  lbzx r20, r20, r21
  cmpwi r20, 0x1
  bne- NOSCREW
SCREW:
  cmpw r3, r1
  b loc_0x2C

NOSCREW:
  cmpw r3, r3

loc_0x2C:
