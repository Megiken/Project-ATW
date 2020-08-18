#To be inserted at 80260890

.include "Common/common.s"
backupall


lbz r22,0x19(r3)
mr r3,r22
branchl r12,getCorrectData
cmpwi r3,-1
beq HIGH

lhz r20,0x6(r3)
load r21,SSnumOfChars
lwz r21,0(r21)
cmpw r21,r20
beq HIGH


NORMAL:
li r22,500
branchl r12,Int2Float
lfs f7,0x10(r31)
fcmpo 0,f7,f8
bne THERE
li r20,0
stw r20,0x10(r31)
b END
THERE:
fcmpo 0,f1,f0
b END




HIGH:
li r22,500
branchl r12,Int2Float
stfs f8,0x10(r31)
fcmpo 0,f1,f1

END:
restoreall
