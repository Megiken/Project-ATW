#To be inserted at 8008b5c8

.include "Common/common.s"

lfs f10,0x3e8(r31)
li r22,3
branchl r12,Int2Float
fcmpo 0,f10,f8
blt END
li r22,7
branchl r12,Int2Float
fcmpo 0,f10,f8
bgt END
branchl r12,0x8008c948
b LOL




END:
li r3,0
LOL:
