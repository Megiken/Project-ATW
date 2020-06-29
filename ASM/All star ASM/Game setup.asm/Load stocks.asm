#To be inserted at 8016e91c

.include "Common/common.s"
backupall

load r20,ARnumOfChars
lwz r20,0(r20)

li r17,0
LOOP:
mr r3,r17
branchl r12,getPlayerStatic
stb r20,0x8e(r3)
cmpwi r17,4
addi r17,r17,1
bne LOOP

END:
restoreall
lwz	r0, 0x0024 (sp)
