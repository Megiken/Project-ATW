#To be inserted at 8016e91c

.include "Common/common.s"
backupall

branchl r12,IMgetFirst
mflr r3
lhz r20,4(r3)
cmpwi r20,0
bne GO

branchl r12,IMgetSecond
mflr r3
lhz r20,4(r3)
cmpwi r20,0
beq END
GO:
branchl r12,IMgetFirst
mflr r3
lbz r3,3(r3)
branchl r12,getPlayerStatic
lwz r20,IMp1Stocks(rtoc)
stb r20,0x8e(r3)

branchl r12,IMgetSecond
mflr r3
lbz r3,3(r3)
branchl r12,getPlayerStatic
lwz r20,IMp2Stocks(rtoc)
stb r20,0x8e(r3)




END:
restoreall
lwz	r0, 0x0024 (sp)
