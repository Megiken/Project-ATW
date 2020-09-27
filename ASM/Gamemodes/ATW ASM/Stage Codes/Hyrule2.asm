#To be inserted at 801672bc

.include "Common/common.s"

lhz	r5, 0x003E (r3)
loadwz r20,stageData+0x88
compareine r20,TempleinID,END
li r5,50
END:
