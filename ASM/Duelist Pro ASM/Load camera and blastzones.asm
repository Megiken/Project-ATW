#To be inserted at 80221c74

.include "Common/common.s"

load r20,stageData
lis r21,0xc2e0
stw r21,0xc(r20)
lis r21,0xc320
stw r21,0x80(r20)


lwz	r0, 0x000C (sp)
