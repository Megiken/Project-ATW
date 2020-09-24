#To be inserted at 800945B0
.include "Common/memcard.s"
load r20,stageData
lwz r20,stageID(r20)
cmpwi r20,0xa
bne END
branchl r12,0x8006cf5c
END:
