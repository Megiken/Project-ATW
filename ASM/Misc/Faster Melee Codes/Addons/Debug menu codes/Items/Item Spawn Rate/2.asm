#To be inserted at 8026D204

.include "Common/common.s"

load r15,customItemSpawnFlag
lwz r15,0(r15)
cmpwi r15,0
bne END
load r15,itemSpawnRate
lwz r15,0(r15)
stw r15,0(r31)
b LOL
END:
stw	r0, 0 (r31)
LOL:
