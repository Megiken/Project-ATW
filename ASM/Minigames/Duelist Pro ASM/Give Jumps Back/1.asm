#To be inserted at 800c23d4

.include "Common/common.s"

mr r3,r31
lwz r20,0x2c(r31)
li r21,1
stb r21,0x1968(r20)
