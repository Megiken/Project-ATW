#To be inserted at 8032C8f4

.include "Common/common.s"

#input r25 = struct
#input r21 = char byte
#output r17 = true/false

lwz r15,0(r25)
cmpwi r15,0
ble YES
mtctr r15
addi r16,r25,0x4
LOOP:
lbz r17,0(r16)
cmpw r17,r21
beq NO
addi r16,r16,1
bdnz LOOP
YES:
li r17,1
b END
NO:
li r17,-1
END:
blr
