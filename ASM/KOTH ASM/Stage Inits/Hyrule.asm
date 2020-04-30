#To be inserted at 80201cec

.include "Common/common.s"

backupall

bl DATA

mflr r20

branchl r12,KOTHInit


restoreall

blr

DATA:
blrl
.long 4 #max hills
.long 0xc34ea35b
.long 0xc32d709e
.long 0x4235a000
.long 0x42605be5
.long 0xc2a0809d
.long 0xc09fe5c9
.long 0x42891694
.long 0x429e6361
.long 0x41e43554
.long 0x427037e1
.long 0xc30ff2d0
.long 0xc3050f80
.long 0x4329111a
.long 0x434516d6
.long 0x42b86467
.long 0x42cd1cb8
