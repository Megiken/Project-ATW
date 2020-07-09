#To be inserted at 802779d8

.include "Common/common.s"

backup

li r11,1
branchl r12,scoregoal

restore
branch r12,0x80277c1c
