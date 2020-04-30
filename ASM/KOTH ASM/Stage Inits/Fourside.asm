#To be inserted at 801f2d9c

.include "Common/common.s"

backupall

bl DATA

mflr r20

branchl r12,KOTHInit


restoreall

blr

DATA:
blrl
.long 3 #max hills
.long 0xc2da0a1e
.long 0xc29d6187
.long 0x408c9714
.long 0x4191fc51

.long 0xc1c8a12b
.long 0xc0a295e4
.long 0x42829972
.long 0x4297d6e3

.long 0x42a00000
.long 0x42f9fe4f
.long 0xc19cff2f
.long 0xc1821de7

.long 0
.long 0
.long 0
.long 0
