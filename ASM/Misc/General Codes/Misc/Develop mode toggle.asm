#To be inserted at 801a1c2c

.include "Common/common.s"

branchl r12,0x801a36a0
rlwinm.	r0, r4, 0, 23, 23
beq END
li r18,0x160
branchl r12,checkData
compareieq r17,-1,END
backupall

lwz r20, -0x3e74(r13)
lwz r20, 0xC(r20)
lwz r20,0x28(r20)

lwz r3,-0x6c98(r13)
compareieq r3,0,ON

li r6,0xb5
loadfloat f0,r21,0x42A00000
loadfloat f1,r21,0x43960000
load r5,0x262626FF
li r4,2
li r3,0
b GO
ON:
li r6,0x12b
loadfloat f1,r21,0x42800000
loadfloat f0,r21,0xC1800000
load r5,0xE0A020FF
li r4,6
li r3,4
GO:
stw r5,0x18(r20)
stfs f0,0x10(r20)
stfs f1,0x14(r20)
stw r4,8(r20)
stw r3,-0x6c98(r13)
mr r3,r6
branchl r12,playsfx
restoreall
END:
