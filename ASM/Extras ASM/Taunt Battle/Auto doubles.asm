#To be inserted at 8026688C

.include "Common/common.s"

mflr r0
load r20,doublesByte
li r21,1
stb r21,0(r20)
