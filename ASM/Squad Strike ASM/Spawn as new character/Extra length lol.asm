#To be inserted at 80017be4

.include "Common/common.s"

cmpwi r17,0x6969
ble END
li r17,0
addi r3,r3,1500000
END:
stw r3,0xc(r26)
