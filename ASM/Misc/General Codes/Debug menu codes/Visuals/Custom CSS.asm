#To be inserted at 8026696c

.include "Common/common.s"

loadwz r20,CSSSkin
compareieq r20,0,END
compareieq r20,6,RANDOM
STORE:
bl TEXT
mflr r3
addi r20,r20,0x2f
stb r20,9(r3)
branchl r12,0x8033796c
compareieq r3,-1,END
bl TEXT
mflr r3
b LOL
RANDOM:
li r3,5
branchl r12,randomI
b STORE

TEXT:
blrl
.string "MnSlChr.00t"
.align 2

END:
addi r3,r31,1804
LOL:
