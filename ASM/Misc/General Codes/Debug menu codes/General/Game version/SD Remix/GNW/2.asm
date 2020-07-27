#To be inserted at 8014B810
.include "Common/common.s"
load r20,meleeVersion
lwz r20,0(r20)
cmpwi r20,2
bne LOL

loc_0x0:
  stw r0, 8636(r31)
  lwz r5, -20812(r13)
  lwz r4, 228(r5)
  lbz r3, 1663(r31)
  cmpw r3, r4
  bge- loc_0x6C
  mr r3, r30
  lis r12, 0x8006
  ori r12, r12, 0xF484
  mtctr r12
  bctrl
  bl loc_0x64
  mflr r3
  lfs f0, 0(r3)
  fadds f0, f0, f1
  lfs f1, 232(r5)
  lfs f2, 504(r31)
  fdivs f1, f2, f1
  fdivs f1, f0, f1
  mr r3, r30
  lis r12, 0x8006
  ori r12, r12, 0xF190
  mtctr r12
  bctrl
  b loc_0x6C

loc_0x64:
  blrl
  subis r14, r12, 13107

loc_0x6C:
b END

LOL:
stw	r0, 0x21BC (r31)
END:
