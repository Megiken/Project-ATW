#To be inserted at 80211444

.include "Common/common.s"

load r20,dreamLandWind
lwz r20,0(r20)
cmpwi r20,0
bne END

branch r12,0x802119e0

END:
