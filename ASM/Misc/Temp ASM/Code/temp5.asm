#To be inserted at 80380238

.include "Common/common.s"

li r5,32
load r20,0x80000000
li r21,0x6969
stw r21,0(r20)
lwz r20,0(r20)
