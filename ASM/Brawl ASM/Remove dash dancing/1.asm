#To be inserted at 800ca47c

.include "Common/common.s"

lfs f9,0x3e8(r31)
li r22,7
branchl r12,Int2Float
fcmpo 0,f9,f8
bgt END
branchl r12,0x800c9c74
b LOL
END:
branch r12,0x800ca498
LOL:
