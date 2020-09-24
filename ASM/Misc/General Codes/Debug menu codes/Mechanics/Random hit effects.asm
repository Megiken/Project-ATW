#To be inserted at 800715B0

.include "Common/common.s"

loadwz r20,randomEffects
cmpwi r20,0
bne END

loc_0x4:
  li r3, 0x10
  lis r4, 0x8038
  ori r4, r4, 0x580
  mtctr r4
  bctrl
  cmpwi r3, 0x4
  beq- loc_0x4
  cmpwi r3, 0x7
  beq- loc_0x4
  cmpwi r3, 0x8
  beq- loc_0x4
  cmpwi r3, 0xB
  beq- loc_0x4
  stw r3, 48(r30)
  mr r0, r15

END:
  cmplwi r0, 9
