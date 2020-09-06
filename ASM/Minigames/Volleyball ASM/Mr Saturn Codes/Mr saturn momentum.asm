#To be inserted at 802835dc

.include "Common/common.s"
backup
lwz r22,0xcac(r29)
lwz r20,0xcec(r29)
lwz r28,0x2c(r20)
lwz r20,0x2c(r20)
addi r3,r20,0x914
li r21,0
LOOP:
lwz r4,0x20(r3)
compareeq r4,r22,FOUND
addi r21,r21,1
compareieq r21,4,NORMAL
mulli r4,r21,0x138
add r3,r4,r20
addi r3,r3,0x914
b LOOP
FOUND:
branchlr r14,getHitData
lbz r20,0xc(r28)
mulli r20,r20,4
lwzx r22,r20,r14
lwz r21,0x10(r28)
compareeq r21,r22,SAME
stwx r21,r20,r14
lbz r21,0x61b(r28)
compareieq r21,0,RED
li r19,0
b LOL2
RED:
li r19,1
LOL2:
mulli r20,r21,4
addi r20,r20,0x10
lwzx r22,r20,r14
compareine r22,3,NOGOAL
mr r11,r21
branchl r12,scoregoal
b END
NOGOAL:
addi r22,r22,1
stwx r22,r20,r14
mulli r19,r19,4
addi r19,r19,0x10
li r22,0
stwx r22,r19,r14

SAME:
lwz r4,0x2c(r3)
lwz r5,0x24(r3)
lwz r8,0x28(r3)
lwz r6,0xc9c(r29)
li r7,70
lfs f10,0xc(r3)
lwz r3,8(r3)
branchl r12,calcCustomKnockback
lwz r3,0xcac(r29)
compareine r3,361,NOSAK
loadfloat f3,r20,0x42000000
fmr f1,f20
loadfloat f21,r21,0x3CF5C28F
fmul f20,f20,f21
loadfloat f0,r20,0x42006666
loadfloat f4,r20,0x42300000
fsubs	f2,f1,f3
fsubs	f1,f0,f3
lfs	f3, -0x7510 (rtoc)
lfs	f0, -0x7508 (rtoc)
fmuls	f5,f3,f4
fdivs	f1,f2,f1
fmadds	f0,f4,f1,f0
fmuls	f0,f3,f0
fcmpo	cr0,f0,f5
fmr	f1, f0
ble PAST
fmr f1,f5
PAST:
fmr f21,f1
b STORE



NOSAK:
loadfloat f21,r21,0x3CF5C28F
fmul f20,f20,f21
convToFloat r3,f1
lfs f2,rtocrad(rtoc)
fmul f21,f1,f2
STORE:
fmr f1,f21
branchl r12,cos
fmul f26,f20,f1
lfs f27,0xccc(r29)
fneg f27,f27
fmul f26,f26,f27
stfs f26,0x40(r29)
fmr f1,f21
branchl r12,sin
fmul f26,f20,f1
lfs f10,0x44(r29)
lfs f9,rtoczero(rtoc)
fcomparene f9,f10,NOTGROUND
fcomparelt f9,f26,NOTGROUND
fneg f26,f26
NOTGROUND:
stfs f26,0x44(r29)
b END







NORMAL:
restore
lwz	r3, 0x0010 (r30)
b LOL
END:
restore
branch r12,0x80283640
LOL:
