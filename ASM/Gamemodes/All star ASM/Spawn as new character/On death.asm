#To be inserted at 800d3338

.include "Common/common.s"
lwz r31,0x2c(r3)
lwz r20,4(r31)
cmpwi r20,NanainID
beq ENDLOL
backupall
lbz r25,0xc(r31)
branchl r12,getASdata
mflr r14
lwz r20,0(r14)
cmpw r20,r25
beq END
mr r3,r25
branchl r12,getPlayerEntity
lwz r17,4(r3)
load r16,0x804320bf
addi r14,r14,4
branchl r12,removeCharacter
branchl r12,compareGameCache

load r24,0x80480590
mulli r15,r25,0x24
add r24,r24,r15
load r20,0x804320af
lbz r21,0(r20)
stb r21,0(r24)
lbz r21,1(r20)
stb r21,3(r24)
mr r3,r25
mr r4,r24
branchl r12,loadCharacter
branchl r12,updateSFX





END:
restoreall
ENDLOL:
