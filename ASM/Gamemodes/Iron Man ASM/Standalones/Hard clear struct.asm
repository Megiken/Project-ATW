#To be inserted at 8032C8d8

.include "Common/common.s"

#input r23 = struct to clear

backupall

addi r3,r23,0
li r4,116
branchl r12,zeromem

restoreall

blr
