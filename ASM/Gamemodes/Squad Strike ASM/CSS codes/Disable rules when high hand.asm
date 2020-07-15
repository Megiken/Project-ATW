#To be inserted at 802616fc

.include "Common/common.s"

li r22,26
branchl r12,Int2Float
fcmpo 0,f8,f1
bge NORMAL
branch r12,0x80261768
NORMAL:
li r3,1
