#To be inserted at 80260700

.include "Common/common.s"

stb	r0, -0x49AA (r13)
li r20,1
stw r20,SynStop(rtoc)
