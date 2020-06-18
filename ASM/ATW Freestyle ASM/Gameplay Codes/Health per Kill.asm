#To be inserted at 802F6B18

.include "Common/common.s"

backupall
stb r31,0xd(r3)
load r20,doublesByte
lbz r20,0(r20)
cmpwi r20,1
beq END
branchl r12,0x8016b558
cmpwi r3,2
ble END
lhz r20,0x60(r28)
li r22,25
sub r20,r20,r22
cmpwi r20,0
bgt THERE
li r20,0
THERE:
sth r20,0x60(r28)
lwz r20,0xb0(r28)
lwz r20,0x2c(r20)
lfs f10,0x1830(r20)

lfd    f3,-29808(r2)
stfd    f3,0x20(r2)
sth    r22,0x26(r2)
lfd    f1,0x20(r2)
fsubs    f1,f1,f3

fsub f10,f10,f1
lfs f11,-0x1c54(rtoc)
fcmpo 0,f11,f10
blt THAR
fmr f10,f11
THAR:
stfs f10,0x1830(r20)
END:
restoreall
