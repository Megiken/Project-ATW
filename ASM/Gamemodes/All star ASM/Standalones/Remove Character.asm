#To be inserted at 8032C860

.include "Common/common.s"

backup
load r21,ARnumOfChars
lwz r21,0(r21)
cmpwi r21,0
beq SWAPCHARACTER
cmpwi r17,0x12
bne GOHERE
lbz r20,27(r14)
cmpwi r20,1
bne GOHERE
li r17,0x13
GOHERE:
li r20,1
stbx r20,r17,r14
addi r17,r14,27
li r21,0
stbx r21,r17,r18
SWAPCHARACTER:
li r3,26
branchl r12,0x80380580
lbzx r21,r3,r14
cmpwi r21,1
beq SWAPCHARACTER
cmpwi r3,0x13
bne NOTSHEIK
li r3,0x12
li r21,1
stb r21,27(r14)
NOTSHEIK:
stb r3,0(r16)
li r3,4
branchl r12,randomI
stb r3,1(r16)
restore
blr
