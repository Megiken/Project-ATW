#To be inserted at 802668a8

.include "Common/common.s"

addi	r30, r3, 0
load r20,doublesByte
li r21,1
stb r21,0(r20)
