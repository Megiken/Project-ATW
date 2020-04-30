#To be inserted at 800DA42C

.include "Common/common.s"

loc_0x0:

load r20,KOTHairGrabs
lwz r20,0(r20)
cmpwi r20,0
beq GO
lis r14, 0x8008
ori r14, r14, 0x41B8
mtctr r14
bctrl
b END


GO:

  subi r1, r1, 0x4
  mflr r0
  stw r0, 0(r1)
  lwz r14, 224(r30)
  cmpwi r14, 0x0
  beq- loc_0x3C
  lis r14, 0x8008
  ori r14, r14, 0x1D0C
  mtctr r14
  bctrl
  cmpwi r3, 0x1
  bne- loc_0x50
  li r14, 0x0
  stw r14, 224(r30)
  b loc_0x50

loc_0x3C:
  lis r14, 0x8008
  ori r14, r14, 0x41B8
  mtctr r14
  bctrl
  b loc_0x50

loc_0x50:
  lwz r0, 0(r1)
  mtlr r0
  addi r1, r1, 0x4
END:
