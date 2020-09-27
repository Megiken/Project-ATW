#To be inserted at 80229e34

.include "Common/common.s"

loadbz r20,0x80479d30
compareieq r20,1,THERE
branchl r12,0x8039069c
THERE:
