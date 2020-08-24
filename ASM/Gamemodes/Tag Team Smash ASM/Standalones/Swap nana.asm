#To be inserted at 8032C988

.include "Common/common.s"

#input r20 = port

backupall
mr r3,r20
branchl r12,getPlayerStatic
lwz r21,0xb0(r3)
lwz r22,0xb4(r3)
lwz r22,0x2c(r22)
lwz r21,0x2c(r21)
lwz r23,0x10(r22)
compareieq r23,AS_Sleep,END
lwz r23,0x1a94(r21)
lwz r24,0x1a94(r22)
stw r24,0x1a94(r21)
stw r23,0x1a94(r22)
compareieq r23,6,SUBCHAR
mr r23,r22
mr r22,r21
mr r21,r23
SUBCHAR:
lbz r20,0x221f(r22)
ori r20,r20,8
stb r20,0x221f(r22)
lbz r20,0x221f(r21)
ori r20,r20,8
xori r20,r20,8
stb r20,0x221f(r21)
END:
restoreall
blr
