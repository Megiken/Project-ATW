#To be inserted at 800DA10C

.include "Common/common.s"

loc_0x0:

load r20,KOTHairGrabs
lwz r20,0(r20)
cmpwi r20,0
bne loc_0x38

  lwz r14, 224(r30)
  cmpwi r14, 0x1
  beq- loc_0x10
  b loc_0x38

loc_0x10:
  lwz r15, 6744(r30)
  addi r15, r15, 0x60
  lwz r14, 224(r15)
  cmpwi r14, 0x0
  beq- loc_0x28
  b loc_0x38

loc_0x28:
  lis r14, 0x800D
  ori r14, r14, 0xA110
  mtctr r14
  bctr

loc_0x38:
  lis r14, 0x800D
  ori r14, r14, 0xA120
  mtctr r14
  bctr
