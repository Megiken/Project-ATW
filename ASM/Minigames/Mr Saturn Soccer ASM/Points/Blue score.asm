#To be inserted at 802779d8

.include "Common/common.s"

lwz r20,0x10(r31)
compareieq r20,MrSaturn,GOOD
branchl r12,0x8000dc6c
b END
GOOD:
backup



li r11,1
branchl r12,scoregoal

restore
branch r12,0x80277c1c
END:
