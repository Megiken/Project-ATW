#To be inserted at 8036A4A8

.include "Common/common.s"

lfs f1, 52(r31)

load r20,wideScreenFlag
lwz r20,0(r20)
cmpwi r20,1
beq SETUP

bl loc_0x20
mflr r3
lfs f2, 0(r3)
lfs f3, 4(r3)
fmuls f1, f1, f2
fdivs f1, f1, f3
b loc_0x2C

loc_0x20:
blrl
.long 0x42B80000
.long 0x427C0000

loc_0x2C:
load r20,0x803BB05C
load r21,0x3EB00000
stw r21,0(r20)
load r20,0x804DDB84
load r21,0x3E99999A
stw r21,0(r20)
load r20,0x804DDB38
load r21,0xC3A8770A
stw r21,0(r20)
load r20,0x804DDB3C
load r21,0x43A8770A
stw r21,0(r20)
load r20,0x804DDB40
load r21,0x43D50000
stw r21,0(r20)
b END
SETUP:
load r20,0x803BB05C
load r21,0x3faaaaaa
stw r21,0(r20)
load r20,0x804DDB84
load r21,0x3ecccccd
stw r21,0(r20)
load r20,0x804DDB38
load r21,0xc37cb334
stw r21,0(r20)
load r20,0x804DDB3C
load r21,0x437cb334
stw r21,0(r20)
load r20,0x804DDB40
load r21,0x43a00000
stw r21,0(r20)
END:
cmpwi r30,0
