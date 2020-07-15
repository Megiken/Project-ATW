#To be inserted at 8028FC10

.include "Common/common.s"

  li r3, 20
  lis r12, 0x8038
  ori r12, r12, 0x580
  mtctr r12
  bctrl
cmpwi r3,10
blt LB
li r3,0x16
b CHECK
LB:
li r3,0x17
CHECK:
load r20,stageData
lwz r20,stageID(r20)
cmpwi r20,0xa
bne END
LOOP:
lwz r3,0(r31)
branchl r12,randomI
cmpwi r3,0x16
beq LOOP
cmpwi r3,0x17
beq LOOP



END:
