#To be inserted at 803041a0
.include "Common/common.s"
lbz r5,4(r5)
load r20,debugMenuValues
lbz r20,0(r20)
stw r20,prevMenuFlag(rtoc)
