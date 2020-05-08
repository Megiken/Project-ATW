#To be inserted at 80261A6C

.include "Common/common.s"

load r15,defaultHandsFlag
lwz r15,0(r15)
cmpwi r15,1
bne LOL
load r15,0x804DC47C
load r16,0xC1AC0000
stw r16,0(r15)
loc_0x0:
  lbz r15, 5(r31)
  cmpwi r15, 0x2
  bne- loc_0x1C
  lis r15, 0x8026
  ori r15, r15, 0x1B6C
  mtctr r15
  bctr

loc_0x1C:


b END
LOL:
load r15,0x804DC47C
load r16,0xc0200000
stw r16,0(r15)
END:
mulli r0, r19, 0x24
