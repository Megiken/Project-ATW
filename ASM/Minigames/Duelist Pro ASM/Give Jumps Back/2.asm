#To be inserted at 800c1d78

.include "Common/common.s"

mr r3,r30
lwz r20,0x2c(r29)
li r21,1
stb r21,0x1968(r20)
