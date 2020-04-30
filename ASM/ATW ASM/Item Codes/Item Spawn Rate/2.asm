#To be inserted at 8026D204

.include "Common/common.s"

load r15,itemSpawnRate
lwz r15,0(r15)
stw r15,0(r31)
