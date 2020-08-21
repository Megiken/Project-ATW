#To be inserted at 802600e0

.include "Common/common.s"

backupall
li r18,0x40
branchl r12,checkData
cmpw r17,r27
bne END
restoreall
branch r12,0x80260270


END:
restoreall
addi	r30, r3, 948
