#To be inserted at 801CD8A8

.include "Common/common.s"

load r20,peachCastle
lwz r20,0(r20)
cmpwi r20,1
bne END

blr

END:

mflr r0
