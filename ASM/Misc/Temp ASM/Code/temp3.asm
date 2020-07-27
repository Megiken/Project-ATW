#To be inserted at 80390cfc

.include "Common/common.s"

load r20,0x81b56c80
li r21,0x6969
stw r21,0(r20)
lwz r20,0(r20)

mflr r0
