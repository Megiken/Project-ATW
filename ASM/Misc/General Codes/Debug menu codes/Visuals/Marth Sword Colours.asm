#To be inserted at 80136510

.include "Common/common.s"

load r14,swordColoursFlag
lwz r14,0(r14)
cmpwi r14,1
beq END

lis r14,-256
ori r14,r14,65535
cmpw r0,r14
bne- 0x60
subi r15,r5,7807
lbz r15,0(r15)
cmpwi r15,1
bne- 0x10
lis r3,-256
ori r3,r3,48652
lis r0,6400
cmpwi r15,2
bne- 0x10
lis r3,-256
ori r3,r3,36309
lis r0,11776
cmpwi r15,3
bne- 0x10
lis r3,-256
ori r3,r3,63457
lis r0,-32000
cmpwi r15,4
bne- 0x10
lis r3,-256
ori r3,r3,32119
lis r0,-14336
ori r0,r0,65535
END:
stwu r3,8(r5)
