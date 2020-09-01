#To be inserted at 80097de0

.include "Common/common.s"

mr	r3,r31
backupall
lwz r30,0x2c(r3)
lbz r3,0xc(r30)
branchl r12,getPlayerStatic
lwz r4,8(r3)
compareine r4,1,END
loadbz r4,0x80479d30
compareine r4,2,END 
li r3,4
branchl r12,randomI
compareieq r3,0,NORMAL
compareieq r3,1,RIGHT
compareieq r3,2,LEFT
compareieq r3,3,ATTACK
b END
NORMAL:
lwz r3,0x65c(r30)
ori r3,r3,0x0040
stw r3,0x65c(r30)
b END
RIGHT:
lis r3,0x3f80
stw r3,0x620(r30)
b END
LEFT:
lis r3,0xbf80
stw r3,0x620(r30)
b END
ATTACK:
lwz r3,0x65c(r30)
ori r3,r3,0x0100
stw r3,0x65c(r30)
END:
restoreall
