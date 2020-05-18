#To be inserted at 8032C8c4

.include "Common/common.s"

#input r3 = struct
#input r21 = char byte
#output r17 = true/false

lwz r15,0x4(r3)
cmpwi r15,0
ble YES
mtctr r15
addi r16,r3,0x8
LOOP:
lbz r17,0(r16)
cmpw r17,r21
beq NO
addi r16,r16,4
bdnz LOOP
YES:
li r17,1
b END
NO:
li r17,-1
END:
blr
