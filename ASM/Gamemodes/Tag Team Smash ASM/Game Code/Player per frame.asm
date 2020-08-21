#To be inserted at 8006CA9C

.include "Common/common.s"

backupall
lbz r3,0xc(r31)
branchl r12,getPlayerInstantInputs
andi. r4,r4,0x1000
cmpwi r4,0x1000
bne END
cmpwi r4,0x1160
beq END
lwz r20,0x10(r31)
cmpwi r20,AS_RebirthWait
ble END
cmpwi r20,322
blt GO
cmpwi r20,324
ble END
GO:
#swap nana and player


END:
restoreall
lbz	r0, 0x221E (r31)
