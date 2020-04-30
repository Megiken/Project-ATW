#To be inserted at 803001DC

.include "Common/common.s"

lbz	r0, 0 (r31)
lwz	r15, 0x0008 (r31)
stb	r0, -0x0104 (r15)
mflr r0
