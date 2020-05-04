#To be inserted at 80023FFC

.include "Common/common.s"
li r4, 0x7F
load r20,dreamlandVolumeFlag
lwz r20,0(r20)
cmpwi r20,0
bne END
lwz r5, 44(r1)
cmpwi r5, 0x3A
bne- loc_0x14
li r4, 0x60
END:
