#To be inserted at 80303FF8

.include "Common/common.s"

lis r15,0x803f
ori r15,r15,0xa790
cmpw r15,r5
bne END
lwz r15,8(r4)
lwz r5,prevMenuFlag(rtoc)
mulli r5,r5,32
addi r5,r5,20
lwzx r5,r15,r5
END:
stw r5,8(r4)
