#To be inserted at 8021086c

.include "Common/memcard.s"

backup
li r3,6
li r4,7
bl DREAMLANDTHINK
mflr r5
li r6,0
li r7,8
branchl r12,createCustomGObj
b END

DREAMLANDTHINK:
blrl
backup
mr r31,r3
lwz r30,0x2c(r31)
lwz r21,0x0(r30)
addi r21,r21,1
stw r21,0x0(r30)
cmpwi r21,900
bne ENDTHINK
li r21,0
stw r21,0x0(r30)
branchl r12,getCustomEntityStruct
mflr r29
addi r3,r29,0x14
branchl r12,0x8026cb3c
compareieq r3,0,ENDTHINK
lwz r21,0x14(r29)
stw r21,0x20(r29)
lwz r21,0x18(r29)
stw r21,0x24(r29)
li r21,0x2c
stw r21,0x8(r29)
mr r3,r29
branchl r12,0x80268b18
ENDTHINK:
restore
blr

END:
restore
stw	r31, -0x4C04 (r13)
