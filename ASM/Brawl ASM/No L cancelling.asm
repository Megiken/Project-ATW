#To be inserted at 8008d5fc

.include "Common/common.s"

lwz r20,0x2c(r3)
li r21,8
stb r21,0x067F(r20)
mflr r0
