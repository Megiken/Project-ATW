#To be inserted at 8026787c

.include "Common/common.s"

load r0,maxItemsOnScreen
lwz r0,0(r0)
lwz	r3,0x84(r5)
