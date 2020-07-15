#To be inserted at 802835dc

.include "Common/common.s"
backup
li r22,0
stw r22,0xc9c(r29)
lwz r22,0xcac(r29)
branchl r12,Int2Float
lfs f7,rtocrad(rtoc)
fmul f8,f7,f8
fmr f1,f8
branchl r12,sin
fmr f12,f1
bl THERE
.float 1.14
.float 6
.float 1
THERE:
mflr r23
loadfz f10,r20,saturnSpeed
fmr f11,f8
lwz r22,0xca8(r29)
branchl r12,Int2Float
fmr f1,f8
branchl r12,log
fmr f5,f1
lfs f7,4(r23)
fmr f1,f7
branchl r12,log
fdiv f6,f5,f1
fmul f9,f6,f10
fmul f1,f12,f9
lfs f13,rtoctwo(rtoc)
fmul f1,f1,f13
fabs f4,f1
lfs f3,8(r23)
fcmpo 0,f4,f3
bgt STOREY
lfs f4,rtoczero(rtoc)
fcmpo 0,f1,f4
blt NEGA
fmr f1,f3
b STOREY
NEGA:
fneg f1,f3
STOREY:
stfs f1,0x44(r29)
fmr f1,f11
branchl r12,cos
fmul f1,f1,f9
lfs f2,0xccc(r29)
fneg f2,f2
fmul f1,f2,f1
stfs f1,0x40(r29)
b END
NORMAL:
restore
lwz	r3, 0x0010 (r30)
b LOL
END:
restore
branch r12,0x80283640
LOL:
