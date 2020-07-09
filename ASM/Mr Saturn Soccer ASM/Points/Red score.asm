#To be inserted at 80277954

.include "Common/common.s"

backup

li r11,0
branchl r12,scoregoal

restore
branch r12,0x80277c1c
