#To be inserted at 801c60dc

.include "Common/common.s"

bl TABLE
mflr r20
bl SPOTS
mflr r21
stw r21,0(r20)
bl LINKS
mflr r21
stw r21,8(r20)
b END



TABLE:
blrl
.long 0
.long 16
.long 0
.long 8
.long 0
.long 8
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0

SPOTS:
blrl
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0
.long 0


LINKS:
blrl
.long 0x00000001
.long -1
.long -1
.long 0x00810000
.long 0x00020003
.long -1
.long -1
.long 0x00810000
.long 0x00040005
.long -1
.long -1
.long 0x00810000
.long 0x00060007
.long -1
.long -1
.long 0x00810000
.long 0x00080009
.long -1
.long -1
.long 0x00810000
.long 0x000a000b
.long -1
.long -1
.long 0x00810000
.long 0x000c000d
.long -1
.long -1
.long 0x00810000
.long 0x000e000f
.long -1
.long -1
.long 0x00810000


END:
stw r20,0x6ac(r30)
