#To be inserted at 8032C860

.include "Common/common.s"

backup
load r21,ARnumOfChars
lwz r21,0(r21)
cmpwi r21,0
beq SWAPCHARACTER
cmpwi r17,0x12
bne GOHERE
addi r20,r14,108
lbzx r20,r18,r20
cmpwi r20,1
bne GOHERE
li r17,0x13
GOHERE:
mulli r17,r17,4
add r17,r17,r18
addi r17,r17,4
li r20,1
stbx r20,r17,r14
addi r17,r14,108
li r21,0
stbx r21,r17,r18
SWAPCHARACTER:
li r3,26
branchl r12,0x80380580
mulli r21,r3,4
add r21,r21,r18
addi r21,r21,4
lbzx r21,r21,r14
cmpwi r21,1
beq SWAPCHARACTER
cmpwi r3,0x13
bne NOTSHEIK
li r3,0x12
li r21,1
addi r17,r18,108
stbx r21,r17,r14
NOTSHEIK:
mulli r17,r18,0x24
add r17,r17,r16
stb r3,0(r17)
li r3,4
branchl r12,randomI
stb r3,1(r17)
restore
blr
