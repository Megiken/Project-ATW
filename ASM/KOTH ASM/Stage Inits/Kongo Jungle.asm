#To be inserted at 801d52f4

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
.long 0xc23f5602
.long 0xc1979480
.long 0x425073b2
.long 0x42873e6b

.long 0x41babeff
.long 0x4270d1f0
.long 0x426ef000
.long 0x4292757f

.long 0x429a7f4f
.long 0x42bc9aa8
.long 0xc1f80347
.long 0xc1ab460c
.long 0
.long 0
.long 0
.long 0
