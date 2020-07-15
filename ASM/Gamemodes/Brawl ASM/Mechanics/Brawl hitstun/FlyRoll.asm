#To be inserted at 80090348

.include "Common/common.s"

mr r21,r3
mr r23,r4

lfs f1,0x3e8(r23)
li r22,13
branchl r12,Int2Float
fcmpo 0,f1,f8
blt END
mr r3,r21
branchl r12,0x80099a58
cmpwi r3,0
bne LOL
lfs f1,0x3e8(r23)
li r22,25
branchl r12,Int2Float
fcmpo 0,f1,f8
blt END
mr r3,r21
branchl r12,0x8008cd68
cmpwi r3,0
bne LOL
mr r3,r21
branchl r12,0x8009665c
cmpwi r3,0
bne LOL

END:
mr r3,r21
mr r4,r23
branchl r12,0x8008f938
LOL:
