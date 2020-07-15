#To be inserted at 80260740

.include "Common/common.s"

backupall
lfs f5,0x10(r31)
li r22,500
branchl r12,Int2Float
fcmpo 0,f5,f8
beq NOTHING
stfs	f0, 0x000C (r31)
NOTHING:
restoreall
