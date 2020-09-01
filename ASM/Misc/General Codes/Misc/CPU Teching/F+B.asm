#To be inserted at 80098948

.include "Common/common.s"

backupall
lbz r3,0xc(r31)
branchl r12,getPlayerStatic
lwz r4,8(r3)
compareine r4,1,END
loadbz r4,0x80479d30
compareine r4,2,END
li r3,100
branchl r12,randomI
compareigt r3,25,NEXT
lis	r3,0x8009
ori	r3,r3,0x8998
mtctr	r3
b GOBACK
NEXT:
li r3,100
branchl r12,randomI
compareigt r3,33,ENDCPU
lis	r3,0x8009
ori	r3,r3,0x89a0
mtctr	r3
b GOBACK
ENDCPU:
lis	r3,0x8009
ori	r3,r3,0x89b8
mtctr	r3
GOBACK:
restoreall
bctr
END:
restoreall
cmpwi r3,0
