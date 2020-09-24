#To be inserted at 8016E480

.include "Common/memcard.s"

extsb r0,r0
cmpwi r0,-1
bne END
backupallnor0
branchl r12,0x8016b558
cmpwi r3,2
bgt LOOP
li r0,-1
restoreallnor0
b END
LOOP:
li r3,4
branchl r12,0x80380580
addi r15,rtoc,spawnVar
lbzx r16,r15,r3
cmpwi r16,0
beq LOOP
li r16,0
stbx r16,r3,r15
mr r0,r3
restoreallnor0
stb	r0, 0x003B (r30)

END:
