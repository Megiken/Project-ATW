#To be inserted at 800BFD9C

.include "Common/common.s"

backupall
lbz r25,0xc(r31)
mr r3,r25
branchl r12,getASdata
mflr r14
lhz r20,0(r14)
cmpw r20,r25
beq END
load r24,0x80480590
mulli r15,r25,0x24
add r24,r24,r15
load r20,0x804320bf
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
mflr r0
