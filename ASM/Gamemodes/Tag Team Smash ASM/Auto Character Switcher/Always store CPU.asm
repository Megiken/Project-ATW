#To be inserted at 80068e98

.include "Common/common.s"

mflr r0
li r4,128
stb r4,6(r3)
