#To be inserted at 80069388

.include "Common/common.s"

backup

branchl r12,getCustomEntityStruct
mflr r3
li r4,0x10
stw r4,0x8(r3)
li r4,1
branchl r12,EntityItemSpawn
mr r4,r3
mr r3,r31
branchl r12,0x800948a8

restore
mr r3,r31
