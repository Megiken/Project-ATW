#To be inserted at 802835dc

.include "Common/common.s"

backup
lwz r22,0xcac(r29)
lwz r20,0xcec(r29)
lwz r20,0x2c(r20)
li r21,0
addi r3,r20,0x914
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
lwz r4,0x2c(r3)
lwz r5,0x24(r3)
lwz r6,0xc9c(r29)
sub r6,r6,r3
li r7,70
lfs f10,0xc(r3)
lwz r3,8(r3)
branchl r12,calcCustomKnockback
loadfloat f21,r21,0x3CF5C28F
fmul f20,f20,f21
lwz r3,0xcac(r29)
compareine r3,361,NOSAK
li r3,32
NOSAK:
convToFloat r3,f1
lfs f2,rtocrad(rtoc)
fmul f21,f1,f2
fmr f1,f21
branchl r12,cos
fmul f26,f20,f1
lfs f27,0xccc(r29)
fmul f26,f26,f27
stfs f26,0x40(r29)
fmr f1,f21
branchl r12,sin
fmul f26,f20,f1
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
