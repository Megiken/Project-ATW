#To be inserted at 8026688c
mflr r0

.include "Common/common.s"

lwz r20,IMtype(rtoc)
cmpwi r20,2
bne END
load r20,0x803F115c
load r21,0x69736400
stw r21,0(r20)
b TRUEEND
END:
load r20,0x803F115c
load r21,0x75736400
stw r21,0(r20)
TRUEEND:
