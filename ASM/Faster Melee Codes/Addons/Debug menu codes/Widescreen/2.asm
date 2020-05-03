#To be inserted at 802FCFC4

.include "Common/common.s"

load r20,wideScreenFlag
lwz r20,0(r20)
cmpwi r20,1
beq LOL
loc_0x0:
  bl loc_0x10
  mflr r3
  lfs f0, 0(r3)
  b END

loc_0x10:
  blrl
 .long 0x40F00000

LOL:
lfs	f0, -0x1E64 (rtoc)
END:
